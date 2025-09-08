🚀 DBT (Data Build Tool) with Databricks – End-to-End Project
📌 Project Overview

This project demonstrates DBT (Data Build Tool) as the transform layer in the ELT pipeline using Databricks as the data platform. It covers DBT fundamentals, advanced features, and practical implementation of the Medallion Architecture (Bronze → Silver → Gold). The project also sets up CI/CD deployment from development to production.


DBT (Data Build Tool) is a transformation tool in the ELT process (Extract → Load → Transform).

It does not orchestrate workflows like Airflow or ADF and is not a data warehouse.

DBT relies on the compute resources of the connected platform (e.g., Databricks).

Key Advantages:

Modular, reusable SQL code with Jinja templates

Incremental loading, SCD handling

Built-in testing framework for data quality

High demand in modern data engineering

🛠 Core Concepts Implemented

DBT Models: SQL logic for building tables/views

Jinja & Macros: Dynamic SQL with loops, conditions, reusable functions

DBT Tests:

Generic tests: not null, unique, accepted values

Singular tests: Custom SQL validations

Custom generic tests using macros

DBT Seeds: Static lookup tables from CSV

DBT Snapshots: Implement SCD Type 2

Profiles & Configs:

profiles.yml: Connection details (Dev & Prod)

dbt_project.yml: Project metadata and configurations

ref() & source(): Model and source references for lineage

Environment Setup: Python 3.12, UV package manager, VS Code, Git

Medallion Architecture:

Bronze (raw), Silver (cleaned), Gold (aggregated)

🏗 Tech Stack

DBT Core

Databricks SQL Warehouse

Unity Catalog

Python 3.12

Git + GitHub

VS Code + DBT Power User Extension

UV (Package Manager)

⚙️ Setup Instructions
1. Prerequisites

Databricks account

Python 3.12 installed

Git installed

VS Code with:

Python extension

DBT Power User extension

2. Install and Configure DBT
# Install UV
pip install uv

# Create virtual environment
uv init

# Install DBT Core and Databricks adapter
uv add dbt-core dbt-databricks

3. Initialize DBT Project
dbt init


Choose databricks as adapter

Provide:

Host name

HTTP path

Access token (from Databricks Developer settings)

Enable Unity Catalog and set catalog/schema names

4. Verify Connection
dbt debug

5. Organize Models

Create folders inside models/:

models/
├── bronze/
├── silver/
├── gold/
└── sources/

📂 Project Structure
.
├── dbt_project.yml
├── profiles.yml
├── models/
│   ├── bronze/
│   ├── silver/
│   ├── gold/
│   └── sources/
├── seeds/
├── snapshots/
├── macros/
└── tests/

🔑 Important DBT Commands
dbt debug                # Validate setup
dbt run                  # Run models
dbt run --select bronze  # Run specific folder
dbt test                 # Execute tests
dbt seed                 # Load CSV seeds
dbt snapshot             # Build snapshots
dbt build                # Build models + tests + seeds
dbt build --target prod  # Deploy to Production

✅ Features Implemented

Medallion Architecture (Bronze → Silver → Gold)

Dynamic SQL with Jinja

Custom Macros

Data Quality Tests

Slowly Changing Dimensions (SCD Type 2) with Snapshots

Environment-aware deployments (Dev → Prod)

🔐 CI/CD and Deployment

Add Prod target in profiles.yml

Use Jinja ({{ target.catalog }}) to parameterize catalogs

Deploy with:

dbt build --target prod

📚 References

DBT Documentation

Databricks Documentation


﻿# dbt-Data-build-tool_project

