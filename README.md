Employee Attrition Analysis Dashboard

📌 Overview

This project provides an interactive dashboard to analyze employee attrition using a dataset containing HR records. It is developed using **Plotly Dash**, **Pandas**, and **Plotly Express**.

The primary goal is to uncover insights about which factors contribute to employee attrition and support strategic HR decision-making through data-driven analysis.

📂 Dataset 

The dataset includes anonymized HR data for employees and contains the following features:

Demographics: Age, Gender, Marital Status, etc.
Job Information: Department, Job Role, Years at Company, OverTime, etc.
Compensation: Monthly Income, Percent Salary Hike, Stock Option Level.
Performance & Satisfaction: Job Satisfaction, Performance Rating, Training Times Last Year.
Target Variable: `Attrition` (0 = No, 1 = Yes)

One-hot encoding is applied to categorical features like `MaritalStatus`, `JobRole`, and `Department`.

🔍 Key Project Findings

📈 Attrition Insights
OverTimeis a major factor linked with attrition. Employees working overtime have a significantly higher attrition rate.
Job Role Impact: Some job roles like Sales Executive and Laboratory Technician see higher attrition counts.
Gender Influence: Males show slightly higher attrition, but it's not the dominant factor.
Marital Status: Single employees tend to leave more compared to married ones.

💰 Compensation Trends

Employees with lower monthly incomes show higher attrition trends.
The average monthly income varies significantly across job roles.

🏢 Departmental View

Research & Development employs the highest number of employees.
Attrition rates vary across departments, with **Sales** showing a relatively higher attrition rate.

📊 Training & Performance

Higher **training times** and **performance ratings** do not always correlate with lower attrition.
Employees with lower satisfaction levels tend to leave earlier.


💡 Technologies Used

Python (Pandas, Plotly, Dash)
SQL (for backend analytics)
Jupyter Notebook (Exploratory Data Analysis)
HTML/CSS (via Dash for layout)

📁 Project Structure


├── data/

│   └── employee_data.csv

├── 1_data_cleaning_analysis.ipynb

├── 2_attrition_sql_queries.sql

├── 3_insights_charts.py

├── 4_dashboard_plotly_dash.py

├── README.md

📬 Contact

For any questions, reach out to the project maintainer.

