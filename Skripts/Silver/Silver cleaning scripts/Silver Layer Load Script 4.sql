----------------------------------- Main QUERY Silver.erp_cust_az12 -----------------------------------
PRINT '>> Truncating table : Silver.erp_cust_az12';
TRUNCATE TABLE Silver.erp_cust_az12;
PRINT '>> Inserting Data Into : Silver.erp_cust_az12';
INSERT INTO Silver.erp_cust_az12 (cid, bdate, gen)

SELECT 
CASE WHEN cid LIKE 'NAS%' THEN SUBSTRING(cid, 4,LEN(cid)) -- Remove 'NAS' prefix if present
	 ELSE cid
END cid,
CASE WHEN bdate > GETDATE() THEN NULL -- Set future birthdates to NULL
	 ELSE bdate
END as bdate,
CASE WHEN UPPER(TRIM(gen)) IN ('F','FEMALE') THEN 'Female'
	 WHEN UPPER(TRIM(gen)) IN ('M','MALE') THEN 'Male'
	 ELSE 'n/a'
END as gen -- Normalize gender values and handle unknown cases
FROM Bronze.erp_cust_az12


-- Identify Out-of-Range Dates
SELECT DISTINCT 
bdate
FROM silver.erp_cust_az12
WHERE bdate < '1924-01-01' OR bdate > GETDATE()

-- Data Standartization and Cosnsistancy

SELECT DISTINCT 
gen,
CASE WHEN UPPER(TRIM(gen)) IN ('F','FEMALE') THEN 'Female'
	 WHEN UPPER(TRIM(gen)) IN ('M','MALE') THEN 'Male'
	 ELSE 'n/a'
END as gen
FROM silver.erp_cust_az12

SELECT * FROM silver.erp_cust_az12


----------------------------------- Main Query Silver.erp_loc_a101 -----------------------------------
PRINT '>> Truncating table : Silver.erp_loc_a101';
TRUNCATE TABLE Silver.erp_loc_a101;
PRINT '>> Inserting Data Into : Silver.erp_loc_a101';

INSERT INTO Silver.erp_loc_a101 (cid,cntry)
SELECT 
REPLACE(cid,'-', '') cid,
CASE
	WHEN TRIM(cntry) IN ('US','USA') THEN 'United States'
	WHEN TRIM(cntry) = 'DE' THEN 'GENRMANY'
	WHEN TRIM(cntry) = '' OR  cntry IS NULL THEN 'N/A'
	ELSE TRIM(cntry) -- Normalize and handle missing or blank country codes
END cntry
FROM Bronze.erp_loc_a101

-- Data Standartization and Cosnsistancy
SELECT DISTINCT cntry
FROM silver.erp_loc_a101
order by cntry

----------------------------------- Main Query Silver.erp_px_cat_g1v2 -----------------------------------
PRINT '>> Truncating table : Silver.erp_px_cat_g1v2';
TRUNCATE TABLE Silver.erp_px_cat_g1v2;
PRINT '>> Inserting Data Into : Silver.erp_px_cat_g1v2';

-- No transformations applied in this query

INSERT INTO Silver.erp_px_cat_g1v2 (id,cat,subcat,maintenance)
SELECT
id,
cat,
subcat,
maintenance
FROM DataWarehouse.Bronze.erp_px_cat_g1v2;

-- Check for unwanted Spaces
SELECT * FROM Bronze.erp_px_cat_g1v2
WHERE cat != TRIM(cat) OR subcat != TRIM(subcat) OR maintenance != TRIM(maintenance)

-- Data Standartization and Consistancy
SELECT DISTINCT 
maintenance
FROM Bronze.erp_px_cat_g1v2

SELECT * FROM Silver.erp_px_cat_g1v2