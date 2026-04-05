-- Write your query below
select 
    coalesce(a.sale_date, o.sale_date) as sale_date, 
    (a.a_sold_num - o.o_sold_num) AS diff
    from (select sale_date, sold_num as a_sold_num from sales where fruit = 'apples') a 
full outer join 
    (select sale_date, sold_num as o_sold_num from sales where fruit = 'oranges') o
on a.sale_date = o.sale_date
order by sale_date
