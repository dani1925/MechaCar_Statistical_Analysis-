# MechaCar Statistical Analysis

## Linear Regession to  Predict MPG.

Within this repository you can find information on 50 different designs of cars built under different mechanical parameters such as:
- Vehicle length
- Vehicle weight
- Spoiler angle
- Ground clearence
- All Wheel Drive
- Thousands per gallon

The objective is to obtain a mathematical model that allows us to predict the MPG based on the previous variables. As a first approximation, the mathematical model is carried out using a linear model.

My first approach was to determine variable by variable if there is a relationship between this selected variable and the mpg using the cor () function first.

## Vehicle Weight vs MPG


    data:  vehicle_weight and mpg
    t = 0.63087, df = 48, p-value = 0.5311
    alternative hypothesis: true correlation is not equal to 0
    95 percent confidence interval:
    -0.1925242  0.3599453
    sample estimates:
        cor 
    0.09068314 
### Hypoteis.
With a COR = 0.09 there´s a weak uphill relationship between V_weight & mpg. 

### Null Hypotesis. 
With a COR = 0.09 there is not  uphill relationship between V_weight & mpg. 


    model=lm(mpg~ vehicle_weight)
    summary(model)
    abline(lm(vehicle_weight~ mpg), col="red", lty="dashed")

    Residuals:
    Min      1Q  Median      3Q     Max 
    -35.816 -11.252  -2.121   8.573  33.201 

    Coefficients:
                    Estimate Std. Error t value Pr(>|t|)    
    (Intercept)    4.042e+01  7.784e+00   5.193 4.17e-06 ***
    vehicle_weight 7.649e-04  1.213e-03   0.631    0.531    
    ---
    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

    Residual standard error: 15.67 on 48 degrees of freedom
    Multiple R-squared:  0.008223,	Adjusted R-squared:  -0.01244 
    F-statistic: 0.398 on 1 and 48 DF,  p-value: 0.5311



### With a P-value of 0.5 theres a strong evidence against the null hypotesis.

The same process was applied to each of the variables to know which variables are really related to mpg.

To repeat this same process in just 2 lines of code

    All_model <- lm(mpg ~ vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD, data )
    summary(All_model)

This checks our previous analysis where it is clearly noted that vehicle weight, spoiler angle & AWD may be introducing noise to our model but even so our model correctly adjusts 71% of the data.


# Summary Statistics on Suspension Coils

Once the new dataset has been loaded, the t.test function is used on a sample size = 20 the mean of the selected sample is 1500.

    data:  suspension_coil_lot1_PSI
    t = 8.7161, df = 49, p-value = 1.568e-11
    alternative hypothesis: true mean is not equal to 1498.78
    95 percent confidence interval:
    1499.719 1500.281
    sample estimates:
    mean of x 
        1500 

The same process is applied for the 3 different batches, and even though the 3 batches give an almost identical mean there is some data to take into account.

An important analysis is required in batch 3 since even though the mean is identical, the deviation of the standard is too high.

# Study Design: MechaCar vs Competition

The following analysis is to compare mpg between the two data sets mentioned above.

The hypothesis is that there is a statistical difference between the two data sets. and therefore prototype cars will on average have better performance. 

We can evaluate these hypotheses by doing a simple t.test () to obtain the p-value and analyze the null hypothesis

        One Sample t-test

    data:  data$mpg
    t = 11.369, df = 49, p-value = 2.4e-15
    alternative hypothesis: true mean is not equal to 20.09062
    95 percent confidence interval:
    40.70303 49.55417
    sample estimates:
    mean of x 
    45.1286 

With a p-value so small that it can be considered as 0, we can say that there is strong evidence against the nuna hypothesis and therefore the prototype cars perform better on average.
