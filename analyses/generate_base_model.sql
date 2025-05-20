{{ codegen.generate_base_model(
    source_name='demo_src',
    table_name='aircrafts',
    materialized='table'
) }}


{# Сохранение сгенерированного кода модели в файл! - запускать в терминале Git Bash #}
{# dbt run-operation codegen.generate_base_model --args "{source_name: 'demo_src', table_name: 'aircrafts', materialized: 'table'}" | grep -v '\[' > models/staging/flights/stg_flights__aircrafts_generated.sql #}


{# Генерация кода модели и сохранение в файл #}
{# dbt run-operation codegen.create_base_models --args '{source_name: "demo_src", tables: ["airports","aircrafts"]}' #}