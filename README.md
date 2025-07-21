# SQL Data Warehouse and Analytics Project

This repository contains a complete end-to-end solution that I implemented — from ingesting raw data to building a structured Data Warehouse, and developing SQL-based analytical reports.  
The project follows industry best practices in data engineering, data modeling, and data analytics.

---

## Data Architecture

The data architecture follows the Medallion Architecture pattern, which organizes data into three layers: **Bronze**, **Silver**, and **Gold**.

<img width="10110" height="7300" alt="Architecture Diagram NEW" src="https://github.com/user-attachments/assets/98fadcfd-182f-4bb8-9a36-ca333054a727" />


*Overview of the Medallion Architecture layers.*

1. **Bronze Layer**  
   Raw data ingested from external sources (e.g., CSV files) with minimal processing. This layer serves as the landing zone for historical record-keeping and traceability.

2. **Silver Layer**  
   Cleaned, standardized, and transformed data. Business logic, data validation, enrichment, and formatting are applied to make the data analytics-ready.

3. **Gold Layer**  
   Curated and optimized data for reporting and analytics. This includes dimensional models, fact tables, and business views used in dashboards and insights generation.

---

## Additional Diagrams

The following diagrams illustrate other key components of the project:

### Data Integration Diagram

<img width="7410" height="5010" alt="Data Integration Diagram NEW" src="https://github.com/user-attachments/assets/463d5096-046b-47f8-8309-ab8db7a770b4" />
* Data integration flow from source systems to warehouse.*

### Sales Data Mart Diagram

<img width="11100" height="5540" alt="Data Mart Diagram NEW" src="https://github.com/user-attachments/assets/f62047ff-9a66-40de-b3e3-f05a43a2a211" />
*Structure of the Sales Data Mart.*

### Data Flow Diagram

<img width="7020" height="3910" alt="DataFlow Diagram NEW" src="https://github.com/user-attachments/assets/ff78b67b-899c-46a4-b695-243171d5de49" />
*Overview of the data flow across the system.*

---

## Project Overview

This project encompasses:

1. **Data Architecture**  
   Structuring the warehouse using best practices to manage raw, cleansed, and curated data layers.

2. **ETL Pipelines**  
   Extracting, transforming, and loading data from source systems into the warehouse.

3. **Data Modeling**  
   Creating fact and dimension tables optimized for performance and analytical use cases.

4. **Analytics & Reporting**  
   Developing SQL-based reports that uncover trends, performance metrics, customer segmentation, and other business insights.

---

## Building the Data Warehouse (Data Engineering)

### Objective

Design and implement a modern data warehouse using SQL Server, consolidating data from ERP and CRM systems to support analytics and decision-making.

### Specifications

- **Data Ingestion**  
  Loaded CSV files from two source systems (ERP and CRM) into staging tables.

- **Data Quality**  
  Identified and resolved data quality issues such as null values, inconsistent formats, and invalid entries.

- **Data Integration**  
  Merged both sources into a unified analytical model following the Medallion Architecture (Bronze, Silver, Gold).

- **Scope**  
  Focused on the latest data snapshot; historical tracking was not required.

- **Documentation**  
  Structured and documented the data model to ensure clarity for both technical and non-technical users.

---

## Analytics & Reporting (Data Analysis)

### Objective

Develop SQL-based analytics to provide detailed insights into:

- **Customer Behavior**  
  Segment customers by lifecycle stage, age, recency, and spending patterns (e.g., VIP, Regular, New).

- **Product Performance**  
  Evaluate top- and low-performing products using revenue contribution, sales quantity, and activity lifespan.

- **Sales Trends**  
  Analyze monthly and yearly trends, cumulative growth, and part-to-whole contributions.

These insights empower stakeholders with clear, data-driven metrics to support strategic business decisions and enhance performance.

---

## Acknowledgements

A big thank you to Baraa Khatib Salkini (Data With Baraa) for the inspiring course and valuable resources that fueled this project.

[The Complete SQL Bootcamp](https://www.udemy.com/course/the-complete-sql-bootcamp-30-hours-go-from-zero-to-hero/)
