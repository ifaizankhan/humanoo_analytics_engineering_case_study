WITH src_users AS (
    SELECT
        *
    FROM
        {{ ref('src_users') }}
),
raw_company As(
SELECT
    company_id,
    company_name,
    company_size,
    row_number() OVER (partition by company_id) as row_id
FROM
    src_users
)

SELECT 
    *
FROM raw_company
WHERE row_id = 1