-- Write your query below
SELECT e.*,
CASE 
    WHEN operator = '<' AND v1.value < v2.value THEN 'true'
    WHEN operator = '>' AND v1.value > v2.value THEN 'true'
    WHEN operator = '=' AND v1.value = v2.value THEN 'true'
    ELSE 'false'
END AS value
FROM expressions e
LEFT JOIN variables v1
ON e.left_operand = v1.name 
LEFT JOIN variables v2
ON e.right_operand = v2.name
