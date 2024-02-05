{{
    config(
        materialized='table',
        tags=['salesforce']
    )
}}

WITH stg_salesforce__product_2 AS (
    SELECT *
    FROM {{ ref('stg_salesforce__product_2') }}
    WHERE is_deleted = False
    AND is_active = True
)

SELECT
    salesforce_product_id
    , product_code
    , product_name
    , product_family
    , product_specialty_team
    , practice_c
FROM stg_salesforce__product_2