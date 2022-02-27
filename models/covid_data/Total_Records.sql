with source as (
    select * from {{source('FIVETRAN_INTERVIEW_DB','COVID_19_INDONESIA_vinay_bhatia') }}
),

total_records as (
    select 
 
    EXTRACT(YEAR FROM cast(date as datetime)) as year,
    location,
    sum(total_cases) as total_cases,
    sum(total_recovered) as total_recovered,
    sum(total_deaths) as total_deaths
from source 
group by 1,2
order by 3,4,5 desc

)
select * from total_Records