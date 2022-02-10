--select table_name from user_tables;
--select * from job_history;
--select * from employees;
set serveroutput on;
declare
    cursor emp_cur is
        select employee_id, first_name, hire_date, job_id, salary old_salary, 
        trunc(months_between(sysdate, hire_date)/12) experience
        from employees;
        n_inc_per number(2);    
    begin
    dbms_output.put_line('========================================================');
    dbms_output.put_line(rpad('Ename',15)|| rpad('Designation', 15)|| rpad('Old Salary', 15)|| rpad('New Salary', 10));
    dbms_output.put_line('========================================================');
    for emp_rec in emp_cur
    loop
        n_inc_per:=
        case
            when emp_rec.experience < 2 then 15
            when emp_rec.experience >=2 and emp_rec.experience < 4 then 25
            else 35
        end;        
        dbms_output.put_line(rpad(emp_rec.first_name,15)|| rpad(emp_rec.job_id, 15)|| rpad(emp_rec.old_salary, 15)|| rpad(emp_rec.old_salary*(1+n_inc_per/100), 10));
        update employees set salary=salary*(1+n_inc_per/100) where employee_id = emp_rec.employee_id;
    end loop;    
end;

        