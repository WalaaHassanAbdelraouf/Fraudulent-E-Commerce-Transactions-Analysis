CREATE OR REPLACE TABLE
`dataanalysis-510013.fraudulent_transactions.fraud_analysis_table`
AS

SELECT
  *,
  
  CASE
    WHEN Shipping_Address != Billing_Address THEN 1
    ELSE 0
  END AS Address_Mismatch,

  CASE
    WHEN Transaction_Amount >= 500 THEN 1
    ELSE 0
  END AS High_Value_Transaction,

  CASE
    WHEN `Account_Age ` < 30 THEN 1
    ELSE 0
  END AS New_Account,

  CASE
    WHEN Transaction_Hour BETWEEN 0 AND 5 THEN 1
    ELSE 0
  END AS Late_Night_Transaction

FROM
`dataanalysis-510013.fraudulent_transactions.fraudulent_transactions_clean`;