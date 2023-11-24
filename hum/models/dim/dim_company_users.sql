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
c AS (
    SELECT * 
    FROM {{ ref('dim_company') }}
),
a AS (
    SELECT
        u.company_id,
        u.user_id,
        sum(s.no_of_steps) > 0 AS has_step_data
    FROM u
    LEFT JOIN s on s.user_id = u.user_id
    GROUP BY u.company_id, u.user_id
),
step_data AS (
    SELECT 
        company_id, count(DISTINCT user_id) as no_of_users,
        SUM(CASE WHEN has_step_data = 1 THEN 1 ELSE 0 END) as users_having_steps
    FROM a 
    GROUP BY company_id
)

SELECT
    step_data.*,
    c.company_name
FROM step_data 
LEFT JOIN c on c.company_id = step_data.company_id


