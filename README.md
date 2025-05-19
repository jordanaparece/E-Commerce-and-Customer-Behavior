# Connecticut Drug-Related Deaths Analysis

## 🌟 Inspiration
Understanding the factors behind drug-related deaths is essential for public health agencies aiming to reduce opioid fatalities. By exploring demographic and geographic patterns, this project helps uncover where and why high-risk overdoses are happening—supporting targeted interventions.

---

## 📈 Project Overview
This project investigates opioid-related and non-opioid-related deaths in Connecticut using a cleaned dataset of medical examiner records. The analysis blends SQL-based EDA with Python-based data cleaning to highlight trends, risk factors, and actionable geographic and demographic insights.

**Main Business Question:**  
*What demographic and geographic factors most strongly correlate with high-risk opioid-related deaths in Connecticut, and how can public health outreach be optimized to reduce future deaths?*

---

## 📊 Data Overview
Dataset Link: https://catalog.data.gov/dataset/accidental-drug-related-deaths-2012-2018
The dataset `Cleaned_Drug_Deaths.csv` includes the following types of features:

- **Demographics:** `age`, `sex`, `ethnicity`, `age_group`
- **Location Info:** `residence_city`, `injury_city`, `death_city`, `county`, `state`
- **Drug Presence (Y/N):** `heroin`, `fentanyl`, `cocaine`, `methadone`, etc.
- **Death Context:** `manner_of_death`, `cause_of_death`, `injury_place`, `description_of_injury`
- **Derived Variables:** `weekday`, `residencecitygeo`, `injurycitygeo`, `deathcitygeo`

---

## ⚙️ Methods
- **SQL (PostgreSQL):** CTEs, window functions, filters, subqueries
- **Python (Jupyter Notebook):** Missing value handling and standardization
- **EDA Techniques:** Aggregation, classification, temporal trend analysis, ranking

---

## 🔍 Major Findings
- 📈 Opioid-related deaths increased significantly over time
- 🧑‍🦱 Adults aged 25–44 are at highest risk for fentanyl and heroin involvement
- 🗺️ Cities like Hartford and New Haven exceed average fatality counts
- 🕑 Most deaths occurred on weekends
- 🧭 In 2022, New Haven and Hartford counties reported the most opioid deaths with 537

---

## 📌 SQL Queries Used
- Year-over-year percent change in total deaths
- Opioid vs non-opioid death classification
- Fentanyl/heroin involvement by age group
- Cities with above-average death counts
- Deaths by weekday and percentage of total
- Gender-based opioid risk flag
- Top 5 counties in 2022 by opioid deaths
- Most dangerous age group by year

---

## 📊 Tableau Visualizations (Optional/Future Additions)
These SQL queries support the following types of dashboards:
- **Trends Over Time:** Opioid and non-opioid death trends
- **Demographic Risk:** Age, sex, and ethnicity breakdowns
- **Geographic Risk:** County and city heatmaps
- **Temporal Patterns:** Weekday vs weekend fatalities

---

## ⚠️ Limitations
- Many null values were imputed (e.g., `ethnicity`, `injury_city`, `drug flags`)
- Drug involvement is binary (Y/N); dosage data is unavailable
- Death location may not reflect the person’s residence
- No behavioral, medical, or substance use history included

---

## 🔭 Further Investigation
- Forecasting future opioid deaths (ARIMA, Prophet)
- Predictive modeling (logistic regression, XGBoost, random forest)
- Clustering geographic hotspots
- NLP analysis on cause/injury descriptions

---

## 📂 Project Files
- `Cleaned_Drug_Deaths.csv` – Final dataset
- `Data Cleaning.ipynb` – Python-based cleaning and null imputation
- `Data Cleaning.sql` – SQL-based updates for standardizing and filling missing values
- `EDA.sql` – SQL queries for deep exploration and business question analysis

---

## 🧰 Tools Used
- **Languages:** SQL (PostgreSQL), Python 
- **Libraries:** `pandas`  
- **Environments:** Jupyter Notebook, VSCode  
- **Visualization Tools:** Tableau
