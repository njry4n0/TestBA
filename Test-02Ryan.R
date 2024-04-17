# Read in the Lung Cap Data
data <- read.csv("LungCapData.csv")
library(ggplot2)
library(car)
#-----------------------------------
# About This Data
# This data is showing lungs capacity of smokers and non-smokers by age, 
# gender and height.

# Here's the meaning of variables:
# LungCap: It’s the lung capacity(closing capacity) of the person
# Age: It’s how old is the person
# Height: It’s how tall is the person
# Smoke: If the person smokes or doesn’t smoke
# Gender: If are male or female
# Cesarean: If they’re born by Cesarean
#-----------------------------------

# To understand the data, get the structure of the data 


# Question 1: What is the response variable in this dataset?
head(data)
#The DV in this data set would be LungCap

# Question 2: How many predictor variables are there in this dataset?
#Age, Height, Smoke, Gender, Caesarean


# Question 3: Is "Smoke" a categorical or numerical predictor variable?
#Categorical


# Question 4: Create a scatterplot to visualize the relationship between "Age" 
# and "LungCap".
ggplot(data, aes(x=Age, y=LungCap)) + 
    geom_point() + 
    geom_smooth(method='lm', formula=y~x, color='blue')


# Question 5: What is the correlation coefficient between "Height" and "LungCap"?
model1 <- lm(LungCap ~ Height, data=data)
summary(model1)
# 0.337157

# Question 6: Perform a multiple regression analysis with "LungCap" as 
# the response variable and all other variables as predictors.
modelMulti1 <- lm(LungCap ~ Age + Height+Smoke+Gender+Caesarean, data=data)
summary(modelMulti1)


# Question 7: What is the adjusted R-squared value of the multiple 
# regression model?
#Adjusted R-squared:  0.8532


# Question 8: Is there a significant relationship between "Smoke" and "LungCap" 
# in the multiple regression model?
#Given the small P Value 1.60e-06 we can conclude that there is a significant relationship between smoking and lung capacity.


# Question 9: What is the coefficient estimate for "Age" in the multiple 
# regression model?
#0.16053


# Question 10: Perform a diagnostic plot to check for assumptions of the 
# multiple regression model.
vif_values1 <- vif(modelMulti1)
print(vif_values1)

modelMulti2 <- lm(LungCap ~ Age + Height+Smoke+Gender+Caesarean, data=data)
summary(modelMulti2)

vif_values2 <- vif(modelMulti2)
print(vif_values2)



