# E-Commerce Customer Churn Analysis

## 🌟 Inspiration  
Customer churn is one of the most important metrics in e-commerce, affecting both profitability and growth. Understanding what behaviors and demographics are associated with higher churn helps e-commerce businesses take preemptive action.

---

## 📈 Project Overview  
This project explores a cleaned dataset of e-commerce transactions to uncover behavioral and transactional patterns that contribute to customer churn. The analysis combines SQL-based exploratory data analysis (EDA) with Python-based data cleaning in Jupyter Notebooks.

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

---

## 🔍 Major Findings  
- ❌ Overall churn rate was 20.00%  
- 🛍️ Weekend buyers experienced higher churn rates  
- 🥇 Top 5 customers by spend had near-zero churn  
- 📅 The highest churn rates are experienced in the afternoon, while the lowest are experienced in the evening 
- 🔁 Return behavior and payment method type were strong churn predictors  
- 💰 High spenders in the top 2 quartiles were more loyal

---

## 📌 SQL Queries Used
- Churn rate by product category  
- Average purchase behavior by churn status
- Top 5 customers by total spend
- Churn rate by age group
- Return behavior and its effect on churn rate
- Weekend vs weekday purchases and churn rate
- Daily churn trends
- High spend customers bu quartile
- Payment method churn comparison
- Most common time of day for churned transactions
- Top 3 categories with the highest churn rate
- Product categories that have higher than average churn rates


---

## 📊 Tableau Visualizations

An interactive dashboard was built in Tableau to help stakeholders quickly explore churn trends and customer behavior patterns.

🔗 [**View the Tableau Dashboard here**](https://public.tableau.com/app/profile/jordan.aparece/viz/E-CommerceandCustomerBehavior/ChurnRateDashboard)

### Key Dashboards & Visual Insights:
- **Churn Rate by Product Category** – Visualizes which product categories have higher customer drop-off.
- **Churn by Age Group & Gender** – Segmentation of churn behavior across key demographics.
- **Average Purchase by Churn Status** – Analyzes the differences between Churned and Not-Churned products across the metrics: average quantity, average spent, and average returns.
- **Payment Method Churn Comparison** - Highlights the 4 different methods of payment, the churn rate for those methods, and the count of customers using each respective method.
- **Most Common Time of Day for Churned Transactions** – Shows the churn rates for the different times of the day (morning, afternoon, evening, and night.
- **Top 5 Customers by Total Spend** – Visualization that displays the overall rank, the customer name, the customer ID, and the total amount they spent.
- **Top 3 Categories with the Highest Churn Rate** - Shows the overall rank, the product category, and their average churn rate.
- **Return Behavior and its Effect on Churn Rate** - Compares the returned vs not-returned categories and their respective average churn rate.
- **Weekend vs Weekday Purchases and Churn Rate** - Compares the average churn rate for purchases on the weekend vs the weekday.

These visualizations support the SQL and Python-based findings, making the data more accessible for non-technical stakeholders and driving insight-backed decisions.

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
- Unsupervised segmentation (K-means clustering)  

---

## 📂 Project Files  
- `Data Cleaning.ipynb` – Python-based data cleaning and preparation  
- `ecommerce_customer_data_CLEANED.csv` – Final cleaned dataset  
- `EDA.sql` – All SQL used in this analysis

---

## 🧰 Tools Used  
- **Languages**: SQL (PostgreSQL), Python  
- **Libraries**: pandas 
- **Environments**: Jupyter Notebook, VSCode  
- **Visualization Tool**: Tableau
