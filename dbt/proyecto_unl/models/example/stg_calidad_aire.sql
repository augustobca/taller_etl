WITH source_data AS (
    -- El primer parámetro es el 'name' del source en el YAML
    -- El segundo es el 'name' de la tabla (nombre del archivo seed sin .csv)
    SELECT * FROM {{ source('fuentes_unl', 'calidad_aire') }}
),

renamed AS (
    SELECT
        ciudad_id AS nombre_ciudad, -- Renombrado para coincidir con clima
        indice_ica,
        particulas_pm25,
        -- Llamada a la macro para clasificar el aire
        {{ clasificar_ica('indice_ica') }} AS categoria_aire,
        NOW() AS fecha_carga
    FROM source_data
)

SELECT * FROM renamed