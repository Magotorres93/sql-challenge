--List the employee number, last name, first name, sex, and salary of each employee.


SELECT em.emp_no,em.last_name,em.first_name,em.sex, sa.salary 
FROM public."Employees" em left join public."Salaries" sa ON (em.emp_no=sa.emp_no);

--List the first name, last name, and hire date for the employees who were hired in 1986
SELECT em.first_name, em.last_name, em.hire_date
FROM public."Employees" em 
WHERE EXTRACT (Year from hire_date) = 1986;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dpts.dept_no department_number,dpts.dept_name,em.emp_no,em.last_name,em.first_name
FROM public."Employees" em inner join public."dept_manager" dem ON (em.emp_no=dem.emp_no)
inner join public."Departments" dpts ON (dpts.dept_no=dem.dept_no);

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT dpts.dept_no department_number,em.emp_no,em.last_name,em.first_name,dpts.dept_name
FROM public."Employees" em inner join public."Dept_emp" demp ON (em.emp_no=demp.emp_no)
inner join public."Departments" dpts ON (dpts.dept_no=demp.dept_no);

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT em.first_name, em.last_name, em.sex
FROM public."Employees" em 
WHERE em.first_name='Hercules' AND em.last_name like 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT em.emp_no,em.last_name,em.first_name
FROM public."Employees" em inner join public."Dept_emp" demp ON (em.emp_no=demp.emp_no)
inner join public."Departments" dpts ON (dpts.dept_no=demp.dept_no)
WHERE dpts.dept_name='Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT em.emp_no,em.last_name,em.first_name, dpts.dept_name
FROM public."Employees" em inner join public."Dept_emp" demp ON (em.emp_no=demp.emp_no)
inner join public."Departments" dpts ON (dpts.dept_no=demp.dept_no)
WHERE dpts.dept_name IN ('Sales','Development') ;

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT em.last_name, count(em.last_name)as frequency
FROM public."Employees" em  
group by em.last_name
order by count(em.last_name) desc;



