select e.employee_id, 
    e.name, count(f.employee_id) as reports_count, 
    round(avg(f.age)) as average_age
from Employees e 
left join Employees f on e.employee_id = f.reports_to
where 
e.employee_id in (
    select distinct reports_to from Employees where reports_to is not null 
)
group by e.employee_id, e.name
order by e.employee_id;