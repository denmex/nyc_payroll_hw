# nyc_payroll_hw
# ReadMe
## a. Business Requirements
- The goal is to help the human resource department to analyze department spending to track costs, point out outlier spending, and evaluate employee compensation based on their base salary and overtime hours. 
- The goal is to help human resources identify the differences in salary based on positions and structure within the payroll data.
- The goal is to help government agencies analyze which department faced the highest overtime costs and identify any barriers preventing efficient work and to be able to improve from them.

## b. Functional Requirements
- The system will calculate the total payroll by filtering by department and be able to determine which department has the highest total payroll. 
- The system will be able to analyze the difference in salary and how the costs are being distributed across roles and departments.
- The system will be able to calculate which department has the most overtime usage filtering by department and total the number of overtime hours to be able to compare. 

## c. Data Requirements 

The Citywide Payroll Data is a record-level style data set that depicts the relationship between government workers and their fiscal year salaries. Each record symbolizes an employee’s individual payroll information with variables such as Agency Name, Base Salary, Regular Hours, Overtime Hours, and Regular Hour Gross Pay. This dataset is organized in an indexed format with multiple categories and numeric fields. Thai is how we can differentiate the department levels and employees. 

Since the dataset contains a large amount of raw data with the required number of columns, it meets the requirements to proceed with the following analysis. We are able to be flexible with this dataset and use data modeling to be able to gather information needed. This data is updated periodically where we can find historical analysis and trends. Since it is not frequently updated we would not be looking into a real-time analysis. Thus, a Decision Support System (DSS) can be built to be able to understand workers salaries, department spending, and patterns throughout the fiscal year. 

## d. Data Sourcing
The method I have decided to use was to download the CSV file rather than using other methods. The project focuses more on historical data and being able to ingest into the data warehouse with a big database and be suitable to be cleaned. Even though the data is up to date, it does not update every second rather it updates periodically, thus taking away the API method. 

## e. Information Architecture 
Overview: This Information Architecture will process NYC payroll data to help Human Resource departments and government agencies be able to analyze employee compensation, overtime, and department’s spending patterns. 

Structure: 
- Data Source: Citywide Payroll Data (Fiscal Year)
- Ingestion: CSV File
- Processing: Clean and transform data based on salaries, overtime, departments, and roles.
- Storage: Fact and Dimension tables
- Analysis: Find trends and reports for users that are only granted permission (Human Resource Department, Government Agencies)
  - Can not edit any raw or output data, data is based on accumulated and processed data from datasets.
  - Reports should not include employee personal information such as first and last names and middle initial.
- Diagram:
<img width="1028" height="148" alt="TECHNICAL_ARCH drawio" src="https://github.com/user-attachments/assets/fdfbb442-0d94-4d11-8c4a-92b1448fb339" />
(used draw.io)

- Description: The system starts with the NYC Citywide Payroll Dataset that contains our main source of data with employee payroll records. The data is then ingested to be processed, cleaned, and transformed to be ready for the data warehouse. This way we can use fact and dimensional tables to analyze patterns and trends we notice in department spending, overtime costs, and various salaries. Only human resources and government agencies are able to use this system for further analysis where they can use reports and databases to create future decisions. 

## f. Data Architecture
- Overview: This Data Architecture will help depict how the NYC Citywide Payroll Data is accumulated, processed, stored, and then gathered in a structured pipeline. This will help analyze and report using the organized pipeline and make sure data is consistent and adaptable when looking at payroll, overtime, and department spending patterns. 
- Structure: 
  - Data Source: Citywide Payroll Data (Fiscal Year)
  - Ingestion: CSV File
  - Processing: Using ETL
   - Extracting the raw payroll data
   - Transform by cleaning the data from missing values and normalize fields such as salary and overtime 
   - Load the data into a data warehouse 
- Storage: Fact and Dimension tables
  - Fact: Gross pay, overtime hours, salary
  - Dimension: Department name, fiscal year, location
- Analysis: Users with granted permission (Human Resource Department, Government Agencies) can access data and reach filter outputs for reporting and decision making
  - Reports should not include employee personal information such as first and last names and middle initial.
- Diagram:
<img width="1425" height="413" alt="DATA_ARCH drawio (1)" src="https://github.com/user-attachments/assets/abd90d60-65ef-41ca-9e37-29b8309617fa" />
(used draw.io)

- Description: The system starts with the NYC Citywide Payroll dataset and is extracted as a CSV file, ingested, and then goes into the ETL process. During this ETL process the data is cleaned, transformed, and loaded to be able to better analyze trends. It then goes into the data warehouse where both fact and dimensional tables are used to be able to be consistent with the large dataset. Finally, users can make decisions based on its trends and outputs that will help with budgeting, work plans, and policies. 
 
## g. Dimensional Modeling 
 - Dictionary : https://docs.google.com/spreadsheets/d/1YQh6Sb5KLJKRqJkGTsdkpQ0zi_cxyKetI2tjYlCZK7I/edit?usp=sharing
(used google sheets)
<img width="1366" height="920" alt="HW 1" src="https://github.com/user-attachments/assets/77beec3e-bff0-4f5e-b510-7ca11f098c8b" />
(used lucid charts)

## h. ETL Pipeline (Python)
- The ETL Pipeline was constrcuted using Python and Pandas to be able to process the NYC Citeywide Payroll dataset.
### Extract:
-   the dataset was loaded from a CSV files that holds NYC Payroll for the 2025 fisical year.
### Transform:
-   Removed null and duplicate values
-   Converted salarty and overtime feilds into numeric values
-   Standarized column names
-   Annonimize personal information (first name, last name, middle name)
-   Used anonymization by using a UUID-based hashing function to protect employee self identity.
### Load:
-   Clean data was loaded into a data warehouse
-   Data was organized into fact and dimensional tables to analyze further

## i. Data Privacy
- To comply with privacy requirements, all employee personal information will be removed.
- A UUID function will be used to anonymize employees.
-   the employee will be connected through an employee id
-   no personal information will be stored in the final database
- This will improved safe analyzations when reporting records.

## j. Data Warehouse
- A star schema will be used to implement the fact and dimensional tables
### Fact Table:
- Payroll_Fact_Table
### Dimensional Tables:
- Employee_Info
- Agency_Info
- Job_info
- Location_Info
- Time_Info

## k. Analysis
- The following analysis is found during this process:
-   Total payroll spending filtered by department
-   Identify departments with the highest overtime usage
-   Compare salaries based off roles and positions
-   Analyze cost distribution by department
- These insights will benefit human resources and government agencies when building efficency and in decision-making.


