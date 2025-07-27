select id, ISNULL( 
    CASE WHEN id %2 =1 then lead(student,1) over(order by id)
    ELSE LAG(student,1) OVER() END,
    student
) student 
from Seat;
