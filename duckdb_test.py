import duckdb


cursor = duckdb.connect(database='case_study.duckdb')


print(cursor.execute('select AVG(avg_steps) From (select AVG(daily_steps_per_users) as avg_steps from dim_daily_steps_per_users GROUP BY activity_date)').fetchall())
# print(cursor.execute('select * from dim_daily_avg_by_all_users').fetchall())
# print(cursor.execute('select u.user_id, s.no_of_steps from src_users as u LEFT JOIN src_steps as s on u.user_id=s.user_id WHERE s.user_id is NULL').fetchall())
