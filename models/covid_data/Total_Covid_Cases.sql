with source as (
    select * from {{source('FIVETRAN_INTERVIEW_DB','COVID_19_INDONESIA_vinay_bhatia') }}
),

total_cases as (
    select 
 
    Location as location,
    sum(total_cases) as total_cases

from source 

group by location
order by total_cases desc

)

select * from total_cases