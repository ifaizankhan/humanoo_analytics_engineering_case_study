import duckdb

cursor = duckdb.connect(database='case_study.duckdb')

cursor.sql("CREATE TABLE users AS SELECT * FROM 'source_files/users.csv'")   
cursor.sql("CREATE TABLE steps AS SELECT * FROM 'source_files/steps.csv'")    

# cursor.sql("SELECT * FROM users").show()
cursor.close()