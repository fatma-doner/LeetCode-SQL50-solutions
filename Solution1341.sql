select results 
from ( 
    select u.name as results,
    rank() over (order by count(*) desc, u.name asc) as rnk
    from MovieRating mr
    left join Users u on mr.user_id = u.user_id
    group by u.name
)
where rnk = 1
UNION ALL 
select results 
from ( 
    select m.title as results,
    rank() over (order by avg(mr.rating) desc, m.title asc) as rnk
    from MovieRating mr
    left join Movies m on mr.movie_id = m.movie_id 
    WHERE created_at >= '2020-02-01' AND created_at <= '2020-02-28'
    group by m.title
)
where rnk = 1;