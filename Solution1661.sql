SELECT machine_id, ROUND(AVG(end_time - start_time), 3) AS processing_time
FROM 
  (
    SELECT machine_id, process_id,
      MIN(timestamp) AS start_time,
      MAX(timestamp) AS end_time
    FROM Activity
    GROUP BY machine_id, process_id
    ORDER BY machine_id, process_id
  ) 
GROUP BY machine_id
ORDER BY machine_id;