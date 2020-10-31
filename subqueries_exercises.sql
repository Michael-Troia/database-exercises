# -- Find all the employees with the same hire date as employee 101010 using a subquery.
# --
use employees;

# -- 69 Rows
# --
select emp_no, CONCAT(first_name,' ',last_name) as name
from employees
    where hire_date = (select hire_date
                       from employees
                       where emp_no = 101010);


# -- Find all the titles held by all employees with the first name Aamod.
# --
# -- 314 total titles, 6 unique titles
# --
select title, COUNT(title)
from titles
where emp_no IN (
    select emp_no               # selects the employees named Aamod
    from employees
    where first_name = 'Aamod'
    )
group by title;



# -- Find all the current department managers that are female.
# --
# --
select emp_no, concat(first_name,' ',last_name) as name, gender
from employees
where emp_no in (select emp_no
from dept_manager
where to_date = '9999-01-01')
and gender = 'F';
# -- +------------+------------+
# -- | first_name | last_name  |
# -- +------------+------------+
# -- | Isamu      | Legleitner |
# -- | Karsten    | Sigstam    |
# -- | Leon       | DasSarma   |
# -- | Hilary     | Kambil     |
# -- +------------+------------+