# SQL Data Warehouse and Analytics Project

This repository presents a complete end-to-end solution that I implemented — from ingesting raw data and building a structured Data Warehouse, to developing SQL-based analytical reports.
The project follows industry best practices in data engineering, data modeling, and data analytics.

---
## Data Architecture

The data architecture in this project follows the Medallion Architecture with three layers: Bronze, Silver, and Gold:

<img width="4105" height="2805" alt="Architecture" src="https://github.com/user-attachments/assets/49f89d43-8e8a-482c-816f-31a1ccc10a01" />


1. **Bronze Layer**: Raw data ingested from external sources (e.g., CSV files) with minimal processing. Used as the landing zone for historical record-keeping and traceability.
2. **Silver Layer**: Cleaned, standardized, and transformed data. This layer applies business logic, data validation, enrichment, and formatting to make the data analytics-ready.
3. **Gold Layer**: Curated data optimized for reporting and analytics. Includes dimensional models, fact tables, and business views used in dashboards and insights generation.

---
### Additional Diagrams

Here are more visuals to explain the data integration, mart structure, and data flow in this project:

#### Data Integration Diagram

<img width="5030" height="2805" alt="Data Integration" src="https://github.com/user-attachments/assets/ed379f97-ef2d-46c9-902a-4544aec1a1f5" />


#### Sales Data Mart Diagram

<img width="5650" height="2745" alt="Data Mart" src="https://github.com/user-attachments/assets/23688821-5e02-436d-b720-61e71e4f49db" />


#### Data Flow Diagram

<img width="3755" height="2005" alt="DataFlow" src="https://github.com/user-attachments/assets/c5640eea-7412-494d-ac5d-1ae41e8511a5" />


## Project Overview

This project involves:

1. **Data Architecture**: Structuring the warehouse following best practices to manage raw, cleansed, and curated data layers.
2. **ETL Pipelines**: Extracting, transforming, and loading data from source systems into the warehouse.
3. **Data Modeling**: Created fact and dimension tables optimized for performance and analytical use cases.
4. **Analytics & Reporting**: Developed SQL-based reports to uncover trends, performance metrics, customer segmentation, and other business insights.

---

### Building the Data Warehouse (Data Engineering)

#### Objective
Design and implement a modern data warehouse using SQL Server, consolidating data from ERP and CRM systems to support analytics and decision-making.

#### Specifications
- **Data Ingestion**: Loaded CSV files from two source systems (ERP and CRM) into staging tables.
- **Data Quality**: Identified and fixed data quality issues (e.g., nulls, inconsistent formats, invalid values).
- **Data Integration**: Merged both sources into a unified analytical model using Medallion architecture (Bronze, Silver, Gold).
- **Scope**:  Worked only with the latest snapshot (no historical tracking required).
- **Documentation**: Structured and documented the data model to ensure it’s understandable for both technical and non-technical users.

---

### Analytics & Reporting (Data Analysis)

#### Objective
Develop SQL-based analytics to deliver detailed insights into:
- **Customer Behavior**: Segment customers by lifecycle, age, recency, and spending patterns (VIP, Regular, New).
- **Product Performance**: Evaluate top- and low-performing products using revenue contribution, sales quantity, and activity lifespan.
- **Sales Trends**: Analyze monthly and yearly trends, cumulative growth, and part-to-whole contributions.

These insights provide stakeholders with clear, data-driven metrics to support strategic business decisions and drive performance.


## Acknowledgements

A big thank you to Baraa Khatib Salkini (Data With Baraa) for the inspiring course and valuable resources that fueled this project.
[The Complete SQL Bootcamp](https://www.udemy.com/course/the-complete-sql-bootcamp-30-hours-go-from-zero-to-hero/)
