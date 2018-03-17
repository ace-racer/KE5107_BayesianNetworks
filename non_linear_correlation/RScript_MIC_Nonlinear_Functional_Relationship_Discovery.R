#Rscript to follow MIC (MAX Information Coefficient) tecnhique to discever functional relationship between variables
#In statistics, the maximal information coefficient (MIC) is a measure of the strength of the linear or non-linear association between two variables X and Y.
#Alternative are Distance correlation, HHG, HISC
#specific stuff

rm(list=ls())
setwd("C:/Users/RyanTsan/GithubLocal/KE5107_BayesianNetworks/non_linear_correlation")
getwd()


## Loading needed libraries
library(funModeling) ## contains heart_disease data
library(minerva) ## contains MIC statistic
library(ggplot2)
library(dplyr)
library(reshape2) 
library(gridExtra) ## allow us to plot two plots in a row
library(xlsx)
options(scipen=999) # disable cientific notation


#Load file
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
#cleared of all cat variable


ans= mine(df,n.cores=2)

temp_Str=getwd()
temp_Str = cbind(temp_Str,"Max_Information_Coefficient_Results.csv")
directory_Str = paste(temp_Str,collapse='/')

write.xlsx2(ans[["MIC"]], directory_Str, sheetName = "MIC",
            col.names = TRUE, row.names = TRUE, append = FALSE)


write.xlsx2(ans[["MICR2"]], directory_Str, sheetName = "MIC_R2",
            col.names = TRUE, row.names = TRUE, append = FALSE)

# #Test
# for (row in 1:nrow(stock)) {
#   price <- stock[row, "apple"]
#   date  <- stock[row, "date"]
# 
#   if(price > 117) {
#     print(paste("On", date,
#                 "the stock price was", price))
#   }
# }
# 
# > x=NULL  #  could also use x <- c()
# 
# > rbind(x, c(1,2))
# [,1] [,2]
# [1,]    1    2
# > x <- rbind(x, c(1,2))
# > x <- rbind(x, c(1,2))  # now extend row-wise
# > x
# [,1] [,2]
# [1,]    1    2
# [2,]    1    2
# > x <- cbind(x, c(1,2))  # or column-wise
# > x
# [,1] [,2] [,3]
# [1,]    1    2    1
# [2,]    1    2    2

