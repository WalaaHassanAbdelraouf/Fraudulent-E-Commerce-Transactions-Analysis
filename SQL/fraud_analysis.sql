/*********************** Overall KPIs **********************/

-- Total Transactions
SELECT COUNT(*) as Total_Transactions
FROM `dataanalysis-510013.fraudulent_transactions.fraudulent_transactions_clean`;

-- Fraudulent & Legitimate Transactions
SELECT COUNTIF(Is_Fraudulent = 'fraudulent') as Fraudulent_Transactions,
COUNTIF(Is_Fraudulent = 'non-fraudulent') as legitimate_Transactions
FROM `dataanalysis-510013.fraudulent_transactions.fraudulent_transactions_clean`;

-- Fraud Rate%
SELECT ROUND(COUNTIF(Is_Fraudulent = 'fraudulent') / COUNT(*) * 100, 2)  as Fraud_Rate
FROM `dataanalysis-510013.fraudulent_transactions.fraudulent_transactions_clean`;

-- Total Transactions Value
SELECT ROUND(SUM(Transaction_Amount), 2 ) as Total_Transaction_Value
FROM `dataanalysis-510013.fraudulent_transactions.fraudulent_transactions_clean`;

-- Fraudulent Transaction value
SELECT ROUND(SUM(CASE WHEN Is_Fraudulent = 'fraudulent' THEN Transaction_Amount ELSE 0 END ), 2)  as Fraudulent_Transaction_Value
FROM `dataanalysis-510013.fraudulent_transactions.fraudulent_transactions_clean`;

-- Total Customers
SELECT COUNT(Customer_ID) as Total_Customers
FROM `dataanalysis-510013.fraudulent_transactions.fraudulent_transactions_clean`;


/*********************** Fraud By Payment Method *******************/

SELECT Payment_Method, 
  COUNTIF(Is_Fraudulent = 'fraudulent') as Fraudulent_Transactions,
  COUNTIF(Is_Fraudulent = 'non-fraudulent') as Legitimate_Transactions,
  ROUND(COUNTIF(Is_Fraudulent = 'fraudulent') / COUNT(*) * 100, 2) as Fraud_Rate,
  ROUND(
    AVG(Transaction_Amount),
    2
  ) AS Avg_Transaction_Amount
FROM `dataanalysis-510013.fraudulent_transactions.fraudulent_transactions_clean`
GROUP BY Payment_Method
ORDER BY Fraud_Rate DESC;

/*********************** Fraud By Product Category *************************/

SELECT Product_Category, 
  COUNTIF(Is_Fraudulent = 'fraudulent') as Fraudulent_Transactions,
  COUNTIF(Is_Fraudulent = 'non-fraudulent') as Legitimate_Transactions,
  ROUND(COUNTIF(Is_Fraudulent = 'fraudulent') / COUNT(*) * 100, 2) as Fraud_Rate,
  ROUND(
    AVG(Transaction_Amount),
    2
  ) AS Avg_Transaction_Amount
FROM `dataanalysis-510013.fraudulent_transactions.fraudulent_transactions_clean`
GROUP BY Product_Category
ORDER BY Fraud_Rate DESC;


/*********************** Fraud By Device *************************/

SELECT Device_Used, 
 COUNTIF(Is_Fraudulent = 'fraudulent') as Fraudulent_Transactions,
  COUNTIF(Is_Fraudulent = 'non-fraudulent') as Legitimate_Transactions,
  ROUND(COUNTIF(Is_Fraudulent = 'fraudulent') / COUNT(*) * 100, 2) as Fraud_Rate,
FROM `dataanalysis-510013.fraudulent_transactions.fraudulent_transactions_clean`
GROUP BY Device_Used
ORDER BY Fraud_Rate DESC;


/*********************** Fraud By Transaction Hour *************************/

SELECT Transaction_Hour, 
  COUNTIF(Is_Fraudulent = 'fraudulent') as Fraudulent_Transactions,
  COUNTIF(Is_Fraudulent = 'non-fraudulent') as Legitimate_Transactions,
  ROUND(COUNTIF(Is_Fraudulent = 'fraudulent') / COUNT(*) * 100, 2) as Fraud_Rate,
FROM `dataanalysis-510013.fraudulent_transactions.fraudulent_transactions_clean`
GROUP BY Transaction_Hour
ORDER BY Fraud_Rate DESC;

/*********************** Fraud By Month *************************/

SELECT EXTRACT(Month FROM Transaction_Date) as Month_Number,
  FORMAT_DATE('%B', Transaction_Date) AS Month_Name,
  COUNTIF(Is_Fraudulent = 'fraudulent') as Fraudulent_Transactions,
  COUNTIF(Is_Fraudulent = 'non-fraudulent') as Legitimate_Transactions,
  ROUND(COUNTIF(Is_Fraudulent = 'fraudulent') / COUNT(*) * 100, 2) as Fraud_Rate,
    ROUND(
    SUM(CASE
      WHEN Is_Fraudulent = 'fraudulent' THEN Transaction_Amount
      ELSE 0
    END),
    2
  ) AS fraudulent_transaction_value
FROM `dataanalysis-510013.fraudulent_transactions.fraudulent_transactions_clean`
GROUP BY Month_Number, Month_Name
ORDER BY Fraud_Rate DESC;


/*********************** Fraud By Customer Age *************************/

SELECT
  CASE
    WHEN Customer_Age < 18 THEN 'Under 18'
    WHEN Customer_Age BETWEEN 18 AND 24 THEN '18-24'
    WHEN Customer_Age BETWEEN 25 AND 34 THEN '25-34'
    WHEN Customer_Age BETWEEN 35 AND 44 THEN '35-44'
    WHEN Customer_Age BETWEEN 45 AND 54 THEN '45-54'
    WHEN Customer_Age BETWEEN 55 AND 64 THEN '55-64'
    WHEN Customer_Age >= 65 THEN '65+'
    ELSE 'Unknown'
  END AS age_group,
  COUNTIF(Is_Fraudulent = 'fraudulent') as Fraudulent_Transactions,
  COUNTIF(Is_Fraudulent = 'non-fraudulent') as Legitimate_Transactions,
  ROUND(COUNTIF(Is_Fraudulent = 'fraudulent') / COUNT(*) * 100, 2) as Fraud_Rate,
FROM `dataanalysis-510013.fraudulent_transactions.fraudulent_transactions_clean`
GROUP BY age_group
ORDER BY Fraud_Rate DESC;

/*********************** Fraud By Customer Location *************************/

SELECT Customer_Location, 
  COUNTIF(Is_Fraudulent = 'fraudulent') as Fraudulent_Transactions,
  COUNTIF(Is_Fraudulent = 'non-fraudulent') as Legitimate_Transactions,
  ROUND(COUNTIF(Is_Fraudulent = 'fraudulent') / COUNT(*) * 100, 2) as Fraud_Rate,
FROM `dataanalysis-510013.fraudulent_transactions.fraudulent_transactions_clean`
GROUP BY Customer_Location
HAVING COUNT(*) >= 20
ORDER BY Fraud_Rate DESC;

/*********************** Fraud By Account Age *************************/

SELECT
  CASE
    WHEN `Account_Age ` < 30 THEN '0-29 days'
    WHEN `Account_Age ` BETWEEN 30 AND 89 THEN '30-89 days'
    WHEN `Account_Age ` BETWEEN 90 AND 179 THEN '90-179 days'
    WHEN `Account_Age ` BETWEEN 180 AND 364 THEN '180-364 days'
    WHEN `Account_Age ` >= 365 THEN '365+ days'
    ELSE 'Unknown'
  END AS account_age_group,
  COUNTIF(Is_Fraudulent = 'fraudulent') as Fraudulent_Transactions,
  COUNTIF(Is_Fraudulent = 'non-fraudulent') as Legitimate_Transactions,
  ROUND(COUNTIF(Is_Fraudulent = 'fraudulent') / COUNT(*) * 100, 2) as Fraud_Rate,
FROM `dataanalysis-510013.fraudulent_transactions.fraudulent_transactions_clean`
GROUP BY account_age_group
ORDER BY Fraud_Rate DESC;


/*********************** Fraud By Transaction Amounts *************************/

SELECT
  CASE
    WHEN Transaction_Amount < 50 THEN 'Under $50'
    WHEN Transaction_Amount < 100 THEN '$50-$99'
    WHEN Transaction_Amount < 250 THEN '$100-$249'
    WHEN Transaction_Amount < 500 THEN '$250-$499'
    WHEN Transaction_Amount < 1000 THEN '$500-$999'
    ELSE '$1000+'
  END AS amount_group,
  COUNTIF(Is_Fraudulent = 'fraudulent') as Fraudulent_Transactions,
  COUNTIF(Is_Fraudulent = 'non-fraudulent') as Legitimate_Transactions,
  ROUND(COUNTIF(Is_Fraudulent = 'fraudulent') / COUNT(*) * 100, 2) as Fraud_Rate,
FROM `dataanalysis-510013.fraudulent_transactions.fraudulent_transactions_clean`
GROUP BY amount_group
ORDER BY Fraud_Rate DESC;

/********************** Fraudulent vs Legitimate Behavior ***********/

SELECT
  Is_Fraudulent,

  COUNT(*) AS Total_Transactions,

  ROUND(AVG(Transaction_Amount), 2) AS Avg_Transaction_Amount,

  ROUND(AVG(Quantity), 2) AS Avg_Quantity,

  ROUND(AVG(Customer_Age), 2) AS Avg_Customer_Age,

  ROUND(AVG(`Account_Age `), 2) AS Avg_Account_Age

FROM `dataanalysis-510013.fraudulent_transactions.fraudulent_transactions_clean`

GROUP BY Is_Fraudulent
ORDER BY Is_Fraudulent;


/********************** Address Mismatch Analysis **************/

SELECT
  CASE WHEN Billing_Address = Shipping_Address
  THEN 'Same Address'
  ELSE 'Diffrent Address'
  END Address_Match,
  COUNTIF(Is_Fraudulent = 'fraudulent') as Fraudulent_Transactions,
  COUNTIF(Is_Fraudulent = 'non-fraudulent') as Legitimate_Transactions,
  ROUND(COUNTIF(Is_Fraudulent = 'fraudulent') / COUNT(*) * 100, 2) as Fraud_Rate,
FROM `dataanalysis-510013.fraudulent_transactions.fraudulent_transactions_clean`
GROUP BY Address_Match
ORDER BY Fraud_Rate DESC;


/********************** IP Address Analysis **************/

SELECT IP_Address,
  COUNT(DISTINCT(Customer_ID)) as Unique_Customers,
  COUNTIF(Is_Fraudulent = 'fraudulent') as Fraudulent_Transactions,
  COUNTIF(Is_Fraudulent = 'non-fraudulent') as Legitimate_Transactions,
  ROUND(COUNTIF(Is_Fraudulent = 'fraudulent') / COUNT(*) * 100, 2) as Fraud_Rate,
FROM `dataanalysis-510013.fraudulent_transactions.fraudulent_transactions_clean`
GROUP BY IP_Address
HAVING COUNT(*) >= 2
ORDER BY Fraud_Rate DESC;



