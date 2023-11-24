WITH src_users AS (
    SELECT
        *
    FROM
        {{ ref('src_users') }}
)
SELECT
    user_id,
    user_name,
    company_id
FROM
    src_users