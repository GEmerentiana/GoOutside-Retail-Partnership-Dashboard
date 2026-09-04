# Project Notes

## Analytical Logic

The dashboard combines sales, product, and retailer information.

The SQL calculates sales using:

`Quantity × Unit sale price`

Retailer growth is calculated by comparing the current year's retailer sales with the previous year's sales using `LAG()`.

Retailer-network growth is calculated by comparing the current year's distinct retailer count with the previous year's count.

## Business Interpretation

The dashboard is intended to move from:

1. Market structure
2. Important retailers
3. Overall sales growth
4. Individual retailer growth
5. Retailer-network growth

toward a practical partnership-growth decision.

## Important Portfolio Note

The repository documents the project methodology and dashboard. It should not expose private data, credentials, API keys, or service-account files.
