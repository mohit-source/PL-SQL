set serveroutput on;

declare
    cursor emp_cur is select * from job_history where rownum < 5 order by employee_id;    
    cursor emp_details(emp_id number) is select first_name from employees where employee_id=emp_id;
    emp employees.first_name%type;
    begin
    dbms_output.put_line('Top 5 employees with Job History: ');
    for emp_rec in emp_cur loop
        open emp_details(emp_rec.employee_id);
        fetch emp_details into emp;
        close emp_details;
        dbms_output.put_line(emp_rec.employee_id||' ' ||emp);
    end loop;
end;