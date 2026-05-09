# SQL Answers

## Q1
**Question:** Count transactions by status

### Query
```sql
SELECT status, COUNT(*) AS total_transactions
FROM transactions
GROUP BY status;
```

### Result Summary
| Status     |   Total Transactions |
|:-----------|---------------------:|
| captured   |                   19 |
| failed     |                    7 |
| chargeback |                    4 |

## Q2
**Question:** Calculate total captured GMV by merchant

### Query
```sql
SELECT merchant_name, SUM(transactions_amount_usd) AS total_gmv_usd
FROM transactions
WHERE status = 'captured'
GROUP BY merchant_name;
```

### Result Summary
| Merchant Name   |   Total GMV (USD) |
|:----------------|------------------:|
| Alpha Mart      |           29984.5 |
| Beta Stores     |           33431   |
| City Pharma     |            8640   |
| Delta Travels   |           10300   |

## Q3
**Question:** Show top 10 merchants by captured GMV

### Query
```sql
SELECT TOP 10 merchant_name, SUM(transactions_amount_usd) AS total_gmv_usd
FROM transactions
WHERE status = 'captured'
GROUP BY merchant_name
ORDER BY total_gmv_usd DESC;
```

### Result Summary
| Merchant Name   |   Total GMV (USD) |
|:----------------|------------------:|
| Beta Stores     |           33431   |
| Alpha Mart      |           29984.5 |
| Delta Travels   |           10300   |
| City Pharma     |            8640   |

## Q4
**Question:** Show daily GMV and successful transaction count

### Query
```sql
SELECT 
    transaction_date, 
    SUM(transactions_amount_usd) AS daily_gmv_usd,
    COUNT(*) AS successful_txn_count
FROM transactions
WHERE status = 'captured'
GROUP BY transaction_date
ORDER BY transaction_date;
```

### Result Summary
| Date       |   Daily GMV (USD) |   Successful Txn Count |
|:-----------|------------------:|-----------------------:|
| 2026-03-01 |           26382   |                      5 |
| 2026-03-02 |           11080   |                      3 |
| 2026-03-03 |           16031.5 |                      4 |
| 2026-03-04 |           13920   |                      4 |
| 2026-03-05 |            6136   |                      1 |
| 2026-03-06 |            8806   |                      2 |

## Q5
**Question:** Find merchants with chargeback ratio above 1%

### Query
```sql
SELECT 
    merchant_name,
    COUNT(CASE WHEN status = 'chargeback' THEN 1 END) * 1.0 / COUNT(*) AS chargeback_ratio
FROM transactions
GROUP BY merchant_name
HAVING (COUNT(CASE WHEN status = 'chargeback' THEN 1 END) * 1.0 / COUNT(*)) > 0.01;
```

### Result Summary
| Merchant Name   |   Chargeback Ratio |
|:----------------|-------------------:|
| Alpha Mart      |          0.0909091 |
| Beta Stores     |          0.0909091 |
| Delta Travels   |          0.25      |
| Eco Home        |          0.5       |

## Q6
**Question:** Find regions with average risk score above 50 and more than 20 transactions

### Query
```sql
SELECT 
    gateway_region, 
    AVG(risk_score) AS avg_risk, 
    COUNT(*) AS txn_count
FROM transactions
GROUP BY gateway_region
HAVING AVG(risk_score) > 50 AND COUNT(*) > 20;
```

### Result Summary
| Gateway Region   |   Avg Risk Score |   Txn Count |
|:-----------------|-----------------:|------------:|
| APAC             |          65.4762 |          22 |

## Q7
**Question:** Find users with 3 or more failed or chargeback transactions on the same day

### Query
```sql
SELECT 
    user_id, 
    transaction_date, 
    COUNT(*) AS risky_txn_count
FROM transactions
WHERE status IN ('failed', 'chargeback')
GROUP BY user_id, transaction_date
HAVING COUNT(*) >= 3;
```

### Result Summary
| User ID   | Date       |   Risky Txn Count |
|:----------|:-----------|------------------:|
| U008      | 2026-03-05 |                 4 |

## Q8
**Question:** Show chargeback count, unique affected users, and chargeback amount by merchant

### Query
```sql
SELECT 
    merchant_name,
    COUNT(*) AS chargeback_count,
    COUNT(DISTINCT user_id) AS unique_users_affected,
    SUM(transactions_amount_usd) AS total_chargeback_amount_usd
FROM transactions
WHERE status = 'chargeback'
GROUP BY merchant_name;
```

### Result Summary
| Merchant Name   |   Chargeback Count |   Unique Users Affected |   Total Chargeback Amount (USD) |
|:----------------|-------------------:|------------------------:|--------------------------------:|
| Alpha Mart      |                  1 |                       1 |                            5400 |
| Beta Stores     |                  1 |                       1 |                            1711 |
| Delta Travels   |                  1 |                       1 |                            2500 |
| Eco Home        |                  1 |                       1 |                            6649 |

