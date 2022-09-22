library(dplyr)

# Deliverable 1

#load/create data set
mechacar <- read.csv(file='MechaCar_MPG.csv',check.names = F,stringsAsFactors = F)

#examine data set
head(mechacar)

#run multiple linear regression model predicting mpg using all columns with mechacar as data
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechacar)

#retrieve summary statistics for MLR Model 
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechacar))






# Deliverable 2

#load/create data set
suspension <- read.csv(file='Suspension_Coil.csv',check.names = F,stringsAsFactors = F)

#examine data set
head(suspension)

#create a summary of PSI's basic summary statistics
total_summary <- suspension %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

#create a summary of PSI's basic summary statistics grouped by each lot
lot_summary <- suspension %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))




# Deliverable 3

#t-test to determine if PSI across all lots are statistically different than population mean
t.test(suspension$PSI, mu=1500)

#t-test to determine if PSI across each manufacturing lot is statistically different than population mean
t.test(subset(suspension, Manufacturing_Lot == "Lot1")$PSI, mu=1500)
t.test(subset(suspension, Manufacturing_Lot == "Lot2")$PSI, mu=1500)
t.test(subset(suspension, Manufacturing_Lot == "Lot3")$PSI, mu=1500)




