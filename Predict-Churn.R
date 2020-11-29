# Predictive Analysis!of Telco Customer Churn


#---Step 1: Create Training and Testing Samples---

# 1) samples: remove customer ID
samples <- Telco[-1]

# 2) Split into Training (0.7) and Testing (0.3) data
set.seed(0101)
ind <- sample(2, nrow(samples), replace=T, prob=c(0.7, 0.3))
train.samples <- samples[ind==1, ]
test.samples<- samples[ind==2, ]

#3) Double Check if the Churn Rates of Two Sets are Close
prop.table(table(train.samples$Churn))
prop.table(table(test.samples$Churn))


#---Step 2: Compute Information Values---

library(Information)
infoTables <- create_infotables(data = samples,y = 'Churn',parallel = FALSE)
print(infoTables$Summary, row.names=FALSE)


#---Step 3: Logistic Regression---

# 1) Logit Model 1
# Predictors: use IV > 0.1
log.Mod1 <- glm(Churn ~ Contract + tenure + InternetService +
                    PaymentMethod + MonthlyCharges + TotalCharges +
                  PaperlessBilling + OnlineSecurity + TechSupport + 
                  Dependents + Partner + SeniorCitizen,
                data=train.samples, family=binomial(link="logit"))
summary(log.Mod1) #AIC: 4096.4

# 2) Logit Model 1 Diagnostics
# a) Use VIF Function to Check Multicollinearity
library(car)
vif(log.Mod1) # GVIF of tenure and TotalCharges > 10 

# b) Check for Correlation
library(ggplot2)
library(ggcorrplot)
multi.var <- c(5,18,19)
corr <- round(cor(samples[multi.var]), 2) 
ggcorrplot(corr, type="lower",lab = TRUE) 
# TotalCharges has high correlation with tenure and MonthlyCharges

# 3) Logit Model 2 
# Predictors: remove TotalCharges from Model 1
log.Mod2 <- glm(Churn ~ Contract + tenure + InternetService +
                  PaymentMethod + MonthlyCharges +
                  PaperlessBilling + OnlineSecurity + TechSupport + 
                  Dependents + Partner + SeniorCitizen,
                data=train.samples, family=binomial(link="logit"))
summary(log.Mod2) #AIC: 4117.7

# 4) Logit Model 2 Diagnostics
# a) Use VIF Function to Check Multicollinearity
vif(log.Mod2) # all GVIF < 10 

# b) Predict Results
log.Mod2.predict <- plogis(predict(log.Mod2, test.samples)) # Predic results: 0~1

# c) Decide on optimal prediction probability cutoff for the model 2
optCutOff2 <- optimalCutoff(test.samples$Churn, log.Mod2.predict)[1] 
optCutOff2 #0.4944032: score above this is "Yes", below is "No"

# d) ROC Curve: Greater the area, better the predictive ability
plotROC(test.samples$Churn, log.Mod2.predict) #0.8387

#c) Sensitivity and Specificity
sensitivity(test.samples$Churn, log.Mod2.predict, threshold = optCutOff2) #0.533913
specificity(test.samples$Churn, log.Mod2.predict, threshold = optCutOff2) #0.8998086 

#d) Accuracy
predict2.table <- confusionMatrix(test.samples$Churn, log.Mod2.predict, threshold = optCutOff2)
log.Mod2.accuracy <- (predict2.table[1,1]+predict2.table[2,2])/(sum(predict2.table))
log.Mod2.accuracy #0.8015873


#---Step 4: Decision Tree---

# 1) Build decision tree: use same predictors from Logit Model 2
library(rpart.plot)
library(rpart)
tree.formula <- Churn~ Contract + tenure + InternetService + 
  MonthlyCharges + PaymentMethod + PaperlessBilling + 
  OnlineSecurity + Dependents + TechSupport + Partner + SeniorCitizen
tree.rpart <- rpart(tree.formula, data=train.samples,method = 'class')
rpart.plot(tree.rpart)

# 2) Predict Results
# predict results: 0(No)/1(Yes)
tree.predict <- predict(tree.rpart,newdata = test.samples,type ="class")

# 3) Decision Tree Diagnostics
# a) ROC Curve
# change tree.predict type: factor -> numeric
tree.predict=as.numeric(ifelse(tree.predict=="1", 1, 0))
plotROC(test.samples$Churn, tree.predict) #0.6474

# b) Sensitivity, Specificity, and Accuracy
tree1.table <- table(test.samples$Churn, tree.predict)
tree1.sensitivity <- sum(tree1.table[2,2])/sum(test.samples$Churn=="1")
tree1.specificity <- sum(tree1.table[1,1])/sum(test.samples$Churn=="0")
tree1.accuracy <- (tree1.table[1,1]+tree1.table[2,2])/(sum(tree1.table))
tree1.sensitivity #0.3878261
tree1.specificity #0.932993
tree1.accuracy #0.786648

