-- Challenge Start

--Deliverable 1
SELECT e.emp_no, e.first_name, e.last_name, ti.title, ti.from_date, ti.to_date
INTO title_retiring
FROM employees as e
join titles as ti on (ti.emp_no = e.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by e.emp_no
;

select * from title_retiring;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title, from_date, to_date
INTO unique_titles
FROM title_retiring
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

select * from unique_titles;

select count (title), title
into retiring_titles
from unique_titles
group by title
order by count(title) desc;

--Deliverable 2
select distinct on (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date,
de.from_date, de.to_date, ti.title
into mentorship_eligibility
from dept_emp as de
join employees as e on (de.emp_no = e.emp_no)
join titles as ti on (e.emp_no = ti.emp_no)
where (de.to_date = '9999-01-01') and (e.birth_date between '1965-01-01' and '1965-12-31')
order by e.emp_no;

select * from mentorship_eligibility;
