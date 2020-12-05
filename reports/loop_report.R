
# load packages
library(knitr)
library(markdown)
library(rmarkdown)
data('data_mapping')

# Dataset import --------------------------------------------------------
#import data
data("ApartmentDataR")
Apartments2 <- dplyr::left_join(Apartments, AssessorInfo, by = c("APN" = "APN"))
standardised_data <- Apartments2[!duplicated(Apartments2),] %>% 
  standardise_colnames(data_src='apts',
                       data_mapping) %>% 
  no_br() %>%
  price_per()

data <- readRDS('../data/EPC2020_November.rds')

# Standardise colnames ----------------------------------------------------
standardised_data <- standardise_colnames(data,
                                          data_src = 'epc',
                                          data_mapping)


# Filtering data for reports ----------------------------------------------
# E.G. Only want to get reports for subjects of 1st 3 rows
report_data <- standardised_data[1,]

start <- Sys.time()

# Clustering --------------------------------------------------------------
## Data Preparation
# We need to select columns to feed in to the clustering algorithm, using a select statement. 
# Unfortunately, the algorithm cannot handle missing values (NA), so we need to omit these rows. 
# In the future, we could look to impute these values. All values need to be converted to either numeric 
# (for k-means) or factor (for k-modes). Finally, the lat/lon values (in GPS coords) need to be reprojected
# into a planar projection for the knn algorithm.

# Define k
k <- 10
# Define importance of distance in knn; 1 = only distance, 0 = no distance
l <- 0.5
# m is selected for below

prop_data <- standardised_data %>%
  mutate(year_sold = lubridate::year(sales_date)) %>%
  select(pid,
         address,
         sales_date,
         no_studio,
         gba,
         year_built,
         units,
         ppunit,
         ppsf,
         no_br,
         sales_price,
         zip,
         year_sold,
         longitude,
         latitude) %>%
  na.omit() %>%
  filter(year_built != 0) %>%
  mutate(across(c(no_studio:sales_price), as.numeric),
         across(c(zip:year_sold), as.factor)) %>%
  reproject_latlon() %>%
  as.data.frame()


set.seed(100)

m <- optimal_m(prop_data %>% select(-c(lon,lat,pid,address,sales_date)),
               m_values = 4:10,
               n_start = 1)

clusters <- cknn(
  data = prop_data %>% select(-c(lon,lat,pid,address,sales_date)),
  lon = prop_data %>% pull(lon),
  lat = prop_data %>% pull(lat),
  m = m,
  k = k,
  l = l
)

sales_with_knn <- recombine_data_knn(prop_data, clusters)

# reproject lat/lon to GPS coordinates - use colorado
sales_with_knn <- reproject_latlon(sales_with_knn, old_crs = 3502, new_crs = 4326) %>%
  rename(latitude = lat,
         longitude = lon) %>%
  mutate(m = as.factor(m))

# Report generation -------------------------------------------------------


for (p_id in report_data$pid){
  rmarkdown::render('./reports/analysis_report.Rmd',
                    output_file =  paste(p_id, '_report_', Sys.Date(), ".pdf", sep=''), 
                    output_dir = './reports/loops')
  
}
  
end <- Sys.time()

end - start

