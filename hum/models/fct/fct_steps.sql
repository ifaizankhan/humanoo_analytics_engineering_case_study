WITH src_steps AS (
    SELECT
        *
    FROM
        {{ ref('src_steps') }}
)
SELECT
    activity_date,
    user_id,
    no_of_steps
FROM
    src_steps