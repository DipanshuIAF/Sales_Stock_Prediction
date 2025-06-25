CREATE TABLE toy_sales(
    sale_date DATE,
    product_id VARCHAR(50),
    platform VARCHAR(50),
    quantity_sold INT
    );

INSERT INTO toy_sales (sale_date, product_id, platform, quantity_sold) VALUES
('2025-06-01', 'T001', 'Website', 3),
('2025-06-01', 'T001', 'Amazon', 2),
('2025-06-01', 'T001', 'Flipkart', 1),
('2025-06-02', 'T001', 'Website', 2),
('2025-06-02', 'T001', 'Amazon', 3),

('2025-06-01', 'T002', 'Website', 1),
('2025-06-01', 'T002', 'Amazon', 2),
('2025-06-01', 'T002', 'Flipkart', 2),

('2025-06-02', 'T003', 'Website', 2),
('2025-06-02', 'T003', 'Flipkart', 1);

SELECT * from toy_sales;

WITH daily_totals AS (
    SELECT
        sale_date,
        product_id,
        SUM(quantity_sold) AS total_daily_sales
	FROM toy_sales
    GROUP BY sale_date, product_id),
avg_sales AS (
    SELECT
        product_id,
        ROUND(AVG(total_daily_sales), 2) AS avg_daily_sales
	FROM daily_totals
    GROUP BY product_id
)
SELECT 
    product_id,
    avg_daily_sales,
    ROUND(avg_daily_sales*15) AS stock_required_15_days
    FROM avg_sales
    ORDER BY product_id;