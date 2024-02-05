{{
    config(
        materialized='view',
        tags=['salesforce']
    )
}}

WITH source_data AS (

   SELECT * FROM {{ source('salesforce','account') }}

)

SELECT *
FROM source_data
