-- q1 在emp表中查询出所有记录的姓名、部门编号、薪水，并且列名要显示为中文。
select ename as '姓名', deptno as '部门编号',sal as '薪水' from emp;

-- q2 在emp表中查询出薪水大于1500的记录，并且按照薪水的降序排列。
select * from emp 
where sal > 1500
order by sal desc;

-- q3 在emp表中查询出comm字段为空值的记录。
select * from emp
where comm is null;

-- q4 在emp表中查询出部门编号为10或20的记录（请分别使用OR和IN关键字）
select * from emp
where deptno= 10 or deptno=20;

select * from emp
where deptno in(10,20);

-- q5 在emp表中查询出姓名的第二个字母为A的记录。
select * from emp
where ename like '_A%';

-- q6 找出佣金高于薪金的所有员工。
select * from emp
where comm > sal;

-- q7 显示所有员工的姓名，工作和薪金，按工作降序排序，若工作相同则按薪金排序。
select ename,job,sal from emp
order by job desc, sal desc;

-- q8 查询显示：员工编号，员工名称，员工所在部门编号，员工所在部门名称。
select empno, ename,emp.deptno from emp inner join dept on emp.deptno = dept.deptno;

-- q9 查询显示：员工编号，员工名称，经理编号，经理名称。
select e1.empno as "员工编号", e1.ename as "员工名称", e2.mgr as "经理编号", e2.ename as "经理名称" from emp e1, emp e2 where e1.mgr = e2.empno;

-- q10 查询emp表中出部门人数大于等于2的部门的部门代码、部门人数。
select deptno as "部门代码", count(*) as "部门人数" from emp 
group by deptno
having count(8)>=2;

-- q11 查询emp表中出部门平均薪水小于等于20000的部门的部门代码、平均薪水，并按平均薪水从大到小排序。
select deptno as "部门代码", mgr as "经理编号", avg(sal) as "平均薪水" from emp
group by deptno
having avg(sal)<=20000
order by avg(sal) desc;

-- q12 查询emp表中薪水最少，和薪水最大员工的姓名和薪水，并按薪水从大到小排序。
select ename, sal from emp
where sal in 
(select max(sal) from emp
union 
select min(sal) from emp)
order by sal desc;

-- q13 列出薪金高于公司平均薪金的所有员工，所在部门，上级领导，公司的等级工资。
select empno, ename, deptno, mgr,
case 
	when sal between 700 and 1200 then "1"
    when sal between 1201 and 1400 then "2"
    when sal between 1401 and 2000 then "3"
    when sal between 2001 and 3000 then "4"
    when sal between 3001 and 9999 then "5"
end as "等级工资"
from emp 
where sal > (select avg(sal) from emp);

-- q14 列出所有部门的详细信息和部门人数。
select e.deptno, d.dname, d.loc,count(*) as "部门人数" from emp e join dept d on e.deptno = d.deptno
group by e.deptno;

