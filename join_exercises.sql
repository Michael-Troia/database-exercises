use employees;

#write a query that shows current manage for each dept

select d.dept_name as 'Department Name', #dept_name comes from departments table
       concat(e.first_name, ' ', e.last_name) as 'Department Manager' # heading from employee table
   from employees as e
    join dept_manager as dm on e.emp_no = dm.emp_no
    join departments as d on dm.dept_no = d.dept_no
where dm.to_date = '9999-01-01'; #if todate is 9999, then their role doesn't end, they are the current manager
select * from dept_manager
limit 10;
#
# Find the name of all departments currently managed by women.
#
select d.dept_name as 'Department Name', #dept_name comes from departments table
       concat(e.first_name, ' ', e.last_name) as 'Department Manager' # heading from employee table
from employees as e
         join dept_manager as dm on e.emp_no = dm.emp_no
         join departments as d on dm.dept_no = d.dept_no
where dm.to_date = '9999-01-01'
and e.gender = 'f'; #further narrows results by gender f

# Department Name | Manager Name
# ----------------+-----------------
# Development     | Leon DasSarma
# Finance         | Isamu Legleitner
# Human Resources | Karsetn Sigstam
# Research        | Hilary Kambil
# Find the current titles of employees currently working in the Customer Service department.
#
select * from departments where dept_name = 'Customer Service'; #shows the dept_no of customer service

select t.title as Title, COUNT(t.emp_no) as Count
from titles as t
join dept_emp as de on t.emp_no = de.emp_no
join departments as d on de.dept_no = d.dept_no
where de.dept_no = 'd009' # or where d.dept_name = 'Customer Service'
and t.to_date = '9999-01-01'
and de.to_date = '9999-01-01'
group by t.title;

#
# Title              | Count
# -------------------+------
# Assistant Engineer |    68
# Engineer           |   627
# Manager            |     1
# Senior Engineer    |  1790
# Senior Staff       | 11268
# Staff              |  3574
# Technique Leader   |   241
# Find the current salary of all current managers.
#
select d.dept_name as 'Department Name',
       concat(e.first_name, ' ', e.last_name) as 'Department Manager',
       s.salary as Salary
from employees as e
         join dept_manager as dm on e.emp_no = dm.emp_no
         join departments as d on dm.dept_no = d.dept_no
         join salaries as s on e.emp_no = s.emp_no #connects the salaries emp_no with the employees emp_no

where dm.to_date = '9999-01-01' #if todate is 9999, then their role doesn't end, they are the current manager
and s.to_date = '9999-01-01'
order by dept_name;


#
# Department Name    | Name              | Salary
# -------------------+-------------------+-------
# Customer Service   | Yuchang Weedman   |  58745
# Development        | Leon DasSarma     |  74510
# Finance            | Isamu Legleitner  |  83457
# Human Resources    | Karsten Sigstam   |  65400
# Marketing          | Vishwani Minakawa | 106491
# Production         | Oscar Ghazalie    |  56654
# Quality Management | Dung Pesch        |  72876
# Research           | Hilary Kambil     |  79393
# Sales              | Hauke Zhang       | 101987
