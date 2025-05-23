# Walmart Sales Data Analysis: End-to-End with Kaggle API, Python, SQL, and Power BI 

## Project Overview

![Project Pipeline](https://github.com/SushantChavan1999/Walmart_Sales/blob/main/Workflow_Diagram_Walmart_Sales_Analysis.png)

This project presents an end-to-end data analysis solution using Walmart sales data. The dataset was acquired through the Kaggle API, followed by data cleaning and exploration in Python using Jupyter Notebook. The processed data was stored in MySQL for advanced querying. Lastly, Power BI was used to create interactive dashboards to visualize key business insights.

---

## Project Steps

### 1. Set Up the Environment
   - **Tools Used**: Jupyter Notebook, Python, MySQL, Power BI 
   - **Goal**: Organize the project folders for smooth development and data handling, ensuring efficient workflow from data acquisition to analysis and visualization.

### 2. Set Up Kaggle API
   - **API Setup**: Obtain your Kaggle API token from [Kaggle](https://www.kaggle.com/) by navigating to your profile settings and downloading the JSON file.
   - **Configure Kaggle**: 
      - Place the downloaded `kaggle.json` file in your local `.kaggle` folder.
      - Use the command `kaggle datasets download -d <dataset-path>` to pull datasets directly into your project.

### 3. Download Walmart Sales Data
   - **Data Source**: Use the Kaggle API to download the Walmart sales datasets from Kaggle.
   - **Dataset Link**: [Walmart Sales Dataset](https://www.kaggle.com/najir0123/walmart-10k-sales-datasets)
   - **Storage**: Save the data in the `data/` folder for easy reference and access.

### 4. Install Required Libraries and Load Data
   - **Libraries**: Install necessary Python libraries using:
     ```bash
     pip install kaggle pandas numpy pymysql sqlalchemy mysql-connector-python
     ```
   - **Loading Data**: Read the data into a Pandas DataFrame for initial analysis and transformations.

### 5. Explore the Data
   - **Goal**: Conduct an initial data exploration to understand data distribution, check column names, types, and identify potential issues.
   - **Analysis**: Use functions like `.info()`, `.describe()`, and `.head()` to get a quick overview of the data structure and statistics.

### 6. Data Cleaning
   - **Remove Duplicates**: Identify and remove duplicate entries to avoid skewed results.
   - **Handle Missing Values**: Drop rows or columns with missing values if they are insignificant; fill values where essential.
   - **Fix Data Types**: Ensure all columns have consistent data types (e.g., dates as `datetime`, prices as `float`).
   - **Currency Formatting**: Use `.replace()` to handle and format currency values for analysis.
   - **Validation**: Check for any remaining inconsistencies and verify the cleaned data.

### 7. Feature Engineering
   - **Create New Columns**: Calculate the `Total Amount` for each transaction by multiplying `unit_price` by `quantity` and adding this as a new column.
   - **Enhance Dataset**: Adding this calculated field will streamline further SQL analysis and aggregation tasks.

### 8. Load Data into MySQL
   - **Set Up Connections**: Connect to MySQL using `SQLAlchemy` and load the cleaned data into the database.
   - **Table Creation**: Set up tables in MySQL using Python SQLAlchemy to automate table creation and data insertion.
   - **Verification**: Run initial SQL queries to confirm that the data has been loaded accurately.

### 9. SQL Analysis: Complex Queries and Business Problem Solving
   - **Business Problem-Solving**: Write and execute complex SQL queries to answer critical business questions, such as:
     - Revenue trends across branches and categories.
     - Identifying best-selling product categories.
     - Sales performance by time, city, and payment method.
     - Analyzing peak sales periods and customer buying patterns.
     - Profit margin analysis by branch and category.
   - **Documentation**: Keep clear notes of each query's objective, approach, and results.

### 10. Power BI: Data Visualization and Reporting
   - **Connect to MySQL:** Use Power BI’s MySQL connector to import the processed data from the database.
   - **Dashboard Creation:** Design interactive and informative dashboards, including visualizations such as:
     - Sales and Profit Overview
     - Sales Trend Analysis
     - Product & Category Performance
   - **Business Insights:** Display key metrics and insights in a visually appealing way to assist decision-making.

### 11. Project Publishing and Documentation
   - **Documentation**: Maintain well-structured documentation of the entire process in Markdown or a Jupyter Notebook.
   - **Project Publishing**: Upload the finalized project to GitHub including:
    	- The `README.md` file (this document).
     	- Jupyter Notebooks file.
     	- SQL query scripts.
	- Power BI file.
     	- Data files.
	
---

## Requirements

- **Python 3.8+**
- **SQL Databases**: MySQL
- **Python Libraries**:
  - `pandas`, `numpy`, `pymysql`, `sqlalchemy`, `mysql-connector-python`
- **Kaggle API Key** (for data downloading)
- **Power BI** (for creating interactive dashboards)
- **Jupyter Notebook** (for development and analysis)

## Getting Started

1. Clone the repository:
   ```bash
   git clone <repo-url>
   ```
2. Install Python libraries:
   ```bash
   pip install -r requirements.txt
   ```
3. Set up your Kaggle API, download the data, and follow the steps to load and analyze.

---

## Project Structure

```plaintext
|-- data/                     # Raw data and transformed data
|-- notebooks/                # Jupyter notebooks for Python analysis
|-- sql_queries/              # SQL scripts for analysis and queries
|-- dashboards/               # Power BI for visualization
|-- README.md                 # Project documentation
|-- requirements.txt          # List of required Python libraries
|-- main.py                   # Main script for loading, cleaning, and processing data
```
---

## Results and Insights

This section will include your analysis findings:
- **Sales Insights**: Key categories, branches with highest sales, and preferred payment methods.
- **Profitability**: Insights into the most profitable product categories and locations.
- **Customer Behavior**: Trends in ratings, payment preferences, and peak shopping hours.

## Future Enhancements

Possible extensions to this project:
- Additional data sources to enhance analysis depth.
- Automation of the data pipeline for real-time data ingestion and analysis.

---

## License

This project is licensed under the MIT License. 

---

## Acknowledgments

- **Data Source**: Kaggle’s Walmart Sales Dataset
- **Inspiration**: Walmart’s business case studies on sales and supply chain optimization.

---
