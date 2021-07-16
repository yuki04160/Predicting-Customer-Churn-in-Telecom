# Predicting Customer Churn in Telecom
Previously, I finished the [EDA - Customer Churn in Telcom](https://github.com/yuki04160/EDA-Customer-Churn-in-Telecom) and in this repository, I will build a logistic regression and a decision tree in R to predict customer churn, giving recommendations to a Telecom company based on analysis results.
## Introduction
Customer churn is defined as the loss of clients. In a telecommunications company, customer attrition is one of the key business metrics. Thus, this project aims to use customer churn analysis to forecast the behavior of telecom customers who are more likely to leave, and provide a reasonable churn prediction for customer retention marketing programs.
## Data Modeling
1. Logistic Regression
   -  Compute Information Values
   -  Detect Multicollinearity problem
   -  Decide on optimal prediction probability cutoff
2. Decision Tree
## Model Evaluation
   - ROC Curve
   - Sensitivity and Specificity
   - Accuracy
   - Precision and Recall
   - F1-Score
   - Feature Importance
**Models**|Logit Model 2 | Decision Tree
-----|-----|----- 
**AUROC**|0.8387|0.6474
**Sensitivity**|0.53|0.38
**Specificity**|0.9|0.93
**Accuaracy**|0.8|0.78
**Precision**|0.66|0.68
**Recall**|0.53|0.38
**F1-Score**|0.59|0.49
## Conclusion
1. Logit model 2 performed better since it has a higher AUROC, Sensitivity, Recall, and F1-Score.
2. In terms of significant predictors, “Contract” and “tenure” have the most significant influence on predicting customer churn. Thus, to keep customers, I will suggest the company establish a long-term stable relationship with customers, for example encouraging customers to sign a long-term contract when starting.
3. 
