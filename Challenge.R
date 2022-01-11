library(dplyr)
library(ggplot2)

data <- read.csv('files/MechaCar_mpg.csv')

#----Verify is there a relation between v_weight & mpg
attach(data)
cor(vehicle_weight, mpg)
cor.test(vehicle_weight,mpg)
plot(mpg, vehicle_weight)

#COR = 0.09 SO THERES A WEAK RELATIONSHIP BETWEEN V_WEIGHT  & MPG

model=lm(mpg~ vehicle_weight)
summary(model)
abline(lm(vehicle_weight~ mpg), col="red", lty="dashed")

# with a P-value of 0.5 theres a strong evidence against the null hypotesis, 
#------------------------------------------------------------

#----Verify is there a relation between v_lenght & mpg
cor(vehicle_length, mpg)
cor.test(vehicle_length,mpg)
plot(mpg, vehicle_length)

#COR = 0.60 SO THERES A Moderate positive RELATIONSHIP BETWEEN V_LenghT  & MPG

model2=lm(mpg~ vehicle_length)
summary(model2)
abline(lm(vehicle_length~ mpg), col="red", lty="dashed")

# with a P-value of  2.632e-06 i cant reject that 
#theres no relationship between v_lenght & mpg
#--------------------------------------------------------------------

#----Verify is there a relation between spoiler_angle & mpg
cor(spoiler_angle, mpg)
cor.test(spoiler_angle,mpg)
plot(mpg, spoiler_angle)

#COR = -0.02 SO THERES NO RELATIONSHIP BETWEEN spoiler_angle  & MPG
#Test hypoteis

model3=lm(mpg~ spoiler_angle)
summary(model3)
abline(lm(spoiler_angle~ mpg), col="red", lty="dashed")

# with a P-value of 0.88 theres a strong evidence against the null hypotesis, 
#---------------------------------------------------------------------

#----Verify is there a relation between ground_clearence & mpg

cor(ground_clearance, mpg)
cor.test(ground_clearance,mpg)
plot(mpg, ground_clearance)

#COR = 0.32 SO THERE´S a weak uphill linear relationship BETWEEN ground_clearence & MPG
#Test hypoteis

model4=lm(mpg~ ground_clearance)
summary(model4)
abline(lm(ground_clearance~ mpg), col="red", lty="dashed")

# with a P-value of 0.019 strong evidence agaists null hypotesis
#-------------------------------------------------------------------

#----Verify is there a relation between  AWD & mpg
aggregate(data$mpg, list(data$AWD), FUN=mean)

#AWD=1  mpg mean = 42.94
#AWD=0 mpg mean = 47.31


#AL VARIABLES MODEL
All_model <- lm(mpg ~ vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD, data )
summary(All_model)

##############################################################################
#-----------------------SUSPENSION COIL---------------------------------------
##############################################################################

suspension_coil <- read.csv('files/Suspension_Coil.csv')

total_summary <- suspension_coil %>% summarize(Mean=mean(PSI),Median = median(PSI),Variance = var(PSI),SD = sd(PSI))

lot_summ <- suspension_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median = median(PSI),Variance = var(PSI),SD = sd(PSI),.groups = 'keep')

suspension_coil_sample <- sample(suspension_coil$PSI,20)

t.test(x = suspension_coil_sample,mu = total_summary$Mean)
suspension_coil_lot1_PSI <- subset(suspension_coil,Manufacturing_Lot == "Lot1", PSI)
suspension_coil_lot2_PSI <- subset(suspension_coil,Manufacturing_Lot == "Lot2", PSI)
suspension_coil_lot3_PSI <- subset(suspension_coil,Manufacturing_Lot == "Lot3", PSI)
t.test(x = suspension_coil_lot1_PSI, mu = total_summary$Mean)
t.test(x = suspension_coil_lot2_PSI, mu = total_summary$Mean)
ggplot(mtcars,aes(x=mpg))+geom_density()

t.test(x = suspension_coil_lot3_PSI, mu = total_summary$Mean)
