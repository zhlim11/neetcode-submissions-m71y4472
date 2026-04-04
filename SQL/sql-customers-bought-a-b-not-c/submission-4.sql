-- Write your query below
with joined AS (
SELECT c.customer_id, c.customer_name, o.product_name
from customers c
left join orders o
on c.customer_id = o.customer_id),

agg AS (
SELECT customer_id, customer_name, string_agg(product_name, ', ') AS product_list
FROM joined
GROUP BY customer_id, customer_name)

SELECT customer_id, customer_name
FROM agg
WHERE (product_list LIKE '%A%B%' OR product_list LIKE '%B%A%') AND product_list NOT LIKE '%C%'
ORDER BY customer_name;
