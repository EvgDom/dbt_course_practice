
{# Вызов макроса #}
{{ safe_select( database_name='dwh_flight', 
                schema_name='intermediate', 
                identifier_name='src_flights__flights'
                ) }}