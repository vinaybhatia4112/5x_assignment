with source as (
    select * from {{source('FIVETRAN_INTERVIEW_DB','COVID_19_INDONESIA_vinay_bhatia') }}
),

total_cases as (
    select 
 
    EXTRACT(YEAR FROM cast(date as datetime)) as year,
    location as location,
    sum(Total_Deaths_per_Million) as deaths_py_pm

from source 

group by year,location
order by deaths_py_pm desc

)

select * from total_cases