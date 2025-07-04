#For each employee, show their sales along with the average sales in their department (same month).
select e.emp_id, e.emp_name, e.department, e.sale_month, e.sales_amount, dept_avg.avg_sales
from employeesales e
join(
    select department, sale_month, avg(sales_amount) as avg_sales
    from employeesales
    group by department, sale_month
)dept_avg
on e.department = dept_avg.department
and e.sale_month = dept_avg.sale_month;

#List employees who sold more than their department’s average (same month).
select e.emp_id, e.emp_name, e.department,e. sale_month, e.sales_amount, dept_avg.avg_sales
from employeesales e
join(
    select department, sale_month, avg(sales_amount) as avg_sales
    from employeesales
    group by department, sale_month
)dept_avg
on e.department  =  dept_avg.department
and e.sale_month =  dept_avg.sale_month
where e.sales_amount > dept_avg.avg_sales;

# Show each department’s top seller(s) for January 2024.
select e.emp_id, e.emp_name, e.department, e.sales_amount
from employeesales e
join(
    select department, max(sales_amount) as max_sales
    from employeesales
    group by department
) top_sellers
on e.department = top_sellers.department
and e.sales_amount = top_sellers.max_sales
where e.sale_month = '2024-01';

# Compare each employee’s sales to their own previous month’s sales.
select e1.emp_id, e1.emp_name, e1.sale_month, e1.sales_amount as current_sales, e2.sales_amount as previous_sales
from employeesales e1
join employeesales e2
on e1.emp_id = e2.emp_id
and e1.sale_month = '2024-02'
and e2.sale_month = '2024-01'

#  Show employees who are not the top seller in their department for January.
select e.emp_id, e.emp_name, e.department, e.sales_amount
from employeesales e
left join(
    select department, max(sales_amount) as max_sales
from employeesales
where sale_month = '2024-01'
group by department
)top_sellers
on e.department = top_sellers.department
where e.sale_month = '2024-01'
and e.sales_amount < top_sellers.max_sales;
