
with source as (

    select * from {{ source('demo_src', 'aircrafts') }}

),

renamed as (

    select
        aircraft_code,
        model,
        range--,
        -- 1 as ss
    from source

)

select * from renamed

