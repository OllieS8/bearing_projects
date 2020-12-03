
# load packages
library(knitr)
library(markdown)
library(rmarkdown)

data <- Apartments2[1:3,]

for (p_id in data$pid){
  rmarkdown::render('./reports/Apartment_Example_Analysis.Rmd',
                    output_file =  paste("report_", p_id, '_', Sys.Date(), ".pdf", sep=''), 
                    output_dir = './reports/loops')
  
}
  

