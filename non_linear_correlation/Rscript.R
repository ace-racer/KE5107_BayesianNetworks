#specific stuff
setwd("C:/Users/RyanTsan/GithubLocal/KE5107_BayesianNetworks/non_linear_correlation")
getwd()

#Libraries
library(PerformanceAnalytics)


rm(list=ls())

temp_Str=getwd()
temp_Str = cbind(temp_Str,"vehicle_safety_imputed_data.csv")
directory_Str = paste(temp_Str,collapse='/')
df <- read.csv(directory_Str)

#remove first col
df <-df[,-1]
#remove by name col
df <-subset(df,select=-c(GV_WGTCDTR,OA_BAGDEPLY))
df <-subset(df,select=-c(OA_SEX,VE_GAD1))
df <-subset(df,select=-c(GV_LANES,OA_MANUSE,OA_MAIS))
dfg <- df[,-c(5:14)]
#cleared of all cat variables

#now moving towards correlation scatterplot
#chart.Correlation(dfg, bg=c("blue","red","yellow","brown","cyan","gold","orange")[df$OA_MAIS], pch=27)
#chart.Correlation(dfg, pch=21)
chart.Correlation(df, method=c("pearson"))