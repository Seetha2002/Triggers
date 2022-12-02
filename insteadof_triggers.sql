CREATE TABLE BONUS
        (ENAME VARCHAR2(10),
         JOB   VARCHAR2(9),
         SAL   NUMBER,
         COMM  NUMBER);
select * from emp;
insert into BONUS values('ALLEN','SALESMAN',1600,300);
insert into BONUS values('WARD','SALESMAN',1250,500);
insert into BONUS values('MARTIN','SALESMAN',1250,1400);
insert into BONUS values('TURNER','SALESMAN',1500,0);
insert into BONUS values('Seetha','MANAGER',6000,0);
create or replace view emp_bonus_join as 
select e.empno,e.deptno,b.ename,b.job,b.sal from emp e, bonus b where e.ename=b.ename;
create or replace trigger tri_emp_bonus 
instead of insert on emp_bonus_join
declare
my_empno emp.empno%type;
begin
begin
select empno into my_empno from emp where empno=:new.empno;
exception
when NO_DATA_FOUND then
insert into emp(empno,ename) values(:new.empno,:new.ename) returning empno into my_empno;
end;
insert into bonus values('Sri','Accountant',1220,300);
end tri_emp_bonus;

select * from emp_bonus_join;
select * from bonus;
insert into emp_bonus_join(empno,ename) values(1234,'SEETHA');
desc emp_bonus_join;
desc bonus;
alter table bonus modify job varchar2(20); 
select * from emp_bonus_join;
select * from emp;
select * from bonus;
insert into emp_bonus_join values(1111,20,'LUCKY','MANAGER',2000);
desc emp_bonus_join;
