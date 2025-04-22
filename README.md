# smart-sales-duckdb-sql

> Use DuckDB and SQL to explore a star-schema data warehouse built from the realistic Microsoft Contoso Sales dataset - no Python

The data is a realistic set already provided in CSV files organized in a star schema. 

--- 

## About the Tools

**DuckDB** For the Data Warehouse (DW)

- DuckDB is a newer datastore built especially for OLAP.  
- It's about as easy to use as SQLite, but has improved support for built-in data types.  
- It can run in-memory (just while scripts are running), or be persisted in a simple file.

**SQL** For Querying the DW

- SQL is a powerful language for querying structured data.

**VS** Code for Editing SQL Files

- We recommend VS Code to open the project folder and edit .sql files.  

---

## Folder Structure

The folder structure matches our other smart sales projects.

- data/prepared/ — Contains cleaned CSV files representing dimensions and fact tables.
- dw/ — Contains sales.duckdb, a DuckDB database file loaded from the CSVs.
- sql/ — Contains SQL scripts for rebuilding the database and performing analysis.

| Type      | File                        | Purpose                          |
|-----------|-----------------------------|--------------------------------------------------|
| Fact      | FactSales.csv               | Core transactional data                          |
| Dimension | DimCustomer.csv             | Who bought                                       |
| Dimension | DimDate.csv                 | When bought                                 |
| Dimension | DimProduct.csv              | What bought                                 |
| Dimension | DimProductSubcategory.csv   | Mid-level product grouping (drill-down)          |
| Dimension | DimProductCategory.csv      | Top-level product grouping (drill-down)          |
| Dimension | DimPromotion.csv            | Why (influence of discounts or campaigns)        |
| Dimension | DimStore.csv                | Where (location, store type)                     |


---

## Install VS Code and Extensions

If you don't already have VS Code, install it from [https://code.visualstudio.com](https://code.visualstudio.com).

## Install DuckDB Command Line Interpreter (CLI)

### Option 1: Use a Package Manager (Recommended)

On Windows, open a PowerShell terminal and run:

```shell
winget install DuckDB.cli
```

On Linux or Mac, open a terminal and run one of the following install commands and make it executable:

```shell
brew install duckdb 
apt install duckdb
```

### Option 2: Download the DuckDB File And Make it Executable

Additional options are available from the [DuckDB Homepage](https://duckdb.org/). 
Scroll down to Installation. 

If you download a file called duckdb from the DuckDB website, put it in your root project folder. You may need to uncompress or unzip the file to get to the executable for your operating system. 
Put that uncompressed, unzipped file in your root project folder.

If Mac/Linux, you may need to make the file executable. 

1. Open a terminal in the root project folder. 
2. Run this command:

```shell
chmod +x duckdb
  ```

Important: To verify installation, CLOSE and REOPEN a new terminal window and run:

```shell
duckdb --version
```

If the above command does not work, try one of these, depending on your system and how you're launching it:

```shell
./duckdb --version
.\duckdb --version
```

---

## Step 1: Copy the Repo / Clone it Down / Open in VS Code

- Log into GitHub. Click on this repo and Copy the template to get it into your GitHub account. 
- Click on your new GitHub repo and clone it down. 
- Open the repo on your machine in VS Code. 

See [pro-analytics-01/](https://github.com/denisecase/pro-analytics-01/) for more information. 
See 01-machine-setup and 02-Project-Initialization steps 1 and 2. 

---

## Step 2: Open a Terminal And Recreate the DW (Optional)

IMPORTANT: Restart VS Code if it was open while installing DuckDB so it gets the updated system environment. 

With the project repository open in VS Code, open a new terminal using the VS Code menu: Terminal / New Terminal. 
By default, this opens PowerShell on Windows and zsh or bash on macOS or Linux.  
If you're on Windows, you can also select Git Bash from the dropdown if it's installed.

The following command works in these terminal types: **zsh**, **bash**, and **Git Bash (on Windows)**.  
We recommend Git Bash for consistency across platforms. It supports the handy redirection operator (<).

The command: 

- Starts DuckDB. 
- Points it to the dw/sales.duckdb file (which will be created if it doesn't exist).
- Redirects and executes the SQL from sql/00_build_dw.sql into that database.

```shell
duckdb dw/sales.duckdb < sql/00_build_dw.sql
```

PowerShell doesn't support the < redirection operator. 
If you're using PowerShell, use this command instead.
It reads the SQL file and pipes its content (provides it as input) to DuckDB:

```shell
Get-Content sql/00_build_dw.sql | duckdb dw/sales.duckdb
```

---

## Step 3: Open the DuckDB Data Warehouse (DW)

Use your terminal to open the duckdb file.

The following command works in all terminal types (thank you DuckDB!)

```shell
duckdb dw/sales.duckdb
```

## Know How to Exit the DuckDB CLI

To exit the DuckDB CLI, either type EITHER one of these or try CTRL D or CTRL Z:

```shell
.quit
.exit
```

---

## Step 4: Run a SQL Script

### Option 1: Run from DuckDB CLI. If you closed it, we'll open it again.

First, open the DuckDB CLI and then type the SQL command.

The following command works in all terminal types (thank you DuckDB!)

```shell
duckdb dw/sales.duckdb
```

Once in the CLI, **at the D prompt**, type your SQL commands one at a time.

For example, try some of the following - e.g., just type SHOW TABLES; and hit Enter/Return after the semicolon (;) or after pasting with the mouse. 

```sql
-- List all tables
SHOW TABLES;

-- View column names and types for one table
DESCRIBE dim_product;

-- See the first few rows from the product table
SELECT * FROM dim_product LIMIT 5;

-- Find the top 5 most expensive products
SELECT ProductKey, ProductName, UnitPrice FROM dim_product ORDER BY UnitPrice DESC LIMIT 5;

-- Count the number of sales records
SELECT COUNT(*) FROM fact_sales;

```


### Option 2: Run from a VS Code Terminal (zsh/bash/Git Bash if Windows). 

To execute a saved SQL file from the terminal (run each command one at a time):

```shell
duckdb dw/sales.duckdb < sql/11_tables_show_list.sql
duckdb dw/sales.duckdb < sql/12_tables_describe_all.sql
duckdb dw/sales.duckdb < sql/13_tables_row_counts.sql
duckdb dw/sales.duckdb < sql/21_sales_summary_totals.sql
```

If you want to use a PowerShell terminal instead, use:

```shell
Get-Content sql/11_tables_show_list.sql | duckdb dw/sales.duckdb
Get-Content sql/12_tables_describe_all.sql | duckdb dw/sales.duckdb
Get-Content sql/13_tables_row_counts.sql | duckdb dw/sales.duckdb
Get-Content sql/21_sales_summary_totals.sql | duckdb dw/sales.duckdb
```

---

## Recommended

Explore additional .sql files in the sql/ folder or write your own queries using VS Code or your preferred text editor.

For an extended version of this project with Python and Jupyter notebooks, see the [realistic-sales-duckdb-python](https://github.com/denisecase/smart-sales-duckdb-sql-python) repo.

Source: Kaggle (448 MB Full Clean Dataset): <https://www.kaggle.com/datasets/bhanuthakurr/cleaned-contoso-dataset>
