with source as (
    select * from {{source('FIVETRAN_INTERVIEW_DB','COVID_19_INDONESIA_vinay_bhatia') }}
),

fatality_rate as (
    select 
 
    EXTRACT(YEAR FROM cast(date as datetime)) as year,
    location,
    population_density,
    sum(case_fatality_rate) as fatality_rate,
    sum(case_recovered_rate) as case_recovered_rate
from source 
group by 1,2,3
order by 4 desc

)
select * from fatality_rate