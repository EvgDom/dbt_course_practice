{# Генерация yml файла с конфигурированием модели #}
{# {% if compile %} #}
{{ codegen.generate_model_yaml(
    model_names=['fct_bookings', 'fct_flights']
) }}
{# {% endif %} #}