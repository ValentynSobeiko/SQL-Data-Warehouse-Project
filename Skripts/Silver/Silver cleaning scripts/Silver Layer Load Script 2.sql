-- Selcet Bronze.crm_prd_info table clean and prepeto for import ot silver layer
----------------------------------- Main QUERY Silver.crm_prd_info -----------------------------------

PRINT '>> Truncating table : Silver.crm_prd_info';
TRUNCATE TABLE Silver.crm_prd_info;
PRINT '>> Inserting Data Into : Silver.crm_prd_info';

INSERT INTO Silver.crm_prd_info(
    prd_id,
    cat_id,
    prd_key,
    prd_nm,
    prd_cost,
    prd_line,
    prd_start_dt,
    prd_end_dt
)
SELECT 
    prd_id,
    REPLACE(SUBSTRING(prd_key, 1, 5), '-','_') AS cat_id,  -- Extract category ID from the first 5 characters
    SUBSTRING(prd_key, 7, LEN(prd_key)) AS prd_key,        -- Extract product key from the remaining string
    prd_nm,
    ISNULL(prd_cost,0) AS prd_cost,
    CASE UPPER(TRIM(prd_line))
         WHEN 'M' THEN 'Mountain'
         WHEN 'R' THEN 'Road'
         WHEN 'S' THEN 'Other Sales'
         WHEN 'T' THEN 'Touring'
         ELSE 'N/A'
    END AS prd_line, -- Map product line codes to descriptive values
    CAST(prd_start_dt AS DATE) AS prd_start_dt, -- Calculate end date as one day before the next start date
    CAST(LEAD(prd_start_dt) OVER (PARTITION BY prd_key ORDER BY prd_start_dt) -1 AS DATE) AS prd_end_dt
FROM Bronze.crm_prd_info

-- Check for Unwanted Spaces
-- Expectation: No Results
SELECT 
    prd_nm
FROM bronze.crm_prd_info
WHERE prd_nm != TRIM(prd_nm);

-- Check for NULLs or Negative Numbers
-- Expectation: No Results

SELECT 
    prd_cost
FROM bronze.crm_prd_info
WHERE prd_cost < 0 or prd_cost IS NULL;


-- Data Standardization & Consistency
SELECT DISTINCT 
    prd_line 
FROM bronze.crm_prd_info;

-- Check fo Invalid Date Orders
SELECT * 
FROM bronze.crm_prd_info
WHERE prd_end_dt < prd_start_dt


-- Check for Unwanted Spaces
-- Expectation: No Results
SELECT 
    prd_nm
FROM Silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm);

-- Check for NULLs or Negative Numbers
-- Expectation: No Results

SELECT 
    prd_cost
FROM Silver.crm_prd_info
WHERE prd_cost < 0 or prd_cost IS NULL;


-- Data Standardization & Consistency
SELECT DISTINCT 
    prd_line 
FROM Silver.crm_prd_info;

-- Check fo Invalid Date Orders
SELECT * 
FROM Silver.crm_prd_info
WHERE prd_end_dt < prd_start_dt
 