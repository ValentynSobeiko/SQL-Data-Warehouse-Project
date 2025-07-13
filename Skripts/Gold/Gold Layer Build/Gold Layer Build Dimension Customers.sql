

CREATE VIEW gold.dim_customers AS
SELECT
    ROW_NUMBER() OVER(ORDER BY cst_id) AS customer_key,
    ci.cst_id AS customer_id,
    ci.cst_key AS customer_number,
    ci.cst_firstname AS first_name ,
    ci.cst_lastname AS last_name,
    la.cntry AS country,
    ci.cst_marital_status AS marital_status,
    CASE WHEN ci.cst_gndr != 'n/a' THEN ci.cst_gndr -- CRM is the Master for gender info
         ELSE COALESCE(ca.gen, 'n/a')
    END AS gender,
    ci.cst_create_date AS create_date,
    ca.bdate AS birthdate
FROM Silver.crm_cust_info ci
LEFT JOIN Silver.erp_cust_az12 ca
on ci.cst_key = ca.cid
LEFT JOIN Silver.erp_loc_a101 la
on ci.cst_key = la.cid


select distinct(gender) from gold.dim_customers