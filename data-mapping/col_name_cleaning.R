library(tidyverse)

load(file = "clean_names_with_data.RData")


nameType <- c("snake", "small_camel", "big_camel", "screaming_snake", "parsed", "mixed", "lower_upper", "upper_lower", "swap", "all_caps", "lower_camel", "upper_camel", "internal_parsing", "none", "flip", "sentence", "random", "title")
nameType2 <- c(snake, small_camel, big_camel, screaming_snake, parsed, mixed, lower_upper, upper_lower, swap, all_caps, lower_camel, upper_camel, internal_parsing, none, flip, sentence, random, title)


glimpse(df2)
 
#EPCNOV_2019_APR30 %>%  
   lapply(EPCNOV_2019_APR30, FUN = janitor::clean_names(~nameType)) %>% names()
 
 %>% map(.f =  janitor::clean_names(~nameType)) 
cleanednames <- EPCNOV_2019_APR30 %>% janitor::clean_names() %>% names() %>% as_tibble()
#clanednames2 <- 
# cleanednames <- 
EPCNOV_2019_APR30 %>% map(., .f = janitor::clean_names(nameType)) %>% names() %>% as_tibble()

clanednames2 %>%  bind_cols(c(., cleanednames)) 

orignames <- names(EPCNOV_2019_APR30)

"snake" <- EPCNOV_2019_APR30 %>% janitor::clean_names("snake") %>% names()
"small_camel"<- EPCNOV_2019_APR30 %>% janitor::clean_names("small_camel") %>% names()
"big_camel"<- EPCNOV_2019_APR30 %>% janitor::clean_names("big_camel") %>% names()
"screaming_snake"<- EPCNOV_2019_APR30 %>% janitor::clean_names("screaming_snake") %>% names()
"parsed"<- EPCNOV_2019_APR30 %>% janitor::clean_names("parsed") %>% names()
"mixed"<- EPCNOV_2019_APR30 %>% janitor::clean_names("mixed") %>% names()
"lower_upper"<- EPCNOV_2019_APR30 %>% janitor::clean_names("lower_upper") %>% names()
"upper_lower"<- EPCNOV_2019_APR30 %>% janitor::clean_names("upper_lower") %>% names()
"swap"<- EPCNOV_2019_APR30 %>% janitor::clean_names("swap") %>% names()
"all_caps"<- EPCNOV_2019_APR30 %>% janitor::clean_names("all_caps") %>% names()
"lower_camel"<- EPCNOV_2019_APR30 %>% janitor::clean_names("lower_camel") %>% names()
"upper_camel"<- EPCNOV_2019_APR30 %>% janitor::clean_names("upper_camel") %>% names()
"internal_parsing"<- EPCNOV_2019_APR30 %>% janitor::clean_names("internal_parsing") %>% names()
"none"<- EPCNOV_2019_APR30 %>% janitor::clean_names("none") %>% names()
"flip"<- EPCNOV_2019_APR30 %>% janitor::clean_names("flip") %>% names()
"sentence"<- EPCNOV_2019_APR30 %>% janitor::clean_names("sentence") %>% names()
"random"<- EPCNOV_2019_APR30 %>% janitor::clean_names("random") %>% names()
"title"<- EPCNOV_2019_APR30 %>% janitor::clean_names("title") %>% names()

# cleanednames2 <-  data.frame( orignames, snake) %>% as_tibble()
# cleanednames2 <- bind_cols(snake, small_camel, big_camel, screaming_snake, parsed, mixed, lower_upper, upper_lower, swap, all_caps, lower_camel, upper_camel, internal_parsing, none, flip, sentence, random, title) 
# cleanednames2 <- bind_cols(orignames, cleanednames2)
# cleanednames2 <-  cleanednames2 %>%  rename("Orig_Names" =  1 )  
# names(cleanednames2) <- nameType

cleanednames2 <- data.frame(orignames, snake, small_camel, big_camel, screaming_snake, parsed, mixed, lower_upper, upper_lower, swap, all_caps, lower_camel, upper_camel, internal_parsing, none, flip, sentence, random, title)
cleanednames2 %>% DT::datatable()


janitor::make_clean_names(snake, "title")
janitor::make_clean_names(orignames, "title")

nameclean <- clipr::read_clip_tbl()

namecleanCL <-  c("Property ID", "Address", "Property Name", "Building", "City", "State", "Zip", "Property Type", "Propertyuse(s)", 
                "Building Size", "Lot Acres", "Source", "Market", "Submarket", "Measurement", "Currency", "Floors", "Year built", "Year renov", "Building class", "# Buildings", "Tenancy", "Occupied %", "Vacancy %", "Const type", "Website", "Parking spaces", "Pkg ratio", "Parking type", "Sprinklers", "Bay depth", "Column spc", "Status", "Property notes", "Buildable area", "Land condition", "Zoning", "Parcel ID", "Topography", "Lot description", "Last sale price", "Last sale date", "Assessed Value", "RE taxes", "Utilities", "Rail status", "Easements", "Minfloorsize-office", "Maxflrsize-office", "GrossLeaseArea-office", "NetRentArea-office", "Frontage-office", "RetailSpace-office", "Corefactor-office", "Passenger-office", "Freightelev-office", "MajorTenants-office", "SpecialFeature-office", "Officesize-Industrial", "percentageoffice-Industrial", "Foundation-Industrial", "Rooftype-Industrial", "HVACtype-Industrial", "Power-Industrial", "DHDoors-Industrial", "Minclear-Industrial", "MajorTenants-Industrial", "Specialfeatures-Industrial", "Minfloorsize-Retail", "Maxflrsize-Retail", "GrossLeaseArea-Retail", "NetRentArea-Retail", "Frontage-Retail", "RetailSpace-Retail", "Corefactor-Retail", "Passenger-Retail", "Freightelev-Retail", "MajorTenants-Retail", "SpecialFeature-Retail", "Unittype1-Multifamily", "Units1-Multifamily", "Avgsize1-Multifamily", "Rent1-Multifamily", "RentSF1-Multifamily", "Unittype2-Multifamily", "Units2-Multifamily", "Avgsize2-Multifamily", "Rent2-Multifamily", "RentSF2-Multifamily", "Unittype3-Multifamily", "Units3-Multifamily", "Avgsize3-Multifamily", "Rent3-Multifamily", "RentSF3-Multifamily", "Unittype4-Multifamily", "Units4-Multifamily", "Avgsize4-Multifamily", "Rent4-Multifamily", "RentSF4-Multifamily", "Unittype5-Multifamily", "Units5-Multifamily", "Avgsize5-Multifamily", "Rent5-Multifamily", "RentSF5-Multifamily", "Unittype6-Multifamily", "Units6-Multifamily", "Avgsize6-Multifamily", "Rent6-Multifamily", "RentSF6-Multifamily", "Unittype7-Multifamily", "Units7-Multifamily", "Avgsize7-Multifamily", "Rent7-Multifamily", "RentSF7-Multifamily", "Unittype8-Multifamily", "Units8-Multifamily", "Avgsize8-Multifamily", "Rent8-Multifamily", "RentSF8-Multifamily", "TotalUnit-multifamily", "Noofkeys", "Avgoccup", "Avgdailyrate", "Rev Par", "Meeting Space", "Franchise", "Franchise Exp", "Amenities-Hospitaliy", "Noofrooms-HealthCare", "Noofbeds", "Avgoccupancy", "Facilitytype", "Amenities-HealthCare", "Unittype1-SeniorHousing", "Units1-SeniorHousing", "Avgsize1-SeniorHousing", "Rent1-SeniorHousing", "RentSF1-SeniorHousing", "Unittype2-SeniorHousing", "Units2-SeniorHousing", "Avgsize2-SeniorHousing", "Rent2-SeniorHousing", "RentSF2-SeniorHousing", "Unittype3-SeniorHousing", "Units3-SeniorHousing", "Avgsize3-SeniorHousing", "Rent3-SeniorHousing", "RentSF3-SeniorHousing", "Unittype4-SeniorHousing", "Units4-SeniorHousing", "Avgsize4-SeniorHousing", "Rent4-SeniorHousing", "RentSF4-SeniorHousing", "Unittype5-SeniorHousing", "Units5-SeniorHousing", "Avgsize5-SeniorHousing", "Rent5-SeniorHousing", "RentSF5-SeniorHousing", "Unittype6-SeniorHousing", "Units6-SeniorHousing", "Avgsize6-SeniorHousing", "Rent6-SeniorHousing", "RentSF6-SeniorHousing", "Unittype7-SeniorHousing", "Units7-SeniorHousing", "Avgsize7-SeniorHousing", "Rent7-SeniorHousing", "RentSF7-SeniorHousing", "Unittype8-SeniorHousing", "Units8-SeniorHousing", "Avgsize8-SeniorHousing", "Rent8-SeniorHousing", "RentSF8-SeniorHousing", "TotalUnit-SeniorHousing", "Noofunits-MobileHomePark", "Density-Mobile", "Resident Type", "Padrentalfee", "Ownrent", "Amenities-Mobile", "Officesize-Specialty", "percentageoffice-Specialty", "Foundation-Specialty", "Rooftype-Specialty", "HVACtype-Specialty", "Power-Specialty", "DHDoors-Specialty", "Minclear-Specialty", "MajorTenants-Specialty", "Specialfeatures-Specialty", "Income/Exp", "Financial year", "Gross income", "Effective gross", "Operating exp", "NOI", "Previk21tax cash", "Income/Exp description", "Debt/Equity", "Loan amount", "Interest rate", "Amortization", "Due date", "Annual debt svc",
                "Down payment", "Debt/Equity description", "Sharing", "Assigned to") %>% janitor::make_clean_names()

nameclean <- janitor::make_clean_names()

nameclean %>% clipr::write_clip()

namecleanGEP <- c("Parcel", "Assr", "Map", "Job", "Greg Notes", "Greg Value Estimate", "G Value Date", "Compare Notes", "Property Location", "Owner Name.1", "Count Imp Code", "County Imp Description", "Distance", "NH", "Eco Area", "Zoning", "Sequence", "Imp Use Count", "Year Built", "Select Imp Use Bldg Area", "Mill Levy 2016", "Est Tax Amount  2016", "Market Value 2016", "Market Value 2017", "MV $/SF", "Market Value Change", "% Value Change", "Land Market Value 2017", "Acreage", "Land $/SF", "Land to Building", "Units", "Avg Unit SF", "MV $/Unit", "Mill Levy 2017", "Est Tax Amount  2017", "Tax Change", "% Tax Change", "Savings Estimate", "Fee", "Est New Value", "Est New Value SF", "ADJSALE", "SP/SF", "SP/Unit", "Reception Number.1", "Sale Date.1", "Sale Price.1", "Pars Sold.1", "Asr Sale Comment.1", "Assessed Value 2017", "Calc Assessed %", "Imp Market Value 2017", "Land Assessed Value 2017", "Imp Assessed Value 2017", "Land Market Value 2016", "Imp Market Value 2016", "Land Assessed Value 2016", "Imp Assessed Value 2016", "Assessed Value 2016", "Land Code", "Land Code Description", "Selected Imp Use Count", "State Imp Code", "State Imp Description", "Imp Market Value", "$/SF Bldg", "Bldg Area", "occ1", "occ2", "class", "grade", "nstor", "walht", "perim", "hvacpr1", "hvacpr2", "sprnk", "Column2", "Column3", "Column4", "Column5", "Column6", "Column7", "Column8", "Column9", "Column10", "Column11", "Column12", "Column13", "Column14", "Column15", "Column16", "Column17", "Column18", "Column19", "Column20", "Column21", "Reception Number.2", "Sale Date.2", "Sale Price.2", "Pars Sold.2", "Asr Sale Comment.2", "Reception Number.3", "Sale Date.3", "Sale Price.3", "Pars Sold.3", "Asr Sale Comment.3", "Reception Number.4", "Sale Date.4", "Sale Price.4", "Pars Sold.4", "Asr Sale Comment.4", "Reception Number.5", "Sale Date.5", "Sale Price.5", "Pars Sold.5", "Asr Sale Comment.5", "Owner Name.2", "Owner Name.3", "Mailing Address", "Mail City", "Mail St", "Mail Zip", "Long", "Lat") %>%
  janitor::make_clean_names()
clipr::write_clip(namecleanGEP)

names_costar_prop_export <- c("PricePerUnit", "Percent1Bed", "Percent2Bed", "Percent3Bed", "% 4-Bed", "PercentStudio", "AffordableRentSubTypeDisplay", "AMENITIES", "ANCHORGLA", "ANCHORTNT", "ARCHSTR", "AVGRNTRATE", "AvgAskingRentPerSqft", "AvgAskingRentPerUnit", "AvgConcessionPercent", "AvgEffectiveRentPerSqft", "AvgEffectiveRentPerUnit", "IndustrialDirectAvgWeightedRent", "OfficeDirectAvgWeightedRent", "RetailDirectAvgWeightedRent", "IndustrialSubletAvgWeightedRent", "OfficeSubletAvgWeightedRent", "RetailSubletAvgWeightedRent", "AvgUnitSize", "ADDRESS", "BLDGCLASS", "BLDGLCTN", "BLDGNAME", "OPREXPENSE", "BLDGPARK", "BLDGSTATUS", "TAXEXPENSE", "CapRate", "CapRate", "CEIL_HT", "CITY_", "TransitStop", "TransitStopCrowDist", "TransitStopWalkTime", "COL_SPACE", "ConfirmedBy", "CONSTMAT", "Contact#lease", "Contact#sale", "CORE", "COUNTYSTR", "CROSSSTRT", "DaysOnMarket", "DEVELPSTR", "DIRCTSFAVL", "DIRSERVS", "DIRSFVACNT", "DRIVE_IN", "EnergyStar", "TAXESSF", "FEATURES", "FORSALEPRC", "FORSALEST", "Four Bedroom Asking Rent/SF", "Four Bedroom Asking Rent/Unit", "Four Bedroom Avg SF", "Four Bedroom Concessions %", "Four Bedroom Effective Rent/SF", "Four Bedroom Effective Rent/Unit", "Four Bedroom Vacancy %", "Four Bedroom Vacant Units", "GAS_", "HEAT", "LEEDCertified", "LANDAREA", "LASTSALEDT", "LASTSALEPR", "LATITUDE", "COADRSSTR", "COCTYSTZIP", "LEASCNTSTR", "LEASECOFAX", "LEASECOSTR", "LEASECOPH", "LONGITUDE", "MRKTNAME", "ApartmentLifestyleTypeDisplay", "MAXCNTGSP", "MAX1FLRSP", "NNN", "Notes", "NMBR1BR", "NMBR2BR", "NMBR3BR", "Number Of 4 Bedrooms", "CRANE", "ELEVATORS", "LOAD_DCK", "PARKSPACES", "STORIES_", "NMBRSTD", "UNITS", "Occupancy", "OccupancySale", "OFFSFAVAIL", "One Bedroom Asking Rent/SF", "One Bedroom Asking Rent/Unit", "One Bedroom Avg SF", "One Bedroom Concessions %", "One Bedroom Effective Rent/SF", "One Bedroom Effective Rent/Unit", "One Bedroom Vacancy %", "One Bedroom Vacant Units", "OPSEXPNS", "OPEXSF", "OWNADRSSTR", "OWNCTYSTZP", "OWNRCNTCT", "OWNERSTR", "OWNCOPH", "PARCELMIN", "PARCELMAX", "PRKRATIO", "ParkingSpacesPerUnit", "PCNTLEASED", "POWER", "LEASECNTST", "PRPMGADRS", "PRPMNGCSZ", "PRPMGRCNTC", "PROPMGRSTR", "PRPMGRPH", "PRPTYID", "BLDGTYPE", "RAILFNC", "ApartmentRentTypeDisplay", "RBA", "SECONDTYPE", "SERIAL", "SERVSTR1", "SEWER_", "MINSFVAL", "SPRINK", "Star Rating", "STATE", "Studio Asking Rent/SF", "Studio Asking Rent/Unit", "Studio Avg SF", "Studio Concessions %", "Studio Effective Rent/SF", "Studio Effective Rent/Unit", "Studio Vacancy %", "Studio Vacant Units", "ApartmentStyleTypeDisplay", "SUBLTSFAVL", "SUBLSERVS", "SUBSFVACNT", "MARKETAREA", "SBMARKET", "Survey Dt-Rent", "Survey Dt-Sale", "TAXYEAR", "TAXESSF", "TAXSTOTL", "Three Bedroom Asking Rent/SF", "Three Bedroom Asking Rent/Unit", "Three Bedroom Avg SF", "Three Bedroom Concessions %", "Three Bedroom Effective Rent/SF", "Three Bedroom Effective Rent/Unit", "Three Bedroom Vacancy %", "Three Bedroom Vacant Units", "BLDGSFAVL", "TotalBuildings", "TOTNEWSTR", "TOTRELSTR", "TOTSUBSTR", "TOT_RIMSTR", "TOT_SIMSTR", "TotalVacantAvailSpaceSF", "Two Bedroom Asking Rent/SF", "Two Bedroom Asking Rent/Unit", "Two Bedroom Avg SF", "Two Bedroom Concessions %", "Two Bedroom Effective Rent/SF", "Two Bedroom Effective Rent/Unit", "Two Bedroom Vacancy %", "Two Bedroom Vacant Units", "TYPFLRSIZE", "VacancyPercent", "WATER_", "YEARBLT", "YEARRENOV_", "BLDGZIP", "ZONING_1") %>% 
  janitor::make_clean_names()
clipr::write_clip(names_costar_prop_export)

####
names_costar_sales <- c("PARCEL1", "PARCEL2", "SELRCAPR", "AGE", "ASKNPRCE", "ASSEIMPR", "ASSELAND", "ASSEVALU", "ASSEYEAR", "BLDGSF", "BLDGCLS", "BLDGCNDT", "BLDGMTRL", "TRBRADRS", "TRBRCITY", "TRBRCMPN", "TRBRCMPN", "TRBRPHON", "TRBRSTPR", "TRBRSTPO", "TRBRSTAT", "TRBRSTNM", "TRBRSTNB", "TRBRZIP", "BUYRADRS", "BUYRCITY", "BUYRCMPN", "BCONTACT", "BUYRPHON", "BUYRSTAT", "BUYRSTNM", "BUYRSTNB", "BUYRSTPR", "BUYRSTPO", "BUYRZIP", "BBROADRS", "BBAGFRST", "BBAGLAST", "BBROCITY", "BBROCMPN", "BBROPHON", "BBROSTAT", "BBROSTNA", "BBROSTNB", "BBROSTPO", "BBROSTPR", "BBROZIP", "CEIL_HT", "COMPID", "COMPNUMB", "CORNER", "COVERAGE", "DESCRTXT", "DOCNUMB", "DOWNPMNT", "SPRINCLR", "FTRDBALN", "FTRDLNDR", "FTRDPMNT", "FTRDTERM", "FloorAreaRatio", "FRONTAGE", "GIM", "GRM", "GRINCOME", "IMPRRATI", "LANDAC", "LANDSF", "LANDIMPRV", "LANDSFGR", "LANDSFNT", "LATITUDE", "LEGALDSC", "LBRKADRS", "LBRKAFFN", "LBRKALN", "LBRKCITY", "LBRKCMPN", "LBRKPHON", "LBRKSTAT", "LBRKSTNA", "LBRKSTNB", "LBRKSTPO", "LBRKSIPR", "LBRKZIP", "LOADDOCK", "LONGITUD", "LOTDIMNS", "MAPCODE", "MAPPAGE", "MAPX", "MAPY", "RMARKET", "MARKET", "MSALENAME", "NETINCME", "BelowMarketSaleReason", "NUMBED1", "NUMBED2", "NUMBED3", "FLOORS", "NUMBEDOT", "NUMPARKSP", "NUMBEROFRO", "STUDIOS", "TENANTS", "UNITS", "BEDR1MIX", "BEDROTHMIX", "PARKRATIO", "PRCTOFFCE", "PRTfCITY", "PRTFCNTY", "PRTFNAME", "PRTFSTAT", "PRTFZIP", "POWER", "PRICEACL", "PRICEASLN", "PRICEROOM", "PRICESF", "PRICESFN", "PRICESFL", "PRICESFLN", "PRICEUNIT", "BUYRCAP", "ADDRESS", "CITY", "COUNTY", "NAME", "STATE", "STRTNAME", "STRTNMBR", "STRTPOSD", "STRTPRED", "ZIPCODE", "PROPTYPE", "PROPOSEDLA", "DATEPDCT", "RAILLINE", "RECDATE", "DATECONF", "RESRCHSTA", "ROOFTYPE", "SALECNDT", "SALEDATE", "SALEPRCE", "PRCECOMM", "STATUS", "STDBALNC", "STDLENDR", "STDPMNT", "STDTRMS", "SECTYPE", "TRSLADRS", "TRSLCITY", "TRSLCMPN", "TRSLCMPN", "TRSLPHON", "TRSLSTPR", "TRSLSTPO", "TRSLSTAT", "TRSLSTNM", "TRSLSTNB", "TRSLZIP", "SELRADRS", "SELRCITY", "SELRCMPN", "SCONTACT", "SELRPHON", "SELRSTAT", "SELRSTNA", "SELRSTNB", "SELRSTPO", "SELRSTPR", "SELRZIP", "SIZE", "STAMP", "Star Rating", "SUDIOMIX", "CLUSTER", "SUBMRKTC", "SUBMRKTN", "TENANCY", "BEDR3MIX", "TCOMPNAM", "TOTEXPAM", "TRNNOTES", "TRNSFTAX", "BEDR2MIX", "TYPFLOOR", "UNITSAC", "VACANCY", "YRBUILT", "ZONING") %>% 
  janitor::make_clean_names()
clipr::write_clip(names_costar_sales)


clipr::write_clip(cleanednames2)


####
dellNames <- clipr::read_clip_tbl()
dellNames2 <- dellNames %>% as_tibble() %>% select(-3)

glimpse(dellNames2)
dellNames3 <- dellNames2 %>% select(1) %>% janitor::clean_names()

dell3smallcamel <- dellNames2$renamed %>% janitor::make_clean_names("small_camel")
dell3bigcamel <- dellNames2$renamed %>% janitor::make_clean_names("big_camel")
dell4smallcamel <- dellNames2$original %>% janitor::make_clean_names("big_camel")
dell4bigcamel <- dellNames2$original %>% janitor::make_clean_names("big_camel")

delldfclean <- data.frame(dell3, dell3smallcamel, dell3bigcamel, dell4, dell4smallcamel, dell4bigcamel)

clipr::write_clip(delldfclean)


####
costarNames <- clipr::read_clip_tbl()
costarNames <- costarNames %>% as_tibble() %>% select(-2,-4)

glimpse(costarNames)


A_snake <- costarNames$Costar.Fields..Property. %>% janitor::make_clean_names("snake")
A_smallcamel <- costarNames$Costar.Fields..Property. %>% janitor::make_clean_names("small_camel")
A_bigcamel <-  costarNames$Costar.Fields..Property. %>% janitor::make_clean_names("big_camel")
A_title <-  costarNames$Costar.Fields..Property. %>% janitor::make_clean_names("title")
A_none <-  costarNames$Costar.Fields..Property. %>% janitor::make_clean_names("none")

B_snake <- costarNames$Costar.Pub.Record.Fileds %>% janitor::make_clean_names("snake")
B_smallcamel <-costarNames$Costar.Pub.Record.Fileds %>% janitor::make_clean_names("small_camel")
B_bigcamel <- costarNames$Costar.Pub.Record.Fileds %>% janitor::make_clean_names("big_camel")
B_title <- costarNames$Costar.Pub.Record.Fileds %>% janitor::make_clean_names("title")
B_none <- costarNames$Costar.Pub.Record.Fileds %>% janitor::make_clean_names("none")

C_snake <- costarNames$Costar.Sales.2020 %>% janitor::make_clean_names("snake")
C_smallcamel <-costarNames$Costar.Sales.2020 %>% janitor::make_clean_names("small_camel")
C_bigcamel <- costarNames$Costar.Sales.2020 %>% janitor::make_clean_names("big_camel")
C_title <- costarNames$Costar.Sales.2020 %>% janitor::make_clean_names("title")
C_none <- costarNames$Costar.Sales.2020 %>% janitor::make_clean_names("none")


costarNameClean <- data.frame(A_snake, A_smallcamel, A_bigcamel, A_title, A_none, B_snake, B_smallcamel, B_bigcamel, B_title, B_none, C_snake, C_smallcamel, C_bigcamel, C_title, C_none) %>% as_tibble()

clipr::write_clip(costarNameClean)

save.image(file = "clean_names_with_data.RData")
