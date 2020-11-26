# library
library(tidyverse)
library(lubridate)
library(DT)

#@ set path  if not in reval project
path <- "C:/Dropbox/BCA/Data/R Projects/BCA_PRODUCTION/EPC_2019_Reval/"
path <- '/Users/oliversummers/Dropbox/Upwork_Ollie_BCA_R Scripting (1)/data/'
# load data

load(glue::glue(path, "EPC2019_NOV.RData"))

year <- "2020-11-20" %>% as_date() %>% year()

df <- EPCNOV_2019_APR30 %>% 
  filter(IMPSTATEDESCR == 'MERCHANDISING') %>% 
  mutate(age = year - YrBlt)

parcels <- df[['PARCEL']]

# map through parcels function ------------------------------------------------------------
process <- function(subj_apn){
  subj_dat <- df %>% filter(PARCEL == subj_apn)
  
  cms2 <- df  %>%  
    filter(IMPSTATECODE == subj_dat$IMPSTATECODE,
          between(IMPSQFT, subj_dat$IMPSQFT/2, subj_dat$IMPSQFT*2),
          between(age, subj_dat$age - 10,  subj_dat$age + 10), 
          IMPCount == 1, 
          IMPLOCALCODE == "NC") %>% 
    relocate(PARCEL,LOCATION, LOCATIONZIP, CmntyArea, IMPLOCALCODE, YrBlt, Acreage, LandToBldg, MVSF, IMPSQFT)
  
  bind_rows(subj_dat, cms2) 
}

map_start <- Sys.time()
processed_results <- map(parcels, process)
map_end <- Sys.time()
map_end-map_start


for(i in 1:length(parcels)){
  export <- as.data.frame(processed_results[i])
  
  write_csv(export, file= paste(parcels[i],'.csv', sep=''))
  writexl::write_xlsx(export, path =   paste(parcels[i],'.xlsx', sep=''))
}

# 
# glimpse(subj_dat)


# filter cms

#
summary(cms)

# summaries ---------------------------------------------------------------


# filter cms
cms2 <- cms %>% filter(between(IMPSQFT, subj_dat$IMPSQFT/2, subj_dat$IMPSQFT*2),
                       between(age, subj_dat$age - 10,  subj_dat$age + 10), 
                       IMPCount == 1, 
                       IMPLOCALCODE == "NC") %>% 
          relocate(PARCEL, LOCATION, LOCATIONZIP, CmntyArea, IMPLOCALCODE, YrBlt, Acreage, 
                   LandToBldg,
                   MVSF,
                   IMPSQFT)

# cms2_summary <- cms2 %>% summarytools::descr() %>% as_tibble()
# 
# 
#    Dtable <- function(df) {
#      df %>%  relocate(PARCEL, LOCATION, LOCATIONZIP, CmntyArea, IMPLOCALCODE, YrBlt, Acreage, 
#                       LandToBldg, 
#                       MVSF, 
#                       IMPSQFT) %>%  
#            datatable() 
#       }
# 
#     Dtable(cms2) 
#    
export <- bind_rows(subj_dat, cms2) 

write_csv(export, file = "output/6321407008-Park Place tax_comps.csv")

writexl::write_xlsx(export, path =  "output/6321407008-Park Place tax_comps.xlsx")


# for loop ----------------------------------------------------------------
start <- Sys.time()
for_test <- list()
i <- 1

for(subj_apn in parcels){
  subj_dat <- df %>% filter(PARCEL == subj_apn)
  
  for_test[[i]] <- bind_rows(subj_dat
                             , 
                             df  %>%  filter(IMPSTATECODE == subj_dat$IMPSTATECODE,
                                             between(IMPSQFT, subj_dat$IMPSQFT/2, subj_dat$IMPSQFT*2),
                                             between(age, subj_dat$age - 10,  subj_dat$age + 10), 
                                             IMPCount == 1, 
                                             IMPLOCALCODE == "NC") %>% 
                               relocate(PARCEL, LOCATION, LOCATIONZIP, CmntyArea, IMPLOCALCODE, YrBlt, Acreage, 
                                        LandToBldg,
                                        MVSF,
                                        IMPSQFT))
  i <- i+1
}
end <- Sys.time()
end - start
