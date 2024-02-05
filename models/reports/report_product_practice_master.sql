{{
    config(
        materialized='table',
        tags=['salesforce']
    )
}}

WITH product AS (
    SELECT *
    FROM {{ ref('dim_product_2') }}
)

, pse_practice_c AS (
    SELECT *
    FROM {{ ref('dim_pse_practice_c') }}
)

SELECT
  product.salesforce_product_id
  , product.product_code
  , product.product_name
  , product.product_family
  , product.product_specialty_team
    
  ,practice_4.name AS practice_level_4
  ,practice_3.name AS Spractice_level_3
  ,practice_2.name AS practice_level_2
  ,practice_1.name AS practice_level_1

    ,CASE
        WHEN product_family IS NULL THEN 'Product'
        WHEN product_family = 'Managed Services' THEN 'Services'
        WHEN product_specialty_team = 'AHD Services;Services Other' THEN 'Services'
        WHEN product_specialty_team = 'AHD Services;Data Center Services' THEN 'Services'
        WHEN product_specialty_team = 'AHD Services;Network Services' THEN 'Services'
        WHEN product_specialty_team = 'AHD Services;ESM Services' THEN 'Services'
        WHEN product_specialty_team = 'AHD Services;Digital Solutions Services' THEN 'Services'
        WHEN product_specialty_team = 'AHD Services;Security Services' THEN 'Services'
        WHEN product_specialty_team = 'AHD Services;Next Gen Data Center Services' THEN 'Services'
        ELSE 'Product' 
    END AS product_or_services
    
FROM product
INNER JOIN pse_practice_c practice_1
    ON product.practice_c = practice_1.id
INNER JOIN pse_practice_c practice_2
    ON practice_1.pse_parent_practice_c = practice_2.id
INNER JOIN pse_practice_c practice_3
    ON practice_2.pse_parent_practice_c = practice_3.id
INNER JOIN pse_practice_c practice_4
    ON practice_3.pse_parent_practice_c = practice_4.id
