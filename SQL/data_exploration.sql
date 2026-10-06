/* total transactions */
SELECT COUNT(*) as Total_Transactions
FROM `dataanalysis-510013.fraudulent_transactions.transactions_records` ;

/* No. of fraudulent and non-fraudulent transactions*/
SELECT Is_Fraudulent, COUNT(*) as Transaction_count
FROM `dataanalysis-510013.fraudulent_transactions.transactions_records` 
GROUP BY Is_Fraudulent
ORDER BY Is_Fraudulent;

/* fraud_rate */
SELECT COUNT(Is_Fraudulent) as Total_fraudulent_transactions, COUNTIF(Is_Fraudulent = 'fraudulent') as Fraudulent_count,
ROUND(COUNTIF(Is_Fraudulent = 'fraudulent') / COUNT(Is_Fraudulent) * 100, 2) as Fraud_Rate
FROM `dataanalysis-510013.fraudulent_transactions.transactions_records` ;

/* Checkilng for null values */
SELECT
  COUNTIF(Transaction_ID IS NULL) AS transaction_id_nulls,
  COUNTIF(Customer_ID IS NULL) AS customer_id_nulls,
  COUNTIF(Transaction_Amount IS NULL) AS amount_nulls,
  COUNTIF(Transaction_Date IS NULL) AS date_nulls,
  COUNTIF(Transaction_Time IS NULL) AS time_nulls,
  COUNTIF(Payment_Method IS NULL) AS payment_method_nulls,
  COUNTIF(Product_Category IS NULL) AS product_category_nulls,
  COUNTIF(Quantity IS NULL) AS quantity_nulls,
  COUNTIF(Customer_Age IS NULL) AS customer_age_nulls,
  COUNTIF(Customer_Location IS NULL) AS location_nulls,
  COUNTIF(Device_Used IS NULL) AS device_nulls,
  COUNTIF(IP_Address IS NULL) AS ip_nulls,
  COUNTIF(Shipping_Address IS NULL) AS shipping_address_nulls,
  COUNTIF(Billing_Address IS NULL) AS billing_address_nulls,
  COUNTIF(Is_Fraudulent IS NULL) AS fraud_nulls,
  COUNTIF(`Account_Age ` IS NULL) AS account_age_nulls,
  COUNTIF(Transaction_Hour IS NULL) AS hour_nulls
FROM `dataanalysis-510013.fraudulent_transactions.transactions_records` ;

/* Checking for duplicates */
SELECT Transaction_ID, COUNT(*) as occurence_count
FROM `dataanalysis-510013.fraudulent_transactions.transactions_records` 
GROUP BY Transaction_ID
HAVING COUNT(*) > 1
ORDER BY occurence_count DESC;

/* Checking for invlid values */
SELECT Customer_Age
FROM `dataanalysis-510013.fraudulent_transactions.transactions_records` 
WHERE Customer_Age < 0;

SELECT Customer_Age, COUNT(*) as Count
FROM `dataanalysis-510013.fraudulent_transactions.transactions_records` 
WHERE Customer_Age < 0
GROUP BY Customer_Age
ORDER BY Customer_Age ;


/* Checking for other invalid numerical values */
-- Transaction Amount
SELECT
  MIN(Transaction_Amount) AS min_amount,
  MAX(Transaction_Amount) AS max_amount,
  AVG(Transaction_Amount) AS avg_amount,
  APPROX_QUANTILES(Transaction_Amount, 100)[OFFSET(50)] AS median_amount
FROM `dataanalysis-510013.fraudulent_transactions.transactions_records` ;

-- Quantity
SELECT
  MIN(Quantity) AS min_quantity,
  MAX(Quantity) AS max_quantity,
  AVG(Quantity) AS avg_quantity
FROM `dataanalysis-510013.fraudulent_transactions.transactions_records` ;

-- Account Age
SELECT
  MIN(`Account_Age `) AS min_account_age,
  MAX(`Account_Age `) AS max_account_age,
  AVG(`Account_Age `) AS avg_account_age
FROM `dataanalysis-510013.fraudulent_transactions.transactions_records` ;

-- Transaction Hour
SELECT
  COUNTIF(Transaction_Hour < 0 OR Transaction_Hour > 23) AS invalid_transaction_hour
FROM `dataanalysis-510013.fraudulent_transactions.transactions_records` ;


/* Checking for invalid categorical values */
-- Payment method

SELECT
  Payment_Method,
  COUNT(*) AS transactions
FROM `dataanalysis-510013.fraudulent_transactions.transactions_records` 
GROUP BY Payment_Method
ORDER BY transactions DESC;


-- Product category
SELECT
  Product_Category,
  COUNT(*) AS transactions
FROM `dataanalysis-510013.fraudulent_transactions.transactions_records` 
GROUP BY Product_Category
ORDER BY transactions DESC;

-- Device
SELECT
  Device_Used,
  COUNT(*) AS transactions
FROM `dataanalysis-510013.fraudulent_transactions.transactions_records` 
GROUP BY Device_Used
ORDER BY transactions DESC;

/* Fraud distribution */
SELECT Is_Fraudulent, 
ROUND(AVG(Transaction_Amount), 2) as Avg_Amount,
ROUND(AVG(Customer_Age), 2) as Avg_Customer_Age,
ROUND(AVG(Quantity), 2) as Avg_Quantity,
ROUND(AVG(`Account_Age `), 2) as Avg_Account_Age
FROM `dataanalysis-510013.fraudulent_transactions.transactions_records` 
GROUP BY Is_Fraudulent
ORDER BY Is_Fraudulent;





