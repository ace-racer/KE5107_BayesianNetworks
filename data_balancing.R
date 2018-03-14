# Data Balancing - Undersample to the smallest class, 6
library(ROSE)
setwd('/Users/pierlim/R_Projects/KE5107_BayesianNetworks/')
training_vehicle_safety <- read.csv('training_vehicle_safety.csv')
qplot(training_vehicle_safety$OA_MAIS, geom="histogram", binwidth=0.5)

tvs_0_n_6 <- training_vehicle_safety[training_vehicle_safety$OA_MAIS==0 | training_vehicle_safety$OA_MAIS==6 , ]
data_balanced_under_0 <- ovun.sample(OA_MAIS ~ ., data = tvs_0_n_6, method = "under", N = 138, seed = 1)$data

tvs_1_n_6 <- training_vehicle_safety[training_vehicle_safety$OA_MAIS==1 | training_vehicle_safety$OA_MAIS==6 , ]
data_balanced_under_1 <- ovun.sample(OA_MAIS ~ ., data = tvs_1_n_6, method = "under", N = 138, seed = 1)$data

tvs_2_n_6 <- training_vehicle_safety[training_vehicle_safety$OA_MAIS==2 | training_vehicle_safety$OA_MAIS==6 , ]
data_balanced_under_2 <- ovun.sample(OA_MAIS ~ ., data = tvs_2_n_6, method = "under", N = 138, seed = 1)$data

tvs_3_n_6 <- training_vehicle_safety[training_vehicle_safety$OA_MAIS==3 | training_vehicle_safety$OA_MAIS==6 , ]
data_balanced_under_3 <- ovun.sample(OA_MAIS ~ ., data = tvs_3_n_6, method = "under", N = 138, seed = 1)$data

tvs_4_n_6 <- training_vehicle_safety[training_vehicle_safety$OA_MAIS==4 | training_vehicle_safety$OA_MAIS==6 , ]
data_balanced_under_4 <- ovun.sample(OA_MAIS ~ ., data = tvs_4_n_6, method = "under", N = 138, seed = 1)$data

tvs_5_n_6 <- training_vehicle_safety[training_vehicle_safety$OA_MAIS==5 | training_vehicle_safety$OA_MAIS==6 , ]
data_balanced_under_5 <- ovun.sample(OA_MAIS ~ ., data = tvs_5_n_6, method = "under", N = 138, seed = 1)$data

# Rows rows with OA_MAIS == 6 from data_balanced_under1-5, then stack them
data_balanced_under_1 = data_balanced_under_1[data_balanced_under_1$OA_MAIS==1,]
data_balanced_under_2 = data_balanced_under_2[data_balanced_under_2$OA_MAIS==2,]
data_balanced_under_3 = data_balanced_under_3[data_balanced_under_3$OA_MAIS==3,]
data_balanced_under_4 = data_balanced_under_4[data_balanced_under_4$OA_MAIS==4,]
data_balanced_under_5 = data_balanced_under_5[data_balanced_under_5$OA_MAIS==5,]

data_balanced_under <- rbind(data_balanced_under_0, data_balanced_under_1, data_balanced_under_2, data_balanced_under_3, data_balanced_under_4, data_balanced_under_5)
write.csv(data_balanced_under, file="data_balanced_under.csv")

# Data Balancing - Oversample small classes, Undersample large classes
num_to_hit = sum(table(training_vehicle_safety$OA_MAIS))/7
print("Balance to this value : ");
print(num_to_hit)

# Let's use 2300
tvs_0_n_6 <- training_vehicle_safety[training_vehicle_safety$OA_MAIS==0 | training_vehicle_safety$OA_MAIS==6 , ]
data_balanced_both_0 <- ovun.sample(OA_MAIS ~ ., data = tvs_0_n_6, method = "both", N = 4600, seed = 1)$data

tvs_1_n_6 <- training_vehicle_safety[training_vehicle_safety$OA_MAIS==1 | training_vehicle_safety$OA_MAIS==6 , ]
data_balanced_both_1 <- ovun.sample(OA_MAIS ~ ., data = tvs_1_n_6, method = "both", N = 4600, seed = 1)$data

tvs_2_n_6 <- training_vehicle_safety[training_vehicle_safety$OA_MAIS==2 | training_vehicle_safety$OA_MAIS==6 , ]
data_balanced_both_2 <- ovun.sample(OA_MAIS ~ ., data = tvs_2_n_6, method = "both", N = 4600, seed = 1)$data

tvs_3_n_6 <- training_vehicle_safety[training_vehicle_safety$OA_MAIS==3 | training_vehicle_safety$OA_MAIS==6 , ]
data_balanced_both_3 <- ovun.sample(OA_MAIS ~ ., data = tvs_3_n_6, method = "both", N = 4600, seed = 1)$data

tvs_4_n_6 <- training_vehicle_safety[training_vehicle_safety$OA_MAIS==4 | training_vehicle_safety$OA_MAIS==6 , ]
data_balanced_both_4 <- ovun.sample(OA_MAIS ~ ., data = tvs_4_n_6, method = "both", N = 4600, seed = 1)$data

tvs_5_n_6 <- training_vehicle_safety[training_vehicle_safety$OA_MAIS==5 | training_vehicle_safety$OA_MAIS==6 , ]
data_balanced_both_5 <- ovun.sample(OA_MAIS ~ ., data = tvs_5_n_6, method = "both", N = 4600, seed = 1)$data

# Rows rows with OA_MAIS == 6 from data_balanced_both1-5, then stack them
data_balanced_both_1 = data_balanced_both_1[data_balanced_both_1$OA_MAIS==1,]
data_balanced_both_2 = data_balanced_both_2[data_balanced_both_2$OA_MAIS==2,]
data_balanced_both_3 = data_balanced_both_3[data_balanced_both_3$OA_MAIS==3,]
data_balanced_both_4 = data_balanced_both_4[data_balanced_both_4$OA_MAIS==4,]
data_balanced_both_5 = data_balanced_both_5[data_balanced_both_5$OA_MAIS==5,]

data_balanced_both <- rbind(data_balanced_both_0, data_balanced_both_1, data_balanced_both_2, data_balanced_both_3, data_balanced_both_4, data_balanced_both_5)
write.csv(data_balanced_both, file="data_balanced_both.csv")


# Data Balancing - Just oversample the same classes

tvs_0_n_6 <- training_vehicle_safety[training_vehicle_safety$OA_MAIS==0 | training_vehicle_safety$OA_MAIS==6 , ]
data_balanced_both_0 <- ovun.sample(OA_MAIS ~ ., data = tvs_0_n_6, method = "both", N = 12000, seed = 1)$data

tvs_1_n_6 <- training_vehicle_safety[training_vehicle_safety$OA_MAIS==1 | training_vehicle_safety$OA_MAIS==5 , ]
data_balanced_both_1 <- ovun.sample(OA_MAIS ~ ., data = tvs_1_n_6, method = "both", N = 12000, seed = 1)$data

tvs_2_n_6 <- training_vehicle_safety[training_vehicle_safety$OA_MAIS==2 | training_vehicle_safety$OA_MAIS==4 , ]
data_balanced_both_2 <- ovun.sample(OA_MAIS ~ ., data = tvs_2_n_6, method = "both", N = 12000, seed = 1)$data

tvs_3_n_6 <- training_vehicle_safety[training_vehicle_safety$OA_MAIS==3 | training_vehicle_safety$OA_MAIS==1 , ]
data_balanced_both_3 <- ovun.sample(OA_MAIS ~ ., data = tvs_3_n_6, method = "both", N = 12000, seed = 1)$data

data_balanced_both <- rbind(data_balanced_both_0, data_balanced_both_1, data_balanced_both_2, data_balanced_both_3[data_balanced_both_3$OA_MAIS==3,])
write.csv(data_balanced_both, file="data_balanced_both_2.csv")
