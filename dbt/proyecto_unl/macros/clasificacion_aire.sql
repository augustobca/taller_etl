{% macro clasificar_ica(valor_ica) %}
    CASE 
        WHEN {{ valor_ica }} <= 50 THEN 'Bueno'
        WHEN {{ valor_ica }} > 50 AND {{ valor_ica }} <= 100 THEN 'Moderado'
        ELSE 'Dañino'
    END
{% endmacro %}