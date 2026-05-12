select
*
FROM
(
select e.department_id, 
       e.emp_id, 
       e.emp_name,
       sum(d.quantity*d.price) as TongDT 
      
   from dbo.employees e
inner join dbo.orders o ON e.emp_id=o.emp_id
inner join dbo.order_items d ON o.order_id=d.order_id
group by e.department_id, e.emp_id, e.emp_name
)emp

WHERE emp.TongDT>=2*(select avg(TongDT)
            from

           (select e.department_id, 
                 e.emp_id, 
                e.emp_name,
       sum(d.quantity*d.price) as TongDT   from  dbo.employees e1
inner join dbo.orders o1 ON e1.emp_id=o1.emp_id
inner join dbo.order_items d1 ON o1.order_id=d1.order_id
group by e1.department_id, e1.emp_id, e1.emp_name)K
group by K.department_id
 ) 
 
 
 ---- cách viêt CTE--
 
 -- Cách 1 -- Viết theo CTE
with CumeRank as
(
   select user_id, 
          sum(total_amount) as Tong,
          CUME_DIST() over(
          order by sum(total_amount) Desc
        ) as Cumedist_rank
   
   from dbo.orders 
   where status='completed'
   group by  user_id
)

Select * from CumeRank
where Cumedist_rank<=0.1;
   -- cách 2: viết theo subquery

select * from
(
select *,
          CUME_DIST() over(
          order by Tong Desc
        ) as Cumedist_rank
  from
  (
    select user_id, 
          sum(total_amount) as Tong
    from dbo.orders 
    where status='completed'
    group by  user_id
  )K
)cte
where cte.Cumedist_rank<=0.1

------Bài 2:  Chia user thành 4 nhóm:
   -- Nhóm	Ý nghĩa: 1	Super user, 2	Active, 3	Casual,4	Low
 select *,
  case
  WHEN ntile_grouprank=1 THEN 'Super user'
  when ntile_grouprank=2 THEN 'Active'
  when ntile_grouprank=3 THEN 'Casual'
  else 'Low' end as Rank_KH
 from
(
    select user_id, 
          sum(total_amount) as Tong,
          NTILE (4) OVER(
          ORDER BY sum(total_amount) DESC ) AS ntile_grouprank
    from dbo.orders 
    where status='completed'
    group by  user_id
)K        


---version 3---

SELECT 
    c.CustomerName,
    o.OrderDate,
    o.Amount
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID;