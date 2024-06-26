##
## Convert the data from *.RData (should have been *.Rds) to *.csv
## 
## Input:  raw/data_ml.RData
## Output: raw/data_ml.csv
## 
## Source: mlfactor.github.io/material/data_ml.RData
##

library(data.table)
library(dplyr)

LOG <- function (...) 
  cat(as.character(Sys.time()), " ", ..., "\n", sep = "")

filename <- "raw/data_ml.RData"
LOG( "Reading ", filename )
( load("raw/data_ml.RData") )

LOG( "  Rows: ", nrow(data_ml) )
LOG( "  Columns: ", nrow(data_ml) )
str(data_ml)

LOG( "Compute the excess returns" )
data_ml <- data_ml %>% group_by(date) %>% mutate( R1M_Rel = log1p(R1M_Usd) - mean(log1p(R1M_Usd)) )
data_ml <- as.data.frame(data_ml)

filename <- "raw/data_ml.csv"
LOG( "Writing ", filename )
write.csv(data_ml, filename, row.names = FALSE)

LOG( "Done." )


