{{
  config(
    materialized = 'table',
    pre_hook = '
      {% set this_rel = load_relation(this) %}

      {% if this_rel is not none %}

        {% set start_dttm = run_started_at.strftime("%Y_%m_%d_%H%M%S") %}
        {% set  backup_relation = api.Relation.create(
                  database = this.database,
                  schema = this.schema,
                  identifier = this.identifier~"_"~start_dttm,
                  type = "table"
                )
        %}

        {{ print("Table bckp is "~this.identifier~"_"~start_dttm) }}

        {% do adapter.rename_relation(this, backup_relation) %}
      {% else %} 
        {{ print("This was the first Building of Model without bckp table!") }}
      {% endif %}
      '
    )
}}
select
    aircraft_code,
    model,
    "range"
from 
    {{ source('demo_src', 'aircrafts') }}