set serveroutput on;

declare
    cursor dep_cur is
            select department_id, department_name from departments
            where department_id <= 40;
    begin
    dbms_output.put_line('Departments with id less than equal to 40: ');
        for dep_rec in dep_cur loop
            dbms_output.put_line(dep_rec.department_id||' '||dep_rec.department_name);
            if dep_rec.department_id = 40 then
                dbms_output.put_line('Employee details working under HR department: ');
                dbms_output.put_line(rpad('Name',15)|| rpad('Job', 15)|| rpad('Salary', 15));
                for emp_rec in (select * from employees where department_id = dep_rec.department_id) 
                loop
                    dbms_output.put_line(rpad(emp_rec.first_name,15)|| rpad(emp_rec.job_id, 15)|| rpad(emp_rec.salary, 15));
                end loop;
            end if;
        end loop;
end;