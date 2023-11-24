WITH steps AS (
    SELECT
        *
    FROM
        {{ source( 'case_study','steps')}}
)
SELECT 
    activity_date,
    user_id,
    value AS no_of_steps
FROM
    steps
    
    
