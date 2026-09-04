# GoOutside Retail Partnership Dashboard

**Retail Analytics & Business Intelligence Project**

SQL · Google BigQuery · Looker Studio · Data Visualization · Business Analysis

An interactive retail analytics dashboard developed to help a Retail Partnership decision-maker understand **market structure, retailer performance, sales growth, and retailer-network development**.

---

## 📊 Live Dashboard

**[Open the Interactive Looker Studio Dashboard](https://datastudio.google.com/s/qiFoO638v8M)**

> Access to the dashboard may depend on the Looker Studio sharing settings.

---

## 🎯 Project Overview

The objective of this project is to transform retail sales data into an interactive business intelligence dashboard that supports partnership and growth decisions.

The dashboard allows the user to move from a high-level view of the markets to detailed retailer performance and growth analysis.

The analysis focuses on two main strategic questions:

* Should the business focus on **strengthening existing retailer partnerships**?
* Or should it focus on **expanding the retailer network**?

---

## 💼 Business Problem

A retail partnership team needs to understand how sales and retailer networks are developing across different markets.

Simply looking at total sales does not provide enough information for decision-making.

A market with high sales may have only a few major retailers, while another market may have many smaller retailers contributing to sales.

Therefore, the dashboard combines:

* Market structure
* Retailer count
* Total sales
* Retailer performance
* Sales growth
* Retailer-network growth

This provides a more complete view of the business and helps identify appropriate growth strategies.

---

## ❓ Key Business Questions

The dashboard was designed to answer:

1. Which markets generate the highest sales?
2. How many retailers operate in each market?
3. Which retailers generate the highest sales?
4. Which retailers are growing or declining?
5. How are overall sales developing?
6. Is the retailer network expanding?
7. Which markets require more attention?
8. Should the business strengthen existing partnerships or expand the retailer network?

---

# 📈 Dashboard

The dashboard contains six analytical pages.

### 1. Dashboard Overview

Provides an interactive overview of the sales data.

Available filters include:

* Year
* Country
* Retailer
* Product
* Product Line
* Brand

The dashboard updates key figures such as:

* Total sales
* Sales quantity
* Price
* Percentage contribution

---

### 2. Market Overview

Provides an overview of the different markets.

The map represents markets using bubbles that show:

* Number of retailers
* Total sales

This allows markets to be compared based on both sales volume and retailer-network size.

A market with high sales and relatively few retailers may indicate a concentrated market.

A market with many retailers and distributed sales may indicate a more fragmented and competitive market.

---

### 3. Retailer Sales Overview

Focuses on individual retailer performance.

The page shows:

* Retailer name
* Country
* Total sales

This allows important retail partners and high-performing retailers to be identified.

The analysis supports a strategy of strengthening existing partnerships where major retailers have a strong impact on the market.

**Target: 10% increase in sales volume per retailer.**

---

### 4. Overall Sales Growth

Provides a broader view of sales development across markets.

This page is designed to identify:

* Strong-growing markets
* Weak-growing markets
* Changes in overall sales performance

The results can be combined with market structure information to understand whether growth is coming from established or developing markets.

---

### 5. Sales Growth by Retailer

Provides a more detailed view of individual retailer performance.

Available filters:

* Year
* Retailer Name
* Country

The analysis helps identify retailers whose sales are:

* Increasing
* Decreasing
* Remaining relatively stable

This can support decisions about which existing partnerships require additional attention.

---

### 6. Growth in Number of Retailers

Measures the development of the retailer network.

This is particularly useful for fragmented markets where growth may depend on adding new retail partners.

The analysis compares the number of retailers over time.

**Target: 15% increase in the number of retailers.**

---

# 🧠 Business Decision Framework

The dashboard supports two different growth strategies.

### Strategy 1 — Concentrated Market

If a market is dominated by a small number of major retailers:

**Focus on existing partnerships**

* Identify the most important retailers
* Strengthen existing relationships
* Increase sales through existing partners
* Target a **10% increase in sales volume per retailer**

```text
High retailer concentration
          ↓
Focus on key retailers
          ↓
Strengthen partnerships
          ↓
+10% sales volume per retailer
```

---

### Strategy 2 — Fragmented Market

If sales are distributed across many retailers:

**Focus on retailer-network expansion**

* Identify opportunities for additional retail partners
* Expand the retailer network
* Monitor retailer-number growth
* Target a **15% increase in retailer numbers**

```text
Fragmented market
       ↓
Expand retailer network
       ↓
Acquire additional retailers
       ↓
+15% retailer growth
```

---

# 🗃️ Data

The project uses four datasets:

| Dataset                     | Description                  |
| --------------------------- | ---------------------------- |
| `GoOutside_daily_sales.csv` | Daily sales transaction data |
| `GoOutside_products.csv`    | Product information          |
| `GoOutside_retailers.csv`   | Retailer information         |
| `GoOutside_methods.csv`     | Order-method information     |

### Main Data Relationships

```text
                    ┌─────────────────┐
                    │    Products     │
                    │                 │
                    │ Product number  │
                    │ Product         │
                    │ Product line    │
                    │ Product brand   │
                    │ Unit cost       │
                    └────────┬────────┘
                             │
                             │ Product number
                             │
┌─────────────────┐          ▼
│  Daily Sales    │
│                 │
│ Date            │
│ Product number  │
│ Retailer code   │
│ Quantity        │
│ Unit sale price │
└────────┬────────┘
         │
         │ Retailer code
         │
         ▼
┌─────────────────┐
│   Retailers     │
│                 │
│ Retailer code   │
│ Retailer name   │
│ Country         │
└─────────────────┘
```

---

# 🧮 SQL Analysis

SQL was used to transform and aggregate the raw data for dashboard reporting.

The project includes analysis for:

* Sales by product
* Sales by brand
* Sales by product line
* Sales by retailer
* Sales by country
* Overall sales
* Sales growth by retailer
* Retailer-network growth

The SQL uses techniques including:

* `JOIN`
* `GROUP BY`
* `EXTRACT`
* `SUM`
* `COUNT(DISTINCT ...)`
* `ROUND`
* `ROW_NUMBER()`
* `LAG()`
* Year-over-year growth calculations

---

# 📊 Growth Calculations

### Retailer Sales Growth

Retailer sales growth is calculated by comparing the current year's sales with the previous year's sales.

```text
Sales Growth %
=
(Current Year Sales - Previous Year Sales)
/
Previous Year Sales
× 100
```

The previous year's value is obtained using the SQL `LAG()` window function.

---

### Retailer-Network Growth

Retailer-network growth compares the number of distinct retailers between years.

```text
Retailer Growth %
=
(Current Retailer Count - Previous Retailer Count)
/
Previous Retailer Count
× 100
```

---

# 🔄 Analytics Workflow

```text
             Raw Data
                 │
                 ▼
       ┌──────────────────┐
       │   BigQuery       │
       │   Data Tables    │
       └────────┬─────────┘
                │
                ▼
          SQL Analysis
                │
                ▼
       Aggregated Metrics
                │
                ▼
       ┌──────────────────┐
       │  Looker Studio   │
       │    Dashboard     │
       └────────┬─────────┘
                │
                ▼
       Business Insights
                │
                ▼
       Growth Strategy
```

---

# 🛠️ Tools & Technologies

* **SQL** — Data transformation and analytical calculations
* **Google BigQuery** — Data storage and SQL analysis
* **Google Looker Studio** — Interactive dashboard and visualization
* **CSV** — Source datasets
* **Data Visualization** — KPI and trend analysis
* **Business Analysis** — Retail partnership and growth recommendations

---

# 📁 Repository Structure

```text
GoOutside-Retail-Partnership-Dashboard/
│
├── README.md
├── .gitignore
│
├── dashboard/
│   └── dashboard_link.md
│
├── data/
│   ├── GoOutside_daily_sales.csv
│   ├── GoOutside_methods.csv
│   ├── GoOutside_products.csv
│   ├── GoOutside_retailers.csv
│   ├── README.md
│   └── data_dictionary.md
│
├── sql/
│   └── SQL_GoOutside_Dashboard_Dustin.sql
│
├── screenshots/
│   ├── README.md
│   └── dashboard screenshots
│
├── presentation/
│   └── GoOutside_Retail_Partnership_Dashboard_Presentation_Script.pdf
│
└── docs/
    └── project_notes.md
```

---

# 🎓 Skills Demonstrated

This project demonstrates practical experience with:

* Data analysis
* SQL
* BigQuery
* Data modeling
* Relational data joins
* KPI development
* Retail analytics
* Year-over-year analysis
* Growth analysis
* Window functions
* Interactive dashboard development
* Data visualization
* Business intelligence
* Translating analytical results into business recommendations

---

# 📌 Key Takeaway

The dashboard creates a decision process that moves from **market understanding to partnership strategy**:

```text
1. Understand market structure
              ↓
2. Identify important retailers
              ↓
3. Analyze overall sales growth
              ↓
4. Analyze individual retailer growth
              ↓
5. Analyze retailer-network growth
              ↓
6. Select the appropriate growth strategy
```

The result is a dashboard designed not only to report historical sales performance, but also to support **practical retail partnership decisions**.

---

# 📄 Presentation

A presentation script explaining the dashboard and its business purpose is available in the [`presentation`](presentation/) folder.

---

# ⚠️ Data & Confidentiality

The datasets included in this repository are provided as part of this portfolio project.

No passwords, API keys, service-account credentials, or other authentication information should be stored in this repository.

---

# 👤 Author

**GEmerentiana**

Data Analytics · Business Intelligence · SQL · BigQuery · Looker Studio

---

⭐ If you find this project useful, feel free to explore the SQL, dashboard, and analytical workflow.
