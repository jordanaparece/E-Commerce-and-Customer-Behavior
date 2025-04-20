# E-Commerce Customer Churn Analysis

## 🌟 Inspiration  
Customer churn is one of the most important metrics in e-commerce, affecting both profitability and growth. Understanding what behaviors and demographics are associated with higher churn helps e-commerce businesses take preemptive action.

---

## 📈 Project Overview  
This project explores a cleaned dataset of e-commerce transactions to uncover behavioral and transactional patterns that contribute to customer churn. The analysis combines SQL-based exploratory data analysis (EDA) with Python-based data cleaning and modeling in Jupyter Notebooks.

**Main Business Question:**  
> What behavioral and transactional factors most strongly correlate with customer churn, and how do they vary by demographic and shopping patterns?

---

## 📊 Data Overview  
The dataset `ecommerce_customer_data_CLEANED.csv` contains the following features:

- `customer_id`, `customer_name`
- `purchase_date`, `product_category`, `product_price`, `quantity`, `total_value`
- `returns`, `payment_method`, `churn`
- `age`, `customer_age`, `gender`
- Derived features: `time_of_day`, `is_weekend`, `was_returned`, `spend_bucket`, etc.

---

## ⚙️ Methods  
- **SQL (PostgreSQL)**: Used for querying, grouping, filtering, CTEs, subqueries, and window functions  
- **Python (Jupyter Notebook)**: Used for data cleaning, feature engineering  
- **EDA Techniques**: Aggregation, segmentation, rolling metrics, customer ranking  
- **Window Functions**: For churn trends, quartile segmentation, product ranking

---

## 🔍 Major Findings  
- ❌ Overall churn rate was ~24.6%  
- 🛍️ Top product categories and weekend buyers experienced higher churn rates  
- 🥇 Top 5 customers by spend had near-zero churn  
- 📅 Daily churn trends showed spikes midweek and evenings  
- 🔁 Return behavior and payment method type were strong churn predictors  
- 💰 High spenders in the top 2 quartiles were more loyal

---

## 📌 Key SQL Queries  
- Churn rate by product category  
- Average purchase behavior by churn status  
- Customer ranking by spend (RANK() window function)  
- Churn by age group (with CASE + CTE)  
- Daily churn rate with 7-day rolling average  
- Top 3 product categories by return rate (RANK())  
- Categories with above-average churn (subquery in HAVING)

---

## ⚠️ Limitations  
- `purchase_date` lacks timezone or session context  
- `returns` field treated as binary; doesn’t capture return reasons  
- Some missing values were imputed for gender and age  
- No session or behavior tracking beyond transaction data

---

## 🔭 Further Investigation  
- Predictive modeling (e.g., logistic regression, XGBoost, or random forest)  
- Time-series churn forecasting (e.g., ARIMA, Prophet, LSTM)  
- Unsupervised segmentation (K-means, DBSCAN)  
- Tableau or Streamlit dashboard for stakeholder insights  
- A/B testing to reduce churn via interventions

---

## 📂 Project Files  
- `Data Cleaning.ipynb` – Python-based data cleaning and preparation  
- `ecommerce_customer_data_CLEANED.csv` – Final cleaned dataset  
- `Churn_SQL_Queries.sql` – All SQL used in this analysis

---

## 🧰 Tools Used  
- **Languages**: SQL (PostgreSQL), Python  
- **Libraries**: pandas, seaborn, matplotlib, scikit-learn  
- **Environments**: Jupyter Notebook, VSCode  
- **Optional**: Tableau (for future dashboard)

---

## 🤝 Collaboration  
Open to feedback, improvements, and collaboration ideas! Feel free to fork or reach out with suggestions.
