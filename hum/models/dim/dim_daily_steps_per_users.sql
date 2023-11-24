WITH
u AS (
    SELECT
        *
    FROM
        {{ ref('dim_users') }}
),
s AS (
    SELECT * 
    FROM {{ ref('fct_steps') }}
),
a AS (
    SELECT
        u.user_id,
        s.activity_date,
        sum(s.no_of_steps) AS daily_steps_per_users
    FROM u
    LEFT JOIN s ON (u.user_id = s.user_id)
    GROUP BY s.activity_date,u.user_id
)

SELECT
    a.*,
    u.user_name
FROM a
LEFT JOIN u ON (a.user_id = u.user_id)
