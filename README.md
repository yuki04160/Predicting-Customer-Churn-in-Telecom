# Predicting Customer Churn in Telecom
Previously, I finished the [EDA - Customer Churn in Telcom](https://github.com/yuki04160/EDA-Customer-Churn-in-Telecom). In this repository, to predict customer churn, I will build a logistic regression and a decision tree in R, and give recommendations to a Telecom company based on analysis results.
## Introduction
Customer churn is defined as the loss of clients. In a telecommunications company, customer attrition is one of the key business metrics. Thus, this project aims to use customer churn analysis to forecast the behavior of telecom customers who are more likely to leave, and provide a reasonable churn prediction for customer retention marketing programs.
## Data Modeling
1. Training (0.7) and Test (0.3) datasets
2. Logistic Regression
   -  Compute Information Values (feature selection)
   -  Detect and solve multicollinearity problem
   -  Decide on optimal prediction probability cutoff
3. Decision Tree
   - Plot and interpret the tree
## Model Evaluation
   - ROC Curve
   - Sensitivity and Specificity
   - Accuracy
   - Precision and Recall
   - F1-Score
   - Feature Importance
## Conclusion
1. Since the company would like to know which customers are highly likely to leave in the future, Logit model 2 performed better since it has a higher AUROC, Sensitivity, Recall, and F1-Score.
2. In terms of significant predictors, “Contract” and “tenure” have the most significant influence on predicting customer churn. Thus, to keep customers, I will suggest the company establish a long-term stable relationship with customers, for example encouraging customers to sign a long-term contract when starting.
3. In the future, since the True Positive Rate of two models are not high enough (0.53 and 0.38), we can keep optimizing models by balancing training dataset, performing regularization regression, tuning decision tree, or using ensemble learning methods.
