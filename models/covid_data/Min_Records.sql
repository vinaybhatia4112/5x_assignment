with source as (
    select * from {{source('FIVETRAN_INTERVIEW_DB','COVID_19_INDONESIA_vinay_bhatia') }}
),

min_records as (
    select 
    location,
    min(total_cases) as min_cases,
    min(total_recovered) as min_recovered,
    min(total_deaths) as min_deaths
from source 
group by 1
order by 2,3,4 desc

)
select * from min_Records