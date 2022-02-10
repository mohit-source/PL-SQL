set serveroutput on;
declare
    n_emp_id number:= &emp_id;
    v_first_name employees.first_name%type;
    n_salary employees.salary%type;
    v_grade varchar(1);
    begin
        select first_name, salary into v_first_name, n_salary
        from employees where employee_id = n_emp_id;
        v_grade:=   case
                        when n_salary>25000 then 'A'
                        when n_salary>15000 then 'B'
                        else 'C'
                    end;
        dbms_output.put_line(rpad('Emp name',10)|| rpad('Salary', 10)|| rpad('Grade', 10));
        dbms_output.put_line(rpad(v_first_name,10)|| rpad(n_salary, 10)|| rpad(v_grade, 10));
    
end;