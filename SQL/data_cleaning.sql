-- Creating a cleaned version of the data by handling the invalid customer age value

CREATE OR REPLACE TABLE
`dataanalysis-510013.fraudulent_transactions.fraudulent_transactions_clean`
AS

SELECT
  Transaction_ID,
  Customer_ID,

  Transaction_Amount,

  Transaction_Date,
  Transaction_Time,

  Payment_Method,
  Product_Category,

  Quantity,

  CASE
    WHEN Customer_Age BETWEEN 1 AND 100
      THEN Customer_Age
    ELSE (
    SELECT APPROX_QUANTILES(Customer_Age, 2)[OFFSET(1)] 
    FROM `dataanalysis-510013.fraudulent_transactions.transactions_records`
    WHERE Customer_Age BETWEEN 1 AND 100
  )
  END AS Customer_Age,

  Customer_Location,
  Device_Used,

  IP_Address,
  Shipping_Address,
  Billing_Address,

  Is_Fraudulent,
  `Account_Age `,
  Transaction_Hour

FROM `dataanalysis-510013.fraudulent_transactions.transactions_records`;


-- Validating the data quality
SELECT
  COUNT(*) AS total_rows,
  COUNT(DISTINCT Transaction_ID) AS unique_transactions,
  COUNT(DISTINCT Customer_ID) AS unique_customers,

  COUNTIF(Transaction_ID IS NULL) AS null_transaction_id,
  COUNTIF(Customer_ID IS NULL) AS null_customer_id,
  COUNTIF(Transaction_Amount IS NULL) AS null_amount,
  COUNTIF(Transaction_Date IS NULL) AS null_date,
  COUNTIF(Is_Fraudulent IS NULL) AS null_fraud_label

FROM `dataanalysis-510013.fraudulent_transactions.fraudulent_transactions_clean`;






