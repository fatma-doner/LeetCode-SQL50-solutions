select id, ISNULL( 
    CASE WHEN id %2 =1 then lead(student,1) over(order by id)
    ELSE LAG(student,1) OVER() END,
    student
) student 
from Seat;


-- second solution without using lead or lag

SELECT id,
    CASE 
        WHEN id % 2 = 1 THEN 
            (SELECT student FROM Seat WHERE id = s.id + 1)
        ELSE 
            (SELECT student FROM Seat WHERE id = s.id - 1)
    END AS student
FROM Seat s
WHERE id % 2 = 1 OR id % 2 = 0;
