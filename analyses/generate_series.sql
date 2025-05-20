{# Генерация  последовательности дат с помощью dbt_utils.date_spine #}
 {# 
{{ dbt_utils.date_spine(
    datepart="day",
    start_date="cast('2019-01-01' as date)",
    end_date="cast('2020-01-01' as date)"
   )
}}
  #}
{# Генерация последжовательности чисел с помощью dbt_utils.generate_series #}

{# {{ dbt_utils.generate_series(upper_bound=50) }} #}

{# Получение текущего времени и даты с помощью dbt_utils.pretty_time() #}

{# {{ dbt_utils.pretty_time() }} #}
{# {{ dbt_utils.pretty_time(format='%Y-%m-%d %H:%M:%S') }} #}

{# Вывод в логи отформатированного сообщения с помощью dbt_utils.log_info #}

{# {{ dbt_utils.log_info("my pretty message") }} #}