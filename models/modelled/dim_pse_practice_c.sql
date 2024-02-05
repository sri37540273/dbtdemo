{{
    config(
        materialized='table',
        tags=['salesforce']
    )
}}

SELECT *
FROM {{ ref('stg_salesforce__pse_practice_c') }}
