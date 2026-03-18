{{ config(
    materialized='table'
) }}

WITH clima AS (
    SELECT * FROM {{ ref('stg_clima') }}
),
aire AS (
    SELECT * FROM {{ ref('stg_calidad_aire') }}
)

SELECT
    c.nombre_ciudad,
    c.temperatura,
    c.humedad,
    a.indice_ica,
    a.particulas_pm25,
    {{ clasificar_ica('a.indice_ica') }} AS categoria_calidad_aire,
    NOW() AS fecha_registro
FROM clima c
INNER JOIN aire a ON c.nombre_ciudad = a.nombre_ciudad