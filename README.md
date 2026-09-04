# GoOutside Retail Partnership Dashboard

Interactive retail analytics dashboard developed to help a Retail Partnership decision-maker understand market structure, retailer performance, sales growth, and retailer-network growth.

---
## Dashboard

**Live Looker Studio dashboard:**  
https://datastudio.google.com/s/qiFoO638v8M

> Note: The dashboard link may require the appropriate Google/Looker Studio access permissions.

---
## Business Objective

The project turns retail sales data into an interactive management dashboard. The analysis is designed to answer:

- How are markets structured?
- Which retailers generate the highest sales?
- Which markets and retailers are growing?
- Is the retailer network expanding?
- Where should the business focus partnership and growth efforts?

---
## Dashboard Pages

### 1. Dashboard Overview
Provides an interactive overview of sales performance. Users can filter by year, country, retailer, product, product line, and brand.

### 2. Market Overview
Compares markets using retailer count and total sales, helping identify concentrated versus more fragmented markets.

### 3. Retailer Sales Overview
Shows retailer name, country, and total sales so important retail partners can be identified.

### 4. Overall Sales Growth
Provides a broader view of sales development across markets without page-level filters.

### 5. Sales Growth by Retailer
Allows analysis by year, retailer, and country to identify retailers with increasing, decreasing, or stable sales.

### 6. Growth in Number of Retailers
Tracks the development of the retailer network and supports evaluation of network expansion.

---
## Business Decision Framework

The dashboard supports two main strategic directions:

**Market dominated by major retailers**
- Strengthen existing partnerships
- Target a 10% increase in sales volume per retailer

**More fragmented market**
- Expand the retailer network
- Target a 15% increase in the number of retailers

---
## Data & Analytics Workflow

```text
Raw Retail Sales Data
        |
        v
   BigQuery Tables
        |
        v
 SQL Analysis
        |
        v
Aggregated Metrics
        |
        v
 Looker Studio
        |
        v
Business Insights & Growth Decisions
```

---
## SQL Analysis

The `sql/` folder contains the SQL used for the dashboard analysis, including:

- Sales by products
- Sales by brands
- Sales by product lines
- Sales by retailers
- Sales by country
- Overall sales
- Sales growth by retailer
- Retailer growth

---
## Data

The raw dataset is intentionally not included in this public repository unless its redistribution is explicitly permitted.

See [`data/README.md`](data/README.md) for details.

---
## Project Documentation

The presentation script used to explain the dashboard is available in [`presentation/`](presentation/).

---
## Tools & Technologies

- SQL
- Google BigQuery
- Google Looker Studio
- Data visualization
- Business analysis
- Retail / partnership analytics

---
## Key Skills Demonstrated

- Data aggregation and transformation
- SQL joins and grouping
- Window functions such as `LAG()` and `ROW_NUMBER()`
- Year-over-year growth analysis
- Retailer and market segmentation
- KPI development
- Interactive dashboard design
- Translating data into business recommendations

---
## Repository Structure

```text
GoOutside-Retail-Partnership-Dashboard/
├── README.md
├── .gitignore
├── dashboard/
│   └── dashboard_link.md
├── sql/
│   └── SQL_GoOutside_Dashboard_Dustin.sql
├── data/
│   ├── GoOutside_daily_sales.csv
│   ├── GoOutside_products.csv
│   ├── GoOutside_retailers.csv
│   ├── GoOutside_methods.csv
│   ├── README.md
│   └── data_dictionary.md
├── screenshots/
│   └── README.md
├── presentation/
│   └── GoOutside_Retail_Partnership_Dashboard_Presentation_Script.pdf
└── docs/
    └── project_notes.md
```

---
## Disclaimer

This repository is a portfolio presentation of the analytical workflow and dashboard. Source data, credentials, API keys, service-account files, and other confidential information must not be committed to the repository.
