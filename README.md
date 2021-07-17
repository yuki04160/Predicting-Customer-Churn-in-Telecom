# Predicting Customer Churn in Telecom
Previously, I finished the EDA: [EDA-Customer Churn in Telcom](https://github.com/yuki04160/EDA-Customer-Churn-in-Telecom), and now to predict customer churn, I built a logistic regression and a decision tree in R using the same Kaggle dataset [Telco Customer Churn](https://www.kaggle.com/blastchar/telco-customer-churn).
## Introduction
Customer churn is defined as the loss of clients. In a telecommunications company, customer attrition is one of the key business metrics. Thus, this project aims to predict customer churn, use customer churn analysis to forecast the behavior of telecom customers who are more likely to leave, and give some data-driven recommendations .
## Data Modeling
1. Split into training (0.7) and test (0.3)
2. Logistic regression
   -  Compute information values (feature selection)
   -  Detect and solve multicollinearity problem
   -  Decide on optimal prediction probability cutoff
3. Decision Tree
   - Plot and interpret the tree
## Classification Model Evaluation
   - ROC curve
   - Sensitivity and Specificity
   - Accuracy
   - Precision and Recall
   - F1-Score
   - Feature importance
## Conclusion
1. Since the company would like to know which customers are highly likely to leave in the future, Logit model 2 performed better since it has a higher AUROC, Sensitivity, Recall, and F1-Score.
2. In terms of significant predictors, overall, “Contract” and “tenure” have the most significant influence on predicting customer churn. Thus, to keep customers, I will suggest the company establish a long-term stable relationship with customers, for example encouraging customers to sign a long-term contract when starting.
3. In the future, since the True Positive Rate of two models are not high enough (0.53 and 0.38), I can keep optimizing models by balancing training dataset, performing regularization regression, tuning decision tree, or using ensemble learning methods.
