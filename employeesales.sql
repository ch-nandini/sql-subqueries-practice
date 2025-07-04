insert into employee_sales.employeesales (emp_id, emp_name, department, sale_month, sales_amount)
values  (1, 'Alice', 'Electronics', '2024-01', 5000),
        (2, 'Bob', 'Electronics', '2024-01', 6000),
        (3, 'Charlie', 'Electronics', '2024-01', 6000),
        (4, 'David', 'Clothing', '2024-01', 4500),
        (5, 'Eva', 'Clothing', '2024-01', 4000),
        (6, 'Frank', 'Clothing', '2024-01', 4500),
        (7, 'Grace', 'Electronics', '2024-02', 7000),
        (8, 'Heidi', 'Clothing', '2024-02', 5000),
        (9, 'Ivan', 'Clothing', '2024-02', 5200),
        (10, 'Judy', 'Electronics', '2024-02', 6800);

SELECT *
FROM employeesales;

# Find employees who made the highest sales in January 2024.
SELECT emp_id, emp_name, sales_amount
from employeesales
where sale_month = '2024-01'
and sales_amount = (
    Select max(sales_amount)
    from employeesales
    where sale_month = '2024-01'
);

#List employees whose sales are above the average sales for January 2024.
select emp_id, emp_name, sales_amount
from employeesales
where sale_month = '2024-01'
and sales_amount >(
    select avg(sales_amount)
    from employeesales
    where sale_month = '2024-01'
);

# Show employees who sold less than the top seller of February.
select emp_id, emp_name, sales_amount
from employeesales
where sale_month ='2024-02'
and sales_amount <(
    select max(sales_amount)
    from employeesales
    where sale_month = '2024-02'
);

# Find employees in January who had sales equal to or higher than the February average.
select emp_id, emp_name, sales_amount
from employeesales
where sale_month = '2024-01'
and sales_amount >=(
    select avg(sales_amount)
    from employeesales
    where sale_month = '2024-02'
);

# Show departments where the highest sale in February was greater than 6500.
SELECT department
from employeesales
where sale_month = '2024-02'
group by department
having max(sales_amount) > 6500;

# Show employees from departments where the max sale in February exceeded 6500
select emp_id, emp_name, sales_amount, department
from employeesales
where sale_month = '2024-02'
and department in(
    select department
    from employeesales
    where sale_month = '2024-02'
    group by department
    having max(sales_amount)> 6500
);

# Find employees whose sales are higher than at least one person in a different department.
select emp_id, emp_name, department, sales_amount
from employeesales e1
where exists(
    select 1
    from employeesales e2
    where e1.department<>e2.department
    and e1.sales_amount>e2.sales_amount
);
