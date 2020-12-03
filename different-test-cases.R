library(bearing)
library(dplyr)
library(sf)

list.files('../Data cleaning/data/rds_files')

# data preparation --------------------------------------------------------
apt <- readRDS('../Data cleaning/data/rds_files/apartments.rds') %>%
  janitor::clean_names() %>% 
  dplyr::rename(pid = apn) %>% 
  no_br() %>% 
  price_per() %>% 
  mutate(year_sold = lubridate::year(date_sold)) %>%
  select(pid,
         address,
         sq_ft,
         # ppunit,
         price_sold,
         zip,
         longitude,
         latitude) %>%
  na.omit() %>%
  # filter(yr_blt != 0) %>%
  mutate(across(c(sq_ft:price_sold), as.numeric),
         across(c(zip), as.factor)) %>% 
  reproject_latlon() %>% 
  as.data.frame()

define_subject(apt,
               subject_pid = '444-373-06-00')


# Setting up test cases ---------------------------------------------------
var_weights <- list(c(NULL),
                   c('sq_ft' = 1,
                     # 'ppunit'= 2,
                     'price_sold' = 10,
                     'zip' = 1),
                   c('sq_ft' = 10,
                     # 'ppunit'= 5,
                     'price_sold' = 1,
                     'zip' = 1))

# clustering --------------------------------------------------------------
run_cknn <- function(var_weights){
  set.seed(100)
  print(var_weights)
  m <- optimal_m(apt %>% select(-c(lon,lat,pid,address)),
                 m_values = 4:10,
                 n_start = 1)
  
  cknn(
    data = apt %>% select(-c(lon,lat,pid,address)),
    lon = apt %>% pull(lon),
    lat = apt %>% pull(lat),
    m = m,
    k = 10,
    l = 0.5,
    var_weights = var_weights
  )
}

clusters <- lapply(var_weights, run_cknn)

# recombining data --------------------------------------------------------
accessing_knn <- function(cluster){
  cluster$knn
}

accessing_cluster <- function(cluster){
  cluster$kproto$cluster
}

knns <- lapply(clusters, accessing_knn)
ms <- lapply(clusters, accessing_cluster)


sales_with_knn <- apt %>% 
  mutate(knn1 = knns[[1]],
         knn2 = knns[[2]],
         knn3 = knns[[3]],
         m1 = ms[[1]],
         m2 = ms[[2]],
         m3 = ms[[3]]) %>% 
  rename(latitude = lat, longitude = lon) %>% 
  reproject_latlon(old_crs = 3502, new_crs = 4326) %>%
  rename(latitude = lat,
         longitude = lon)

# subj_cluster <- get_subj_cluster(sales_with_knn, subject_pid)
# sales_nn <- get_nn(sales_with_knn, subject_pid)

# plant -------------------------------------------------------------------
library(ggplot2)
ggplot(sales_with_knn, aes(x=price_sold, y = sq_ft, color = as.factor(m3))) +
  geom_point()

# exporting to csv --------------------------------------------------------
# set_lists_to_chars <- function(x) {
#   paste(unlist(x), sep='', collapse=', ')
# }
# test <- sales_nn
# 
# test$knn <- mapply(set_lists_to_chars, sales_nn$knn)
