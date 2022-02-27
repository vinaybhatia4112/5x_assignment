with source as (
    select * from {{source('FIVETRAN_INTERVIEW_DB','COVID_19_INDONESIA_vinay_bhatia') }}
),

max_records as (
    select 
    location,
    max(total_cases) as max_cases,
    max(total_recovered) as max_recovered,
    max(total_deaths) as max_deaths
from source 
group by 1
order by 2,3,4 desc

)
select * from max_Records