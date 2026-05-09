-- =========================================
-- Create the table
-- =========================================
CREATE TABLE transactions (
    transaction_id VARCHAR(50) PRIMARY KEY,
    transaction_date DATE,
    merchant_id VARCHAR(50),
    merchant_name VARCHAR(100),
    raw_amount BIGINT,
    currency VARCHAR(10),
    status VARCHAR(50),
    risk_score DECIMAL(5, 2),
    gateway_region VARCHAR(50),
    user_id VARCHAR(50),
    payment_method VARCHAR(50),
    transactions_amount_usd DECIMAL(15, 2),
    merchant_category VARCHAR(100),
    high_value_flag INT,
    high_risk_flag INT
);

-- =========================================
-- Insert the data
-- =========================================

INSERT INTO transactions (transaction_id, transaction_date, merchant_id, merchant_name, raw_amount, currency, status, risk_score, gateway_region, user_id, payment_method, transactions_amount_usd, merchant_category, high_value_flag, high_risk_flag) VALUES 
('T001', '2026-03-01', 'M001', 'Alpha Mart', 420000, 'INR', 'captured', 62.0, 'APAC', 'U001', 'UPI', 4998.0, 'Grocery', 0, 0),
('T002', '2026-03-01', 'M001', 'Alpha Mart', 210000, 'INR', 'captured', 55.0, 'APAC', 'U002', 'Card', 2499.0, 'Grocery', 0, 0),
('T003', '2026-03-01', 'M002', 'Beta Stores', 510000, 'INR', 'captured', 71.0, 'APAC', 'U003', 'NetBanking', 6069.0, 'Electronics', 1, 1),
('T004', '2026-03-02', 'M002', 'Beta Stores', 160000, 'INR', 'failed', 68.0, 'APAC', 'U004', 'Card', 1920.0, 'Electronics', 0, 0),
('T005', '2026-03-02', 'M001', 'Alpha Mart', 390000, 'INR', 'captured', 58.0, 'APAC', 'U001', 'UPI', 4680.0, 'Grocery', 0, 0),
('T006', '2026-03-02', 'M002', 'Beta Stores', 275000, 'INR', 'captured', 64.0, 'APAC', 'U005', 'Wallet', 3300.0, 'Electronics', 0, 0),
('T007', '2026-03-02', 'M001', 'Alpha Mart', 450000, 'INR', 'chargeback', 83.0, 'APAC', 'U006', 'Card', 5400.0, 'Grocery', 1, 1),
('T008', '2026-03-03', 'M002', 'Beta Stores', 340000, 'INR', 'captured', 59.0, 'APAC', 'U007', 'UPI', 4114.0, 'Electronics', 0, 0),
('T009', '2026-03-03', 'M001', 'Alpha Mart', 125000, 'INR', 'captured', 46.0, 'APAC', 'U002', 'Wallet', 1512.5, 'Grocery', 0, 0),
('T010', '2026-03-03', 'M002', 'Beta Stores', 610000, 'INR', 'captured', 77.0, 'APAC', 'U003', 'Card', 7381.0, 'Electronics', 1, 1),
('T011', '2026-03-03', 'M001', 'Alpha Mart', 195000, 'INR', 'failed', NULL, 'APAC', 'U008', 'UPI', 2359.5, 'Grocery', 0, 0),
('T012', '2026-03-04', 'M002', 'Beta Stores', 250000, 'INR', 'captured', 61.0, 'APAC', 'U009', 'Card', 3000.0, 'Electronics', 0, 0),
('T013', '2026-03-04', 'M001', 'Alpha Mart', 310000, 'INR', 'captured', 54.0, 'APAC', 'U010', 'UPI', 3720.0, 'Grocery', 0, 0),
('T014', '2026-03-04', 'M002', 'Beta Stores', 470000, 'INR', 'captured', 73.0, 'APAC', 'U001', 'NetBanking', 5640.0, 'Electronics', 1, 1),
('T015', '2026-03-04', 'M001', 'Alpha Mart', 130000, 'INR', 'captured', 52.0, 'APAC', 'U002', 'Card', 1560.0, 'Grocery', 0, 0),
('T016', '2026-03-05', 'M002', 'Beta Stores', 220000, 'INR', 'failed', 69.0, 'APAC', 'U008', 'Card', 2596.0, 'Electronics', 0, 0),
('T017', '2026-03-05', 'M002', 'Beta Stores', 180000, 'INR', 'failed', 72.0, 'APAC', 'U008', 'Card', 2124.0, 'Electronics', 0, 1),
('T018', '2026-03-05', 'M002', 'Beta Stores', 145000, 'INR', 'chargeback', 86.0, 'APAC', 'U008', 'UPI', 1711.0, 'Electronics', 0, 1),
('T019', '2026-03-05', 'M001', 'Alpha Mart', 260000, 'INR', 'failed', 67.0, 'APAC', 'U008', 'Wallet', 3068.0, 'Grocery', 0, 0),
('T020', '2026-03-05', 'M001', 'Alpha Mart', 520000, 'INR', 'captured', 75.0, 'APAC', 'U005', 'UPI', 6136.0, 'Grocery', 1, 1),
('T021', '2026-03-06', 'M002', 'Beta Stores', 330000, 'INR', 'captured', 63.0, 'APAC', 'U006', 'Card', 3927.0, 'Electronics', 0, 0),
('T022', '2026-03-06', 'M001', 'Alpha Mart', 410000, 'INR', 'captured', 60.0, 'APAC', 'U007', 'UPI', 4879.0, 'Grocery', 0, 0),
('T023', '2026-03-01', 'M003', 'City Pharma', 5200, 'EUR', 'captured', 42.0, 'EU', 'U003', 'Card', 5616.0, 'Healthcare', 0, 0),
('T024', '2026-03-02', 'M005', 'Eco Home', 6100, 'EUR', 'chargeback', 65.0, 'EU', 'U004', 'Card', 6649.0, 'Home', 1, 1),
('T025', '2026-03-03', 'M003', 'City Pharma', 2800, 'EUR', 'captured', 38.0, 'EU', 'U005', 'Wallet', 3024.0, 'Healthcare', 0, 0),
('T026', '2026-03-05', 'M005', 'Eco Home', 3300, 'EUR', 'failed', 44.0, 'EU', 'U006', 'NetBanking', 3597.0, 'Home', 0, 0),
('T027', '2026-03-01', 'M004', 'Delta Travels', 7200, 'USD', 'captured', 49.0, 'US', 'U007', 'Card', 7200.0, 'Travel', 1, 0),
('T028', '2026-03-02', 'M004', 'Delta Travels', 3100, 'USD', 'captured', 41.0, 'US', 'U008', 'Card', 3100.0, 'Travel', 0, 0),
('T029', '2026-03-04', 'M004', 'Delta Travels', 2500, 'USD', 'chargeback', 58.0, 'US', 'U009', 'Wallet', 2500.0, 'Travel', 0, 1),
('T030', '2026-03-06', 'M004', 'Delta Travels', 1800, 'USD', 'failed', 47.0, 'US', 'U010', 'UPI', 1800.0, 'Travel', 0, 0);

-- =========================================
-- Verify the data
-- =========================================
SELECT TOP 5 * FROM transactions;

-- =========================================
-- Q1. Count transactions by status
-- =========================================

SELECT status, COUNT(*) AS total_transactions
FROM transactions
GROUP BY status;

-- =========================================
-- Q2. Calculate total captured GMV by merchant
-- =========================================

SELECT merchant_name, SUM(transactions_amount_usd) AS total_gmv_usd
FROM transactions
WHERE status = 'captured'
GROUP BY merchant_name;

-- =========================================
-- Q3. Show top 10 merchants by captured GMV
-- =========================================

SELECT TOP 10 merchant_name, SUM(transactions_amount_usd) AS total_gmv_usd
FROM transactions
WHERE status = 'captured'
GROUP BY merchant_name
ORDER BY total_gmv_usd DESC;

-- =========================================
-- Q4. Show daily GMV and successful transaction count
-- =========================================

SELECT 
    transaction_date, 
    SUM(transactions_amount_usd) AS daily_gmv_usd,
    COUNT(*) AS successful_txn_count
FROM transactions
WHERE status = 'captured'
GROUP BY transaction_date
ORDER BY transaction_date;

-- =========================================
-- Q5. Find merchants with chargeback ratio above 1%
-- =========================================

SELECT 
    merchant_name,
    COUNT(CASE WHEN status = 'chargeback' THEN 1 END) * 1.0 / COUNT(*) AS chargeback_ratio
FROM transactions
GROUP BY merchant_name
HAVING (COUNT(CASE WHEN status = 'chargeback' THEN 1 END) * 1.0 / COUNT(*)) > 0.01;

-- =========================================
-- Q6. Find regions with average risk score above 50 and more than 20 transactions
-- =========================================

SELECT 
    gateway_region, 
    AVG(risk_score) AS avg_risk, 
    COUNT(*) AS txn_count
FROM transactions
GROUP BY gateway_region
HAVING AVG(risk_score) > 50 AND COUNT(*) > 20;

-- =========================================
-- Q7. Find users with 3 or more failed or chargeback transactions on the same day
-- =========================================

SELECT 
    user_id, 
    transaction_date, 
    COUNT(*) AS risky_txn_count
FROM transactions
WHERE status IN ('failed', 'chargeback')
GROUP BY user_id, transaction_date
HAVING COUNT(*) >= 3;

-- =========================================
-- Q8. Show chargeback count, unique affected users, and chargeback amount by merchant
-- =========================================

SELECT 
    merchant_name,
    COUNT(*) AS chargeback_count,
    COUNT(DISTINCT user_id) AS unique_users_affected,
    SUM(transactions_amount_usd) AS total_chargeback_amount_usd
FROM transactions
WHERE status = 'chargeback'
GROUP BY merchant_name;