WITH dedup_query AS (
    SELECT 
        *,
        row_number() OVER (PARTITION BY id ORDER BY updatedDate DESC) AS dedup_id
    FROM
        {{ source('source', 'items') }}
)
SELECT 
    id, name, category, updatedDate
FROM 
    dedup_query
WHERE
    dedup_id = 1