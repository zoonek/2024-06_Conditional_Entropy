data: raw/data_ml.csv

raw/data_ml.RData: 
	mkdir -p raw data
	wget -nc -O raw/data_ml.RData https://github.com/shokru/mlfactor.github.io/raw/master/material/data_ml.RData

raw/data_ml.csv: raw/data_ml.RData
	Rscript 1_Data.R

