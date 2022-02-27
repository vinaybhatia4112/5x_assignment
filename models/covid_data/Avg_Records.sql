with source as (
    select * from {{source('FIVETRAN_INTERVIEW_DB','COVID_19_INDONESIA_vinay_bhatia') }}
),

avg_records as (
    select 
    location,
    avg(total_cases) as avg_cases,
    avg(total_recovered) as avg_recovered,
    avg(total_deaths) as avg_deaths
from source 
group by 1
order by 2,3,4 desc

)
select * from avg_Records