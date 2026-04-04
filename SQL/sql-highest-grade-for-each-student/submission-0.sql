-- Write your query below
WITH p1 AS(
SELECT *,
RANK () OVER (PARTITION BY student_id ORDER BY score DESC, exam_id) AS rank
FROM exam_results)

SELECT student_id, exam_id, score
FROM p1
WHERE rank = 1
ORDER BY student_id;