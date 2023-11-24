## Results

### Daily avg steps for all users: 8165.71 
![](top_10_users.png?raw=true)
![](bottom_10_users.png?raw=true)
![](company.png?raw=true)


### What is this repo for?
This repository is the base for case Study at Humanoo, for Analytics Engineer position.
The purpose of it is to test the knowledge of: Python, SQL, dbt

### Setup / Stack

Please use:
- **Python** 3.9 or higher.
- **dbt-core** 1.5.x or higher
- **duckdb** 0.9.x

During this Case Study you would need DuckDB as your DB Engine.
You could install only this package: "dbt-duckdb"
, which will install: dbt-code, duckdb

You can test if you installed DuckDB properly using "duckdb_test.py"


### Tasks
1. Use files inside "source_files" directory as foundation or source for your dbt models, with this data model
   - **users**:
     - user_id - Unique Identifier of a User
     - user_name - Nickname of a User
     - company_id - Unique Identifier of a Company
     - company_name - Company Name
     - company_size - Number of employees
   - **steps_data**:
     - **activity_date** - Date of activity (i.e. when the steps were tracked)
     - **user_id** - Unique Identifier of a User
     - **steps** - How many steps were tracked
2. Design your dbt models, so they could answer the question below and are scalable 
3. Write these Queries with SQL and show the result with Pandas (plain text or chart - is up to you):
    - Show the daily average number of steps for all the users, i.e. it should be 1 number 
    - Show per "Company Name" amount of users and calculate % of how many users have steps data
    - Show the top 10 and bottom 10 users (user_name) with the most (and least) steps collect in 1 day.
