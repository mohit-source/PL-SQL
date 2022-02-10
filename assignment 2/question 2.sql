set serveroutput on;

declare
    n_limit number := &n;
    c number := 0;
    cursor top_earners(n number) is
        select distinct salary from employees
        where rownum <= n
        order by salary desc;
    begin
    dbms_output.put_line('Salaries of Top '|| n_limit||' Salaried employees:');
        for emp_rec in top_earners(n_limit) loop
            dbms_output.put_line(emp_rec.salary||' INR');
        end loop;
end;
        