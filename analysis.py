import duckdb
import pandas
import matplotlib.pyplot as plt


cursor = duckdb.connect(database='case_study.duckdb')


daily_avg_steps_df = cursor.sql("select AVG(avg_steps) From (select AVG(daily_steps_per_users) as avg_steps from dim_daily_steps_per_users GROUP BY activity_date)").df()

print(daily_avg_steps_df)

#top_10_users
top_10_users = cursor.sql("select * from dim_daily_steps_per_users ORDER BY daily_steps_per_users DESC LIMIT 10 ").df()

top_10_users_plot = top_10_users.plot(kind='barh',x='user_name',y='daily_steps_per_users')

top_10_users_plot.figure.savefig('top_10_users.png')

#bottom_10_users
bottom_10_users = cursor.sql("select * from dim_daily_steps_per_users ORDER BY daily_steps_per_users ASC LIMIT 10 ").df()

bottom_10_users_plot = bottom_10_users.plot(kind='barh',x='user_name',y='daily_steps_per_users')
bottom_10_users_plot.figure.savefig('bottom_10_users.png')

# Show per "Company Name" amount of users and calculate % of how many users have steps data

company = cursor.sql("SELECT *,(no_of_users/users_having_steps)*100 as percentage_of_users_have_step_data FROM dim_company_users").df()

# Test to see if the users dont have any data
# company = cursor.sql("SELECT * FROM dim_users LEFT JOIN fct_steps on fct_steps.user_id =dim_users.user_id WHERE fct_steps.user_id is NULL").df()

company_plot = company.plot(kind='barh',x='company_name',y='percentage_of_users_have_step_data')
company_plot.figure.savefig('company.png')
