
CREATE TABLE audience_data (
    date DATE,
    user_id VARCHAR(50),
    view_adverts INT
);

SELECT COUNT(*) 
FROM audience_data;

# 1
SELECT COUNT(DISTINCT user_id) AS MAU
FROM audience_data
WHERE date >= '2023-11-01'
  AND date < '2023-12-01';
  
# 2
SELECT 
    date,
    COUNT(DISTINCT user_id) AS DAU
FROM audience_data
WHERE date >= '2023-11-01'
  AND date < '2023-12-01'
GROUP BY date
ORDER BY date;


# 3
SELECT 
    100.0 * COUNT(DISTINCT r.user_id) / COUNT(DISTINCT c.user_id) AS retention_d1
FROM cohort c
LEFT JOIN retained r
ON c.user_id = r.user_id;


# 5
SELECT 
    100.0 * COUNT(DISTINCT CASE 
        WHEN view_adverts > 0 THEN user_id 
    END) 
    / COUNT(DISTINCT user_id) AS conversion
FROM audience_data
WHERE date >= '2023-11-01'
  AND date < '2023-12-01';
  
  # 6
  SELECT 
    SUM(view_adverts) * 1.0 / COUNT(DISTINCT user_id) AS avg_views_per_user
FROM audience_data
WHERE date >= '2023-11-01'
  AND date < '2023-12-01';
  
# 7
SELECT 
    (1200 * 100.0 / 2000) - (500 * 100.0 / 2000) AS nps;
    
  # 8
  
  CREATE TABLE ab_tests (
    experiment_num INT,
    experiment_group VARCHAR(20),
    user_id VARCHAR(50),
    revenue INT
);
  
  SELECT * FROM ab_tests LIMIT 10;
  
  # 9
  CREATE TABLE listers (
    user_id INT,
    date DATE,
    cnt_adverts INT,
    age INT,
    cnt_contacts INT,
    revenue INT
);

SELECT * FROM listers LIMIT 10;
 
