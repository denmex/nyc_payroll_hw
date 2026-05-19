-- =========================================
-- NYC Payroll Data Warehouse (Star Schema)
-- =========================================

-- =========================
-- DIMENSION TABLES
-- =========================

-- Employee Dimension (anonymized)
CREATE TABLE dim_employee (
    employee_id VARCHAR(64) PRIMARY KEY,
    work_location_borough VARCHAR(100)
);

-- Department Dimension
CREATE TABLE dim_department (
    payroll_number INT PRIMARY KEY,
    agency_name VARCHAR(255)
);

-- Job / Role Dimension
CREATE TABLE dim_job (
    job_id INT IDENTITY(1,1) PRIMARY KEY,
    title_description VARCHAR(255),
    pay_basis VARCHAR(50)
);

-- Time Dimension
CREATE TABLE dim_time (
    fiscal_year INT PRIMARY KEY
);

-- =========================
-- FACT TABLE
-- =========================

CREATE TABLE fact_payroll (
    record_id INT IDENTITY(1,1) PRIMARY KEY,

    employee_id VARCHAR(64),
    payroll_number INT,
    job_id INT,
    fiscal_year INT,

    base_salary FLOAT,
    regular_hours FLOAT,
    regular_gross_paid FLOAT,
    ot_hours FLOAT,
