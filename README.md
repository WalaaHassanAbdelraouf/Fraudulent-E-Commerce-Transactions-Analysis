# Fraudulent-E-Commerce-Transactions-Analysis

An end-to-end data analytics project using **Google BigQuery, SQL, and Looker Studio** to analyze fraudulent e-commerce transactions, identify fraud patterns, and highlight potential risk indicators.

## Dashboard

🔗 **[View & Interact with the Looker Studio Dashboard](https://datastudio.google.com/reporting/6c25ab1d-0889-4612-bf39-bbaaecaf4fbd)**


## Dataset

The project uses the **Fraudulent E-Commerce Transactions** dataset available on Kaggle:

🔗 **[View the Dataset on Kaggle](https://kaggle.com/datasets/shriyashjagtap/fraudulent-e-commerce-transactions)**

The dataset contains **23,634 transactions across 16 fields**, including transaction details, customer information, payment methods, devices, addresses, and fraud status.

The dataset contains:

- **23,634** total transactions
- **1,222** fraudulent transactions
- **22,412** non-fraudulent transactions
- **5.17%** overall fraud rate

### Tools

- **Google BigQuery** : Used for data storage, cleaning, transformation, and analysis
- **SQL** : Used for data exploration, cleaning, and fraud analysis
- **Looker Studio** : Used for interactive dashboard and visualization

---

## Business Questions

The analysis was conducted to answer the following questions:

1. What is the overall fraud rate and how much transaction value is associated with fraudulent activity?
2. Which **payment methods, product categories, and devices** have higher fraud rates?
3. How does fraud activity change across **hours, days, and months**?
4. Are fraud patterns different across **customer age and account age groups**?
5. Are **high-value transactions, new accounts, address mismatches, or late-night transactions** associated with different fraud rates?
6. What insights can help support **fraud monitoring and risk assessment**?

---

## Analysis Workflow

### 1. Data Exploration & Cleaning

- Loaded the raw CSV data into **BigQuery**.
- Checked data types, missing values, duplicates, and invalid values.
- Identified invalid customer age values and handled them appropriately.
- Validated account age and transaction hour fields.
- Created a cleaned analysis-ready table while preserving the raw data.

### 2. Fraud Analysis

Used SQL to analyze fraud across:

- Payment methods
- Product categories
- Devices
- Transaction time
- Customer age
- Account age
- Transaction amount
- Customer location
- Shipping and billing addresses

### 3. Risk Indicators

Created additional indicators to support risk analysis:

- **Address Mismatch**
- **High-Value Transaction**
- **New Account**
- **Late-Night Transaction**

These indicators were compared with fraud rates to identify potentially higher-risk transaction patterns.

### 4. Dashboard

Built an interactive **Looker Studio dashboard** covering:

- Fraud KPIs
- Fraud trends over time
- Fraud patterns
- Customer and transaction behavior
- Risk indicators

---

## Key Insights

The analysis showed that fraudulent activity is **not evenly distributed** across all transaction characteristics.

Key observations included:

- Fraud rates vary across **payment methods, product categories, and devices**.
- Fraud activity changes across different **transaction hours and dates**.
- Customer and account characteristics can reveal different fraud patterns.
- **Address mismatches, new accounts, high-value transactions, and late-night activity** can be useful risk indicators when combined with other signals.

---

## Recommendations

Based on the analysis we should:

- Apply additional verification to transactions showing **multiple risk indicators**.
- Monitor **high-value transactions**, especially when combined with other suspicious characteristics.
- Pay closer attention to unusual activity from **new accounts**.
- Investigate transactions with **shipping and billing address mismatches**.
- Use multiple risk indicators together rather than relying on a single factor when assessing potential fraud.

---

## Project Files

```text
Fraudulent-E-Commerce-Transactions-Analysis/
│
├── Data/
├── SQL/
│   ├── data_exploration.sql
│   ├── data_cleaning.sql
│   ├── fraud_analysis.sql
|   └── fraud_analysis_table.sql
│
├── README.md
├── .gitignore
└── Dashboard
|   └── Fraudulent_Transaction_Analytics.pdf
└── Screenshots
│   ├── Page 1.png
│   ├── Page 2.png
│   ├── Page 3.png
|   └── Page 4.png
```

## Final Outcome

This project demonstrates an end-to-end analytics workflow from **raw data to business insights**, using SQL and BigQuery for data preparation and analysis and Looker Studio for interactive visualization.

It demonstrates practical skills in:

**Data Cleaning - SQL Analysis - KPI Development - Fraud Analysis - Risk Assessment - Data Visualization - Business Insights**
---

## How to Reproduce the Analysis

To reproduce this project:

1. Download the dataset from the [Kaggle dataset page](https://kaggle.com/datasets/shriyashjagtap/fraudulent-e-commerce-transactions).
2. Upload the CSV file to Google BigQuery as a raw table.
3. Run `SQL/data_exploration.sql` to explore the dataset and check data quality.
4. Run `SQL/cleaning.sql` to clean the data and create the cleaned table.
5. Run `SQL/fraud_analysis.sql` to perform the fraud analysis.
6. Run `SQL/fraud_analysis_table.sql` to create the final analytical table with the risk indicators used in the dashboard.
7. Connect the final BigQuery table to Looker Studio and recreate or explore the visualizations.

