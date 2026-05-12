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