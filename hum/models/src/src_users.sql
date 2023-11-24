WITH users AS (
    SELECT
        *
    FROM
        {{ source( 'case_study','users')}}
)
SELECT 
    user_id,
    user_name,
    company_id,
    company_name,
    company_size
FROM
    users
    
    
