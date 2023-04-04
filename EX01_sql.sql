-- 학생 테이블 생성
create table student(
	id bigint,
    student_name varchar(5),
    student_mobile varchar(20),
    student_major varchar(30)
);
-- 학생테이블 전체 데이터조회
select * from student;
-- 본인 옆사람들의 정보를 테이블에 저장해 봅시다.
insert into student(id, student_name, student_mobile, student_major)
values(1, '이호섭', '010-6554-0220', '중고차수출');
insert into student(id, student_name, student_mobile, student_major)
values(2, '이신욱', '010-2323-5552', '항공정비');

-- 테이블 삭제
drop table student;

-- 예제

create table dept (
    deptno int,
    dname varchar(14),
    loc varchar(13)
);

create table emp (
    empno int,
    ename varchar(10),
    job varchar(9),
    mgr int,
    hiredate DATE,
    sal int,
    comm int,
    deptno int
);

create table bonus (
    ename varchar(10),
    job varchar(9),
    sal int,
    comm int
);


create table salgrade (
    grade int,
    losal int,
    hisal int
);
    
insert into dept values	(10,'ACCOUNTING','NEW YORK');
insert into dept values (20,'RESEARCH','DALLAS');
insert into dept values (30,'SALES','CHICAGO');
insert into dept values	(40,'OPERATIONS','BOSTON');    

insert into emp values (7369,'SMITH','CLERK',7902, str_to_date('17-12-1980','%d-%m-%Y'),800,NULL,20);
insert into emp values (7499,'ALLEN','SALESMAN',7698,str_to_date('20-2-1981','%d-%m-%Y'),1600,300,30);
insert into emp values (7521,'WARD','SALESMAN',7698,str_to_date('22-2-1981','%d-%m-%Y'),1250,500,30);
insert into emp values (7566,'JONES','MANAGER',7839,str_to_date('2-4-1981','%d-%m-%Y'),2975,NULL,20);
insert into emp values (7654,'MARTIN','SALESMAN',7698,str_to_date('28-9-1981','%d-%m-%Y'),1250,1400,30);
insert into emp values (7698,'BLAKE','MANAGER',7839,str_to_date('1-5-1981','%d-%m-%Y'),2850,NULL,30);
insert into emp values (7782,'CLARK','MANAGER',7839,str_to_date('9-6-1981','%d-%m-%Y'),2450,NULL,10);
insert into emp values (7788,'SCOTT','ANALYST',7566,str_to_date('13-7-87','%d-%m-%Y'),3000,NULL,20);
insert into emp values (7839,'KING','PRESIDENT',NULL,str_to_date('17-11-1981','%d-%m-%Y'),5000,NULL,10);
insert into emp values (7844,'TURNER','SALESMAN',7698,str_to_date('8-9-1981','%d-%m-%Y'),1500,0,30);
insert into emp values (7876,'ADAMS','CLERK',7788,str_to_date('13-7-87','%d-%m-%Y'),1100,NULL,20);
insert into emp values (7900,'JAMES','CLERK',7698,str_to_date('3-12-1981','%d-%m-%Y'),950,NULL,30);
insert into emp values (7902,'FORD','ANALYST',7566,str_to_date('3-12-1981','%d-%m-%Y'),3000,NULL,20);
insert into emp values (7934,'MILLER','CLERK',7782,str_to_date('23-1-1982','%d-%m-%Y'),1300,NULL,10);
		 
insert into salgrade values (1,700,1200);
insert into salgrade values (2,1201,1400);
insert into salgrade values (3,1401,2000);
insert into salgrade values (4,2001,3000);
insert into salgrade values (5,3001,9999);

select * from emp; 
select * from bonus; -- 조회결과 없음
select * from salgrade;
select * from dept;
 
 -- emp 테이블 전체 조회
 select * from emp;
 -- emp 테이블의 empno, ename 컬럼만 조회
 select empno,ename from emp;
 -- emp 테이블의 jop 컬럼만 조회
 select job from emp;
 -- 중복값 제외
 select distinct job from emp;
 -- 사원 이름 조회(오름차순)
 select ename from emp order by ename asc;
 select * from emp order by ename asc;
 -- 사원 이름 조회(내림차순)
 select ename from emp order by ename desc;
 select * from emp order by ename desc;
 
-- 급여(sal) 기즌으로 오름차순,내림차순 정렬
select * from emp order by sal asc;
select * from emp order by sal desc;
-- 입사일(hiredata) 기준으로 오름차순 , 내림차순 정렬
select * from emp order by hiredate asc;
select * from emp order by hiredate desc;
-- 1차기준: 급여 ㅡ 급여가 같다면 이름순으로 오름차순 정렬
select * from emp order by sal asc, ename asc;

-- where 절:조건을 적용할 때
-- 직급이 salesman 인 사원만 조회
select * from emp where job = 'salesman';
-- 직급이 manager인 사원만 조회
select * from emp where job = 'manager';
-- 부서번호(deptno)가 10인 사원만 조회
select * from emp where deptno=10;
-- 이름이 james 라는 사원의 정보 조회
select * from emp where ename = 'james';
-- 사번이 7654인 사원의 정보 조회
select * from emp where empno = 7654;
-- 직급이 manager 이고 부서번호가 20인 사원 조회
select * from emp where job = 'manager' and deptno = 20;
-- &(엠퍼샌드), * (아스테리스크), '(싱글쿼터)' , "(더블쿼터) , `(백틱)
-- 직급이 salesman 이거나 부서번호가 10인 사원 조회
select * from emp where job = 'salesman' or deptno = 10;
-- 급여가 3000 이상인 사원 조회
select * from emp where sal >= 3000;
-- 급여가 3000 이상인 사원 조회 결과를 내림차순 정렬
select * from emp where sal >= 3000 order by sal desc;
-- 직급이 salesman이 아닌 사원 조회
select * from emp where job != 'salesman';
select * from emp where not job = 'salesman';
-- 급여가 2000 이상 3000 이하인 사원조회
select * from emp where 2000 <= sal <= 3000; -- x
select * from emp where sal >= 2000 and sal <= 3000; -- O
-- 2000에서 3000사이가 아닌 값
select * from emp where sal not between 2000 and 3000;  

-- like 연산자 (검색기능)
-- _(언더바) 글자 개수지정 , %글자수에 대한 제한이 없다
select * from emp where ename like 'm%';
select * from emp where ename like '%m';
select * from emp where ename like '%m%';
select * from emp where ename like '_m%';
select * from emp where ename like '__m%';

-- 81년 4월 1일 이후 입사한 사원 조회
select * from emp where hiredate > '1981-04-01';
-- 정확한 사용법
select * from emp where hiredate > str_to_date('1981-04-01','%Y-%m-%d');
-- 81년 4월 1일 이전 입사한 사원 조회
select * from emp where hiredate < '1981-04-01';

-- 테이블 구조 확인
desc emp;

-- 집계함수
-- sum(), avg() , max(), min(), count()
-- 사원의 급여 총합
select sum(sal) from emp;
select sum(sal) as '급여총합' from emp;
-- salesman 급여 총합
select sum(sal) from emp where job = 'salesman';
-- manager 급여 총합
select sum(sal) from emp where job = 'manager';
-- 전체 사원의 평균 급여 조회
select avg(sal) from emp;
-- 구글링으로 평균급여를 소수 둘째자리까지  표현해봅시다
select sysdate() from dual;
select round(avg(sal), 2) from emp;
-- round 함수 사용
select round(12.345, 2) from dual; -- 12.35
select round(12.345, 1) from dual; -- 12.3
select round(12.345, 0) from dual; -- 12
-- 가장 높은 급여 값 조회
select max(sal) from emp;
-- 가장 낮은 급여 값 조회
select min(sal) from emp;

-- 전체 사원수 조회
select count(*) from emp;
-- 부서번호가  20인 사원 수 조회
select count(*) from emp where deptno = 20;

-- 그룹화(동일힌 데이터끼리 묶는 것, grouping)
-- 조회결과에는 그룹핑한 컬럼이름 또는 집계 함수 등을 사용함
-- 직급으로 그룹핑
select job from emp group by job;
-- 직급별 평균 급여
select job, avg(sal) from emp group by job;
-- 부서별 평균 급여
select deptno, avg(sal) from emp group by deptno;


-- 직급별 사원수 조회
select job,count(*) from emp group by job; 
-- 직급별 평균 급여, 사원수 조회
select job, avg(sal), count(*) from emp group by job;

-- 위의 결과에서 직급값을 오름차순을 정렬
select job,count(*) from emp group by job order by job asc;
select job, avg(sal), count(*) from emp group by job order by job asc;

-- 위의 결과에서 평군 급여를 소수점으로 첫째자리 까지 조회
select job, round(avg(sal), 1), count(*) from emp group by job order by job asc;

-- 위의 결과에서 job은 직급으로 , 급여 평균값은  평균급여로, 사원수 조회값은 사원수로 표현하여 조회
select job as '직급', round(avg(sal), 1)'평균급여', count(*)'사원수' 
	from emp group by job order by job asc;
    
-- 20230329

-- 부서별 그룹핑
select deptno from emp group by deptno;
select deptno,avg(sal) from emp group by deptno;
-- 부서별 그룹핑하고 그 안에서 직급별 그룹핑
select deptno, job, avg(sal) from emp group by deptno, job;
select deptno, job, avg(sal) from emp group by job, deptno;

select deptno, job, avg(sal) from emp group by deptno, job order by job;
select deptno, job, avg(sal) from emp group by deptno, job order by deptno;

-- having: 그룹핑한 결과에서 조건 적용
-- 부서, 직급별로 묶고 그 결과에서 평균 급여가 2000 이상인 결과만 조회
select deptno, job , avg(sal) from emp 
		group by deptno , job
			having avg(sal) >= 2000
				order by job asc;

-- 급여가 3000이하인 사원을 대상으로 위의 그룹핑 수행
select * from emp order by sal asc;
select deptno, job , avg(sal) from emp 
	where sal <= 3000
		group by deptno , job
			having avg(sal) >= 2000
				order by job asc;
                
-- date 타입을 문자로 표현하기: date_format()
select date_format(hiredate, '%Y')from emp;

/*
	연습문제
	1. 부서별 평균급여, 최고급여, 최저급여, 사원수 조회(평균급여는 소수점 둘째자리에서 반올림)
    2. 직급별 사원수 조회(단 3명 이상인 결과만 출력)
    3. 연도별 입사한 사원수 조회(조회결과 : 연도(yyyy), 사원수)
    3.1. 위의 결과에서 각 연도별로 부서별 입사한 사원수 조회(조회결과 : 연도(yyyy), 부서번호, 사원수)
*/
-- 1
select  deptno as '부서',  round(avg(sal), 2) as '평균급여' ,
	max(sal) as '최고급여' , min(sal) as '최저급여', count(*) as '사원수' from emp 
			group by deptno;
-- 2
select job , count(empno) from emp group by job having count(empno) >= 3;
-- 3
select date_format(hiredate, '%Y') as '입사년도' ,count(empno)as '사원수' from emp group by date_format(hiredate, '%Y');
-- 3-1
select date_format(hiredate, '%Y') as '입사년도',deptno as '부서번호' ,count(empno) as '사원수' 
from emp group by date_format(hiredate, '%Y'),deptno;
				
select * from emp;
select * from dept;
-- 외부조인
select * from emp , dept;
-- 조인
select * from emp, dept where emp.deptno = dept.deptno;
select * from emp e , dept d where e.deptno = d.deptno;
select empno, ename  , dname, loc 
	from emp e , dept d where e.deptno = d.deptno;
-- deptno select 하면 에러
select empno, ename,deptno,dname, loc 
	from emp e , dept d where e.deptno = d.deptno;
select e.empno, e.ename,e.deptno,d.dname, d.loc 
	from emp e , dept d where e.deptno = d.deptno;
select e.* from emp e, dept d where e.deptno = d.deptno;

-- emp, dept를 조인하여 empno, ename , deptno, dname , loc 조회
-- (단, 급여가 2500 이상인 사원만 조회하고 , 조회결과는 사원이름 기준으로 오름차순 정렬)
select e.empno, e.ename,e.deptno,d.dname, d.loc 
	from emp e , dept d   where e.deptno = d.deptno and e.sal >= 2500
		order by e.ename asc;

-- 최저급여를 받는 사람이 누구인지??
select * from emp order by sal asc;
-- 1. 최저급여 값이 얼마인지 조회
select min(sal) from emp;
-- 2. 최저급여 값을 받는 사람이(최저급여가 값과 sal 값이 일치하는) 누구인지 조회
select * from emp where sal = 800;
-- 서브쿼리 적용
select * from emp where sal =(select min(sal) from emp);

-- 최고 급여를 받는 사원 정보 조회
select * from emp where sal = (select max(sal) from emp);
-- allen 보다 높은 급여를 받는 사원 조회
select * from emp where sal  > (select sal from emp where ename = 'allen')
	order by sal asc;
-- allen 급여값
select sal from emp where ename= 'allen';
select count(deptno) from emp where sal > (select sal from emp where ename='allen') group by deptno;    
/*
	연습문제 
    1. clark 보다 늦게 입사한 사원 조회 
    2. 부서번호가 20인 사원 중에서 전체 사원 평균 급여보다 높은 급여를 받는 사원 조회 
    3. 2번 조회 결과에서 부서이름, 부서위치도 함께 조회 
*/
select * from emp where hiredate > (select hiredate from emp where ename = 'clark');
	
select * from emp where deptno = 20 and sal > (select avg(sal) from emp);

select * from emp e, dept d where e.deptno = 20 and e.deptno = d.deptno and sal > (select avg(sal) from emp);

create table member1(
	id bigint,
    member_email varchar(20),
    member_password varchar(10)
);
insert into member1(id,member_email, member_password) 
	values(1,'member1@email.com','1111');
-- 모든 컬럼에 데이터를 저장한다면 컬럼이름을 생략 가능 
insert into member1 values(2, 'member2@email.com', '2222');
insert into member1 values(3, 'member2@email.com'); -- X error 1136
-- 특정 컬럼에만 값을 넣고 싶은 경우
insert into member1(id,member_email) 
	values(4,'member1@email.com');
-- 테이블 만들 때 지정한 크기보다 큰 값을 저장할 때
insert into member1 values(4, 'member2@email.com','222222222222'); -- X error 1406 지정한 테이터 값보다 크다  
insert into member1(id,member_email, member_password) 
	values(5,null,'1111');
insert into member1(id,member_email, member_password) 
	values(null,null,'1111');
select * from member1;

-- id 컬럼에 not null 제약조건 적용
create table member2(
	id bigint not null,
    member_email varchar(20),
    member_password varchar(10)
);
desc member2;
insert into member2(id,member_email, member_password) 
	values(1,'member1@email.com','1111');
-- error 1048 (not null 로 적용 후 null을 넣었을 때)
insert into member2(id,member_email, member_password) 
	values(null,'member1@email.com','1111');
    
create table member3(
	id bigint not null unique,
    member_email varchar(20) not null ,
    member_password varchar(10) not null 
);
desc member3;
insert into member3(id,member_email, member_password) 
	values(1,'member1@email.com','1111');
-- error 1062 (id 중복된 정보, unique는 중복안됌)
insert into member3(id,member_email, member_password) 
	values(1,'member1@email.com','1111');

create table member4(
	id bigint not null unique,
    member_email varchar(20) not null  unique,
    member_password varchar(10) not null 
);
insert into member4(id,member_email, member_password) 
	values(1,'member1@email.com','1111');
-- error 1062
insert into member4(id,member_email, member_password) 
	values(2,'member1@email.com','2222');
    
create table member5(
	id bigint not null unique,
    member_email varchar(20) not null  unique,
    member_password varchar(10) not null,
    member_created_date datetime
);
insert into member5(id,member_email, member_password, member_created_date) 
	values(4,'member4@email.com','1111', sysdate());
select * from member5;
insert into member5(id,member_email, member_password) 
	values(2,'member2@email.com','2222');
    drop table member5;
create table member6(
	id bigint not null unique,
    member_email varchar(20) not null  unique,
    member_password varchar(10) not null,
    member_created_dete datetime default now()
);
insert into member6(id,member_email, member_password) 
	values(1,'member2@email.com','1111');
select * from member6;

create table member7(
	id bigint primary key,
    member_email varchar(20) not null  unique,
    member_password varchar(10) not null,
    member_created_dete datetime default now()
);
insert into member7(id,member_email, member_password) 
	values(1,'member2@email.com','1111');
insert into member7(id,member_email, member_password) 
	values(1,'member2@email.com','1111');

create table member8(
	id bigint ,
    member_email varchar(20) not null  unique,
    member_password varchar(10) not null,
    member_created_dete datetime default now(),
    constraint pk_member8 primary key(id)
);
-- 제약 조건 확인
select * from information_schema.table_constraints;
    
    
-- 20230330
-- 참조관계
-- 게시판과 댓글의 관계 
drop table if exists board1; -- 있으면지우고 없으면 말고 ^^
create table board1(
	id bigint, -- 글번호
    board_writer varchar(20) not null, -- 작성자
    board_contents varchar(500),-- 내용
    constraint pk_board1 primary key(id)
);
-- 댓글 테이블: 댓글은 존재하는 게시글에만 작성 가능하며,
-- 게시글의 글번호(id)를 참조하는 관계로 정의
drop table if exists comment1;
create table comment1 (
	id bigint, -- 댓글번호
    comment_writer varchar(20) not null, -- 댓글 작성자
	comment_contents varchar(200), -- 댓글내용
    board_id bigint, -- 어떤 게시글에 작성된 댓글인지 글번호 정보가 필요함
    -- 댓글 테이블(comment1)의 pk 지정
    constraint pk_comment1 primary key(id),
    -- 참조관계 지정을 위해 comment1 테이블의 board1_id 컬럼을
    -- board1 테이블의 id 컬럼을 참조하는 관계로 정의
    constraint fk_comment1 foreign key(board_id) references board1(id)
);

insert into board1(id,board_writer,board_contents)
	values(1, 'writer1', 'contents1');
insert into board1(id,board_writer,board_contents)
	values(2, 'writer2', 'contents2');
insert into board1(id,board_writer,board_contents)
	values(3, 'writer3', 'contents3');
insert into board1(id,board_writer,board_contents)
	values(4, 'writer4', 'contents4');
select * from board1;

-- 댓글 데이터 저장
-- 1번 게시글에 대한 댓글
insert into comment1(id, comment_writer, comment_contents, board_id)
	values(1, 'c writer1','c contents1', 1);
-- 1번 게시글에 대한 댓글
insert into comment1(id, comment_writer, comment_contents, board_id)
	values(2, 'c writer2','c contents2', 1);
-- 2번 게시글에 대한 댓글
insert into comment1(id, comment_writer, comment_contents, board_id)
	values(3, 'c writer3','c contents3', 2);
-- 5번 게시글에 대한 댓글
insert into comment1(id, comment_writer, comment_contents, board_id)
	values(5, 'c writer3','c contents3', 5); -- borad의 5번째 글이 없기 때문에 에러
select * from comment1;

-- 부모 데이터 삭제
-- 1,2번 게시글에는 댓글이 있고 3,4번 게시글에는 댓글이 없음
-- 3번 게시글 삭제
delete from board1 where id = 3;
-- 2번 게시글 삭제
delete from board1 where id = 2;
-- 2번 게시글이 작성된 댓글
delete from comment1 where id = 2;

-- 부모 데이터 삭제시 자식 데이터도 함께 삭제
drop table if exists board2; -- 있으면지우고 없으면 말고 ^^
create table board2(
	id bigint, -- 글번호
    board_writer varchar(20) not null, -- 작성자
    board_contents varchar(500),-- 내용
    constraint pk_board2 primary key(id)
);

drop table if exists comment2;
create table comment2 (
	id bigint, -- 댓글번호
    comment_writer varchar(20) not null, -- 댓글 작성자
	comment_contents varchar(200), -- 댓글내용
    board2_id bigint, -- 어떤 게시글에 작성된 댓글인지 글번호 정보가 필요함
    constraint pk_comment2 primary key(id),
    -- on delete cascode: 부모데이터 삭제 시 자식데이터도 함께 삭제
    constraint fk_comment2 foreign key(board2_id) references board2(id) on delete cascade
);
select * from comment2;
-- 게시글 4개 작성
insert into board2(id,board_writer,board_contents)
	values(1, 'writer1', 'contents1');
insert into board2(id,board_writer,board_contents)
	values(2, 'writer2', 'contents2');
insert into board2(id,board_writer,board_contents)
	values(3, 'writer3', 'contents3');
insert into board2(id,board_writer,board_contents)
	values(4, 'writer4', 'contents4');
select * from board2;

insert into comment2(id, comment_writer, comment_contents, board2_id)
	values(1, 'c writer1','c contents1', 1);

insert into comment2(id, comment_writer, comment_contents, board2_id)
	values(2, 'c writer2','c contents2', 1);

insert into comment2(id, comment_writer, comment_contents, board2_id)
	values(3, 'c writer3','c contents3', 2);
-- 3번 게시글 삭제
delete from board2 where id = 3;
-- 2번 게시글 삭제
delete from board2 where id = 2;

-- ------------------ 

drop table if exists board3; 
create table board3(
	id bigint, -- 글번호
    board_writer varchar(20) not null, -- 작성자
    board_contents varchar(500),-- 내용
    constraint pk_board3 primary key(id)
);

drop table if exists comment3;
create table comment3 (
	id bigint, -- 댓글번호
    comment_writer varchar(20) not null, -- 댓글 작성자
	comment_contents varchar(200), -- 댓글내용
    board3_id bigint, -- 어떤 게시글에 작성된 댓글인지 글번호 정보가 필요함
    constraint pk_comment3 primary key(id),
    -- on delete set null: 자식 데이터는 유지되지만 참조 컬럼은 null로 바꿈
    constraint fk_comment3 foreign key(board3_id) references board3(id) on delete set null
);
select * from comment3;
-- 게시글 4개 작성
insert into board3(id,board_writer,board_contents)
	values(1, 'writer1', 'contents1');
insert into board3(id,board_writer,board_contents)
	values(2, 'writer2', 'contents2');
insert into board3(id,board_writer,board_contents)
	values(3, 'writer3', 'contents3');
insert into board3(id,board_writer,board_contents)
	values(4, 'writer4', 'contents4');
select * from board3;

insert into comment3(id, comment_writer, comment_contents, board3_id)
	values(1, 'c writer1','c contents1', 1);

insert into comment3(id, comment_writer, comment_contents, board3_id)
	values(2, 'c writer2','c contents2', 1);

insert into comment3(id, comment_writer, comment_contents, board3_id)
	values(3, 'c writer3','c contents3', 2);
-- 3번 게시글 삭제
delete from board3 where id = 3;
-- 2번 게시글 삭제
delete from board3 where id = 2;

-- 수정쿼리
-- 1번 게시글 내용을 안녕하세요로 수정
select * from board3;
update board3 set board_contents = ' 안녕하세요 ' where id = 1;
-- 4번 게시글 작성자를 작성자4 , 내용을 곧 점심시간 으로 수정
update board3 set board_writer = ' 작성자4' , board_contents='곧 점심시간' where id = 4;

-- id 컬럼에 자동 번호 적용하기
drop table if exists board4;
create table board4(
	id bigint auto_increment, -- 글번호
    board_writer varchar(20) not null, -- 작성자
    board_contents varchar(500),-- 내용
    constraint pk_board4 primary key(id)
);
insert into board4(board_writer,board_contents)
	values('writer1', 'contents1');
insert into board4(board_writer,board_contents)
	values('writer2', 'contents2');
insert into board4(board_writer,board_contents)
	values('writer3', 'contents3');
insert into board4(board_writer,board_contents)
	values('writer4', 'contents4');
select * from board4;

-- 연습예제
drop table if exists book;
create table book (
	id bigint auto_increment,
    b_bookname varchar(20) not null,
    b_publisher varchar(10) not null,
    b_price bigint,
	constraint pk_book primary key(id)
);
select * from book;
insert into book(b_bookname,b_publisher, b_price)
	values('축구의 역사', '굿스포츠','7000');
insert into book(b_bookname,b_publisher, b_price)
	values('축구스카우팅 리포트', '나무수','13000');
insert into book(b_bookname,b_publisher, b_price)
	values('축구의 이해', '대한미디어','22000');
insert into book(b_bookname,b_publisher, b_price)
	values('배구 바이블', '대한미디어','35000');
insert into book(b_bookname,b_publisher, b_price)
	values('피겨 교본', '굿스포츠','8000');
insert into book(b_bookname,b_publisher, b_price)
	values('피칭 단계별기술', '굿스포츠','6000');
insert into book(b_bookname,b_publisher, b_price)
	values('야구의추억', '이상미디어','20000');
insert into book(b_bookname,b_publisher, b_price)
	values('야구를 부탁해', '이상미디어','13000');
insert into book(b_bookname,b_publisher, b_price)
	values('올림픽 이야기', '삼성당','7500');
insert into book(b_bookname,b_publisher, b_price)
	values('olympic champions', 'pearson','13000');
    
drop table if exists customer;
create table customer(
	id bigint auto_increment,
    c_name varchar(5) not null,
    c_address varchar(20) not null,
    c_phone varchar(15),
    constraint pk_customer primary key(id)
);
select * from customer;
insert into customer(c_name,c_address, c_phone)
	values('손흥민', '영국 런던','000-5000-0001');
insert into customer(c_name,c_address, c_phone)
	values('김연아', '대한민국 서울','000-6000-0001');
insert into customer(c_name,c_address, c_phone)
	values('김연경', '중국 상하이','000-7000-0001');
insert into customer(c_name,c_address, c_phone)
	values('류현진', '캐나다 토론토','000-8000-0001');
insert into customer(c_name,c_address)
	values('이강인', '스페인 마요르카');

drop table if exists orders;
create table orders(
	id bigint auto_increment,
    customer_id bigint,
    book_id bigint,
    o_saleprice bigint,
    o_orderdate date,
	constraint pk_orders primary key(id),
    constraint fk_orders foreign key(customer_id) references customer(id),
	constraint fk_orders1 foreign key(book_id) references book(id)
);
select * from orders;
insert into orders( customer_id,book_id,o_saleprice, o_orderdate)
	values(1,1,'6000',str_to_date('2021-07-01','%Y-%m-%d'));
insert into orders( customer_id,book_id,o_saleprice, o_orderdate)
	values(1,3,'21000',str_to_date('2021-07-03','%Y-%m-%d'));
insert into orders( customer_id,book_id,o_saleprice, o_orderdate)
	values(2,5,'8000',str_to_date('2021-07-03','%Y-%m-%d'));
insert into orders( customer_id,book_id,o_saleprice, o_orderdate)
	values(3,6,'6000',str_to_date('2021-07-04','%Y-%m-%d'));
insert into orders( customer_id,book_id,o_saleprice, o_orderdate)
	values(4,7,'20000',str_to_date('2021-07-05','%Y-%m-%d'));
insert into orders( customer_id,book_id,o_saleprice, o_orderdate)
	values(1,2,'12000',str_to_date('2021-07-07','%Y-%m-%d'));
insert into orders( customer_id,book_id,o_saleprice, o_orderdate)
	values(4,8,'13000',str_to_date('2021-07-07','%Y-%m-%d'));
insert into orders( customer_id,book_id,o_saleprice, o_orderdate)
	values(3,10,'12000',str_to_date('2021-07-08','%Y-%m-%d'));
insert into orders( customer_id,book_id,o_saleprice, o_orderdate)
	values(2,10,'7000',str_to_date('2021-07-09','%Y-%m-%d'));
insert into orders( customer_id,book_id,o_saleprice, o_orderdate)
	values(3,8,'13000',str_to_date('2021-07-10','%Y-%m-%d'));

use db_dbclass;
select * from book;
-- 1. 모든 도서의 가격과 도서명 조회
select  b_bookname , b_price from book;
-- 2. 모든 출판사 이름 조회
select b_publisher from book;
-- 2-1 중복값을 제외한 출판사 이름 조회
select distinct b_publisher from book;
-- 3. BOOK 테이블의 모든 내용 조회
select * from book;
-- 4. 20000원 미만의 도서만 조회
select * from book where b_price < 20000;
-- 5. 10000원 이상 20000원 이하인 도서만 조회
select * from book where b_price >= 10000 and  b_price <= 20000;
select * from book where b_price between 10000 and 20000;
-- 6. 출판사가 굿스포츠 또는 대한미디어인 도서 조회
select * from book where b_publisher = '굿스포츠' or b_publisher = '대한미디어';
select * from book where b_publisher in ('굿스포츠','대한미디어');
-- 7. 도서명에 축구가 포함된 모든 도서를 조회
select * from book where b_bookname like '%축구%';
-- 8. 도서명의 두번째 글자가 구인 도서 조회
select * from book where b_bookname like '_구%';
-- 9. 축구 관련 도서 중 가격이 20000원 이상인 도서 조회
select * from book where b_bookname like '%축구%' and b_price >= 20000;
-- 10. 책 이름순으로 전체 도서 조회
select * from book order by b_bookname asc;
-- 11. 도서를 가격이 낮은 것 부터 조회하고 같은 가격일 경우 도서명을 가나다 순으로 조회
select * from book order by b_price, b_bookname asc; 
-- 12. 주문 도서의 총 판매액 조회 
select sum(o_saleprice) from orders;
-- 13. 1번 고객이 주문한 도서 총 판매액 조회 
select sum(o_saleprice) from orders where customer_id = 1;
-- 14. ORDERS 테이블로 부터 평균판매가, 최고판매가, 최저판매가 조회 
select  avg(o_saleprice),max(o_saleprice),min(o_saleprice) from orders;
-- 15. 고객별로 주문한 도서의 총 수량과 총 판매액 조회
select customer_id,count(id), sum(o_saleprice) from orders group by customer_id ;
-- 16. 가격이 8,000원 이상인 도서를 구매한 고객에 대해 고객별 주문 도서의 총 수량 조회 (GROUP BY 활용)
--    (단, 8,000원 이상 도서 두 권 이상 구매한 고객만) 
select customer_id,count(id) from orders where o_saleprice > 8000 group by customer_id having count(id) >= 2;
-- 17. 김연아고객(고객번호 : 2) 총 구매액
select sum(o_saleprice) from orders where customer_id = 2;
-- 18. 김연아 고객이 구매한 도서의 수
select count(id) from orders where customer_id = 2;
-- 19. 서점에 있는 도서의 총 권수
select count(id) from book;
-- 20. 출판사의 총 수 
select count(distinct b_publisher) from book;
-- 21. 7월 4일 ~ 7일 사이에 주문한 도서의 주문번호 조회 
select * from orders where o_orderdate >= '2021-07-04' and o_orderdate <= '2021-07-07';
select * from orders where o_orderdate >= str_to_date('2021-07-04','%Y-%m-%d') and o_orderdate <= ('2021-07-07''%Y-%m-%d');
select * from orders where o_orderdate between str_to_date('2021-07-04','%Y-%m-%d') and  ('2021-07-07''%Y-%m-%d');
-- 22. 7월 4일 ~ 7일 사이에 주문하지 않은 도서의 주문번호 조회
select id from orders where o_orderdate > '2021-07-07' or o_orderdate < '2021-07-04';
-- 23. 고객, 주문 테이블 조인하여 고객번호 순으로 정렬
select * from customer c, orders o where c.id = o.customer_id order by c.id asc;
select * from customer c inner join orders o on c.id = o.customer_id;
-- 24. 고객이름(CUSTOMER), 고객이 주문한 도서 가격(ORDERS) 조회 
select c.c_name , o.o_saleprice from customer c, orders o where c.id =o.customer_id;
-- 25. 고객별(GROUP)로 주문한 도서의 총 판매액(SUM)과 고객이름을 조회하고 조회 결과를 가나다 순으로 정렬 
select c.c_name, sum(o.o_saleprice) from customer c, orders o where c.id = o.customer_id 
	group by c.c_name order by c.c_name asc;
-- 26. 고객명과 고객이 주문한 도서명을 조회(3테이블 조인)
select c.c_name , b.b_bookname from customer c, orders o , book b where c.id = o.customer_id and b.id = o.book_id; 
-- 27. 2만원(SALEPRICE) 이상 도서를 주문한 고객의 이름과 도서명을 조회 
select c.c_name , b.b_bookname from customer c, orders o , book b 
	where o_saleprice >= 20000 and c.id = o.customer_id and b.id = o.book_id; 
-- 28. 손흥민 고객의 총 구매액과 고객명을 함께 조회
select c.c_name, sum(o.o_saleprice) from customer c, orders o where c_name = '손흥민' and  c.id = o.customer_id;
-- 29. 손흥민 고객의 총 구매수량과 고객명을 함께 조회
select c.c_name, count(o.id) from  customer c, orde .rs o where c_name = '손흥민' and  c.id = o.customer_id;


-- 30. 가장 비싼 도서의 이름을 조회 
select * from book;
select b_bookname  from book  where b_price = (select max(b_price) from book);
-- 31. 책을 구매한 이력이 있는 고객의 이름을 조회
select distinct  c.c_name from customer c , orders o where  c.id = o.customer_id ;
select c_name from customer where id in(select customer_id from orders);
-- 32. 도서의 가격(PRICE)과 판매가격(SALEPRICE)의 차이가 가장 많이 나는 주문 조회 
select * from  book b , orders o where o.o_saleprice = (select max(b_price - o_saleprice) from orders) and o.book_id = b.id;
select max(b.b_price - o.o_saleprice) from book b, orders o where b.id = o.book_id;
-- 33. 고객별 평균 구매 금액이 도서의 판매 평균 금액 보다 높은 고객의 이름 조회 
select c_name from customer c , orders o  where c.id = o.customer_id group by c.id having avg(o_saleprice) > 
	(select avg(o_saleprice) from orders);
select avg(o_saleprice) from orders where customer_id = 4;
select * from customer;
-- 34. 고객번호가 5인 고객의 주소를 대한민국 인천으로 변경 
update customer set c_address = '대한민국 인천' where id = 5;
-- 35. 김씨 성을 가진 고객이 주문한 총 판매액 조회
select c_name , sum(o_saleprice) from customer c , orders o  where c.id = o.customer_id and c_name like '김__'
	group by c_name;
select sum(o_saleprice) from orders where customer_id in(select id from customer where c_name like '김%');

-- 테이블 구조 변경 (alter)
create table student(
	id bigint,
    s_name varchar(20),
    s_mobile int
);
-- 기존 컬럼에 제약조건 추가
alter table student add constraint primary key (id);
desc student;
-- 기존 컬럼 타입 변경
alter table student modify s_mobile varchar(30);
-- 새로운 컬럼 추가
alter table student add s_major varchar(30);
-- 컬럼 이름 변경
alter table student change s_mobile s_phone varchar(30);
-- 컬럼 삭제
alter table student drop s_major;

drop table if exists board_table;
create table board_table(
id 					bigint auto_increment primary key,
board_title 		varchar(50) not null,
board_writer		varchar(20) not null,
board_contents 		varchar(500),
board_hits 			int default 0,
board_crated_time 	datetime default now(),
board_updated_time 	datetime on update now(),-- 업데이트가 발생 했을 때 현재 시간을 기록
board_file_attached int default 0, -- 파일 첨부 여부( 없으면 0 , 있으면 1)
member_id			bigint,
category_id 		bigint,

constraint fk_board_table1 foreign key(member_id) references member_table(id) on delete cascade,
constraint fk_board_table2 foreign key(category_id) references category_table(id) on delete set null
);
select * from board_table;


drop table if exists board_file_table;
create table board_file_table(
id 					bigint auto_increment primary key,
original_file_name 	varchar(100), -- 사용자가 업로드한 파일의 이름 
stored_file_name 	varchar(100), -- 관리용 파일 이름 (파일이름 생성 로직은 backend에서)
board_id 			bigint,

constraint fk_board_file_table foreign key(board_id) references board_table(id) on delete cascade
);

drop table if exists member_table;
create table member_table(
id 				bigint auto_increment primary key,
member_email 	varchar(50) not null unique,
member_name 	varchar(20) not null,
member_password varchar(20) not null 
);

drop table if exists category_table;
create table category_table(
id 				bigint auto_increment primary key,
category_name 	varchar(20) not null unique
);

drop table if exists comment_table;
create table comment_table(
id 					bigint auto_increment primary key,
comment_writer 		varchar(20) not null,
comment_contents 	varchar(200) not null,
comment_created_time datetime default now(),
board_id 			bigint,
member_id 			bigint,

constraint fk_comment_table foreign key(board_id) references board_table(id) on delete cascade, 
constraint fk_comment_table2 foreign key(member_id) references member_table(id) on delete cascade
);

drop table if exists good_table;
create table good_table(
id 			bigint auto_increment primary key,
comment_id 	bigint,
member_id 	bigint,

constraint fk_good_table foreign key(member_id) references member_table(id) on delete cascade,
constraint fk_good_table2 foreign key(comment_id)  references comment_table(id)
);

-- 회원 기능
-- 1. 회원가입
select * from member_table;
insert into member_table(member_name,member_email,member_password) values('최민호','mino210125@naver.com','1234');
insert into member_table(member_name,member_email,member_password) values('이신욱','548125@naver.com','1234');
insert into member_table(member_name,member_email,member_password) values('이호섭','guping25@naver.com','1234');
-- 2. 이메일 중복체크 
-- 기존 가입된 이메일로 가입하려고 한다면
select member_email from member_table where member_email = 'mino210125@naver.com';
-- 기존 가입되어 있지 않은 이메일로 가입하려고 한다면
select member_email from member_table where member_email = 'mino25@naver.com';
-- 3. 로그인
select * from member_table where member_email = 'mino210125@naver.com' and member_password = '1234';
-- 4. 전체 회원 목록 조회 
select * from member_table;
-- 5. 특정 회원만 조회
select * from member_table where member_email= 'mino210125@naver.com';
-- 6. 회원정보 수정화면 요청 
select * from member_table where member_email= 'mino210125@naver.com' and member_password = '1234';
-- 7. 회원정보 수정 처리(비밀번호 변경)
update member_table set member_password ='7894'  where id = 1;
-- 8. 회원 삭제 또는 탈퇴 
-- alter table member_table drop ;
delete from member_table where id = 1;

-- 게시글 카테고리 
-- 게시판 카테고리는 자유게시판, 공지사항, 가입인사 세가지가 있음.
select * from category_table;
insert into category_table(category_name) values ('자유게시판');
insert into category_table(category_name) values ('공지사항');
insert into category_table(category_name) values ('가입인사');
-- 게시판 기능 
-- 1. 게시글 작성(파일첨부 x) 3개 이상 
select * from board_table;
insert into board_table(board_title,board_writer,board_contents,board_file_attached)
	values ('자바는즐거워','최민호','여러분 자바는 즐겁지 않습니까??ㅎㅎ',0);
insert into board_table(board_title,board_writer,board_contents,board_file_attached)
	values ('신나는 점심시간','이신욱','여러분 여러분은 오늘 점심 뭐드세요?',0);
insert into board_table(board_title,board_writer,board_contents,board_file_attached)
	values ('데이터베이스문의','이호섭','Mysql하고있는데 개노잼',0);
    
-- 1번 회원이 자유게시판 글 2개, 공지사항 글 1개 작성 
insert into board_table(member_id,category_id,board_title,board_writer,board_contents,board_file_attached)
	values (3,1,'여기가 자유게시판인가요?','홍길동','자바게시판인줄',0);
insert into board_table(member_id,category_id,board_title,board_writer,board_contents,board_file_attached)
	values (3,1,'저기요 아무도 없으세요??','홍길동','여기 활동 아무도 안하나?',0);
insert into board_table(member_id,category_id,board_title,board_writer,board_contents,board_file_attached)
	values (3,2,'공지사항 알립니다','홍길동','여기는 아무도 없습니다',0);
delete from board_table;

-- 2번 회원이 자유게시판 글 3개 작성
insert into board_table(member_id,category_id,board_title,board_writer,board_contents,board_file_attached)
	values (6,1,'활동중인 페이지입니다','최민호','함부로 판단하지마세요',0);
insert into board_table(member_id,category_id,board_title,board_writer,board_contents,board_file_attached)
	values (6,1,'홍길동님','최민호','활동 열심히 하세요',0);
insert into board_table(member_id,category_id,board_title,board_writer,board_contents,board_file_attached)
	values (6,1,'공지사항 막하네','최민호','여기 주인이셨구나',0);
    
-- 3번 회원이 가입인사 글 1개 작성 
insert into board_table(member_id,category_id,board_title,board_writer,board_contents,board_file_attached)
	values (9,3,'안녕하세요 가입했어요','이신욱','잘 부탁드립니다',0);
    
-- 1.1. 게시글 작성(파일첨부 o)
insert into board_file_table(original_file_name,stored_file_name,board_id)
	values ('홈페이지관리규정','1112233',14);
select * from board_file_table;
insert into board_table(member_id,category_id,board_title,board_writer,board_contents,board_file_attached)
	values (3,1,'홈페이지관리파일 올립니다','홍길동','참고해주세요',1);

-- 2번 회원이 파일있는 자유게시판 글 2개 작성
insert into board_file_table(original_file_name,stored_file_name,board_id)
	values ('중고차수출은 여기','121212',15);
select * from board_file_table;
insert into board_table(member_id,category_id,board_title,board_writer,board_contents,board_file_attached)
	values (6,1,'중고차수출은 커머스무역','최민호','사진참고해주세요',1);

insert into board_file_table(original_file_name,stored_file_name,board_id)
	values ('커머스무역수출차량','12121212',16);
select * from board_file_table;
insert into board_table(member_id,category_id,board_title,board_writer,board_contents,board_file_attached)
	values (6,1,'광고죄송합니다','최민호','사장님이 시켰어요',1);
-- 2. 게시글 목록 조회 
select * from board_table where category_id = 1; -- 자유게시판
select * from board_table where category_id = 2; -- 공지사항
select * from board_table where category_id = 3; -- 가입인사

-- 2.1 전체글 목록 조회
select * from board_table;

-- 2.2 자유게시판 목록 조회 
select * from board_table where category_id = 1; -- 자유게시판

-- 2.3 공지사항 목록 조회 
select * from board_table where category_id = 2; -- 공지사항

-- 2.4 목록 조회시 카테고리 이름도 함께 나오게 조회
select b.* ,c.category_name
	from board_table b , category_table c  where b.category_id = c.id; 
    
-- 3. 2번 게시글 조회 (조회수 처리 필요함)
update board_table set board_hits = +1  where id = 2;
select * from board_table where id = 2;

-- 3.1. 파일 첨부된 게시글 조회 (게시글 내용과 파일을 함께)
select * from board_table;
select * from board_file_table;
select b.*,f.original_file_name from board_table b,board_file_table f 
		where b.id = f.board_id;
-- 4. 1번 회원이 자유게시판에 첫번째로 작성한 게시글의 제목, 내용 수정
update board_table set board_title = '수정제목', board_contents ='수정내용' where id =1;

-- 5. 2번 회원이 자유게시판에 첫번째로 작성한 게시글 삭제 
delete from board_table where id=3;

-- 7. 페이징 처리(한 페이지당 글 3개씩)
select * from board_table;
select * from board_table order by id desc;
-- 7.1. 첫번째 페이지
select * from board_table order by id desc limit 0,3; 
-- 7.2. 두번째 페이지
select * from board_table order by id desc limit 3,3;
-- 7.3. 세번째 페이지 
select * from board_table order by id desc limit 6,3;
-- 정렬기준은 조회수 , 한페이지당 글 5개씩 볼 때 1페이지
select * from board_table order by board_hits desc limit 0,5;
-- 전체 글갯수
select count(id) from board_table;
-- 개시글 갯수: 10개 , 한페이지당 4개씩:3 , 한페이지당 3개씩:4 
-- 8. 검색(글제목 기준)
-- 8.1 검색결과를 오래된 순으로 조회 
select * from board_table where board_title like '%자바%' order by id asc;
-- 8.2 검색결과를 조회수 내림차순으로 조회 
select * from board_table where board_title like '%자바%' order by board_hits asc;
-- 8.3 검색결과 페이징 처리(검색 결과 중 첫페이지( 한페이지 당 글 2개씩 나온다고 과정)
select * from board_table where board_title like '%자바%' order by id asc limit 0,2; 

-- 댓글 기능 
-- 1. 댓글 작성 
-- 1.1. 1번 회원이 1번 게시글에 댓글 작성 
insert into comment_table(member_id,board_id,comment_writer,comment_contents) 
	values(3,1,'홍길동','ㅋㅋㅋㅋ꺼져라');
select * from comment_table;
-- 1.2. 2번 회원이 1번 게시글에 댓글 작성 
insert into comment_table(member_id,board_id,comment_writer,comment_contents) 
	values(6,1,'이순신','영웅은 죽지 않아요 ^^');
-- 2. 댓글 조회
select * from comment_table;
-- 3. 댓글 좋아요 
select * from good_table;
-- 좋아요 하기 전 체크
select id from good_table where comment_id = 1 and member_id =3;
-- 좋아요 한 적이 없다면 좋아요
insert into good_table(comment_id,member_id) values (1,3);
-- 좋아요 한적이 있다면 좋아요 취소
delete from good_table where id =3;
-- 3.1. 1번 회원이 2번 회원이 작성한 댓글에 좋아요 클릭
insert into good_table(comment_id,member_id) values (2,6);
-- 3.2. 3번 회원이 2번 회원이 작성한 댓글에 좋아요 클릭 
insert into good_table(comment_id,member_id) values (3,3);
-- 4. 댓글 조회시 좋아요 갯수도 함께 조회
select c.*,count(g.comment_id) as 'Like' from comment_table c , good_table g  where c.id = g.comment_id group by c.id;
select * from comment_table;
select * from good_table;
select count(id) from good_table;

show tables; 
-- 정보처리산업기사 예제
-- 투표이력 테이블 생성 
drop table if exists tbl_vote_202005;
create table tbl_vote_202005(
    v_jumin char(13) not null primary key,
    v_name varchar(20),
    m_no char(1), 
    v_time char(4),
    v_area char(20),
    v_confirm char(1)
    );
select * from tbl_vote_202005;    
-- 투표이력 데이터 저장
insert into tbl_vote_202005 values ('99010110001', '김유권', '1', '0930', '제1투표장', 'N');
insert into tbl_vote_202005 values ('89010120002', '이유권', '2', '0930', '제1투표장', 'N');
insert into tbl_vote_202005 values ('69010110003', '박유권', '3', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('59010120004', '홍유권', '4', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('79010110005', '조유권', '5', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('89010120006', '최유권', '1', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('59010110007', '지유권', '1', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('49010120008', '장유권', '3', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('79010110009', '정유권', '3', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('89010120010', '강유권', '4', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('99010110011', '신유권', '5', '0930', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('79010120012', '오유권', '1', '1330', '제1투표장', 'Y');
insert into tbl_vote_202005 values ('69010110013', '현유권', '4', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('89010110014', '왕유권', '2', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('99010110015', '유유권', '3', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('79010110016', '한유권', '2', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('89010110017', '문유권', '4', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('99010110018', '양유권', '2', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('99010110019', '구유권', '4', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('79010110020', '황유권', '5', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('69010110021', '배유권', '3', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('79010110022', '전유권', '3', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('99010110023', '고유권', '1', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('59010110024', '권유권', '3', '1330', '제2투표장', 'Y');

insert into tbl_vote_202005 values ('00010130024', '오유권', '3', '1330', '제2투표장', 'Y');
insert into tbl_vote_202005 values ('02010140024', '최유권', '3', '1330', '제2투표장', 'Y');



-- 후보자 테이블 생성
drop table if exists tbl_member_202005;
create table tbl_member_202005(
    m_no char(1) not null primary key,
    m_name varchar(20),
    p_code char(2),
    p_school char(1),
    m_jumin char(13),
    m_city varchar(20)
    );
select * from tbl_member_202005;    
-- 후보자 데이터 저장
insert into tbl_member_202005 values ('1', '김후보', 'P1', '1', '6603011999991', '수선화동');
insert into tbl_member_202005 values ('2', '이후보', 'P2', '3', '5503011999992', '민들래동');
insert into tbl_member_202005 values ('3', '박후보', 'P3', '2', '7703011999993', '나팔꽃동');
insert into tbl_member_202005 values ('4', '조후보', 'P4', '2', '8803011999994', '진달래동');
insert into tbl_member_202005 values ('5', '최후보', 'P5', '3', '9903011999995', '개나리동');

-- 정당 테이블 생성
drop table if exists tbl_party_202005;
create table tbl_party_202005(
    p_code char(2) not null primary key,
    p_name varchar(20),
    p_indate date,
    p_reader varchar(20),
    p_tel1 char(3),
    p_tel2 char(4),
    p_tel3 char(4)
    );
select * from tbl_party_202005;
-- 정당 데이터 저장    
insert into tbl_party_202005 values ('P1', 'A정당', '2010-01-01', '위대표', '02', '1111', '0001');
insert into tbl_party_202005 values ('P2', 'B정당', '2010-02-01', '명대표', '02', '1111', '0002');
insert into tbl_party_202005 values ('P3', 'C정당', '2010-03-01', '기대표', '02', '1111', '0003');
insert into tbl_party_202005 values ('P4', 'D정당', '2010-04-01', '옥대표', '02', '1111', '0004');
insert into tbl_party_202005 values ('P5', 'E정당', '2010-05-01', '임대표', '02', '1111', '0005');

-- 1. 후보자정보 조회
-- 1.1 후보자 , 정당 테이블 조인
select * from tbl_member_202005 m , tbl_party_202005 p where m.p_code= p.p_code;
-- 1.2 필요한 정보만 조회
select m.m_no as '후보번호', m.m_name as '성명', p.p_name as '소속정당',
	case
		when p_school= '1' then '고졸'
        when p_school = '2' then '학사'
        when p_school = '3' then '석사'
        when p_school = '4' then '박사'
        else '없음'
	end as '최종학력',
    concat(left(m_jumin,6),'-',right(m_jumin,7))as '주민번호',
	m.m_city as '지역구',
    concat((p.p_tel1),'-',(p.p_tel2),'-',(p.p_tel3)) as '대표전화'
    from tbl_member_202005 m, tbl_party_202005 p where m.p_code = p.p_code;
-- 1.3 학력 표현
-- 1:고졸, 2:학사, 3:석사, 4:박사
select p_school from tbl_member_202005;
select p_school,
	case
		when p_school= '1' then '고졸'
        when p_school = '2' then '학사'
        when p_school = '3' then '석사'
        when p_school = '4' then '박사'
        else '없음'
	end as '학력'
	from tbl_member_202005;
-- 1.4 주민번호(총13자리)
select m_jumin from tbl_member_202005;
select concat(left(m_jumin,6),'-',right(m_jumin,7))as '주민번호' from tbl_member_202005;
-- substr()
-- 앞 6자리
select substr(m_jumin,1,6) from tbl_member_202005;
-- 앞 7자리
select substr(m_jumin,7,7) from tbl_member_202005;
select concat(
		substr(m_jumin,1,6) ,'-',substr(m_jumin,7,7)) as '주민번호'from tbl_member_202005;
-- 1.5 전화번호
select p_tel1,p_tel2,p_tel3 from tbl_party_202005;
select concat((p_tel1),'-',(p_tel2),'-',(p_tel3)) as '대표전화'
		from tbl_party_202005;
        
-- 1.6 완성
-- 1.6 완성 
select  m.m_no as '후보번호', 
		m.m_name as '성명', 
        p.p_name as '소속정당', 
        case when m.p_school='1' then '고졸'
			 when m.p_school='2' then '학사'
			 when m.p_school='3' then '석사'
			 when m.p_school='4' then '박사'
			else '없음'
			end as '학력', 
		concat(
				substr(m.m_jumin, 1, 6),
                '-',
                substr(m.m_jumin, 7, 7)
			 ) as '주민번호', 
        m.m_city as '지역구', 
        concat(p.p_tel1, '-', p.p_tel2, '-', p.p_tel3) as '대표전화'        
	from tbl_member_202005 m, tbl_party_202005 p 
	where m.p_code = p.p_code;
    
-- 후보자 등수 출력
select count(v_confirm) from tbl_vote_202005 where v_confirm = 'Y';
select * from tbl_vote_202005;
select * from tbl_member_202005;
select m.m_no as '후보번호',m.m_name as '성명' ,count(m.m_no) '총 투표건수'
	from tbl_vote_202005 v , tbl_member_202005 m  
		where v.m_no = m.m_no and v.v_confirm = 'Y' group by m.m_no, m.m_name
        order by count(v.m_no) desc ,m.m_name asc;

-- 투표 검수 조회
select * from tbl_vote_202005;
select  case
	when substr(v_jumin,7,1) in ('1','2') then concat('19',(substr(v_jumin,1,2)),'년',(substr(v_jumin,3,2)),'월',(substr(v_jumin,5,2)),'일')
    when substr(v_jumin,7,1) in ('3','4') then concat('20',(substr(v_jumin,1,2)),'년',(substr(v_jumin,3,2)),'월',(substr(v_jumin,5,2)),'일')
    else '없음'
    end
	as '생년월일' from tbl_vote_202005;
    
select concat(
				-- 앞자리 만들기
				case
					when substr(v_jumin,7, 1) in('1','2') then '19'
                    when substr(v_jumin,7, 1) in('3','4') then '00'
				end,
                -- 년도 뒤 두자리
                substr(v_jumin, 1,2),
                '년',
				-- 월 두 자리
                substr(v_jumin, 3,2),
                '월',
                -- 일 두 자리
                substr(v_jumin, 5,2),
                '일생'
                ) as '생년월일'
                from tbl_vote_202005;
-- 만나이 계산
-- 만나이(현재년도 - 태어난년도)
select sysdate() from dual;
-- 현재년도
select date_format(sysdate(),'%Y') from dual;
-- 정수형태로 변환
select cast(date_format(sysdate(), '%Y') as unsigned) from dual;
select cast(date_format(sysdate(), '%Y') as unsigned) - 2021 from dual;
-- 결과
select concat(
				'만',
                cast(date_format(sysdate(), '%Y') as unsigned) -- 현재년도
				- -- 뺄셈
                concat(case 
							when substr(v_jumin, 7, 1) in('1', '2') then '19'
							when substr(v_jumin, 7, 1) in('3', '4') then '20'
						end,
					   substr(v_jumin, 1, 2)
					  ),
                '세'
			 ) as '나이'
	from tbl_vote_202005;
-- 성별
select  case
		when substr(v_jumin,7,1) in ('1','3') then '남자'
        when substr(v_jumin,7,1) in ('2','4') then '여자'
        else '없음'
        end as '성별'
        from tbl_vote_202005;
select * from tbl_vote_202005;

-- 투표시간
select concat( substr(v_time,1,2),':',( substr(v_time,3,2))) from tbl_vote_202005;
-- 유권자 확인
select case 
	when v_confirm = 'N' then '미확인'
    when v_confirm = 'Y' then '확인'
    else '없음'
    end as '유권자확인'
    from tbl_vote_202005;
    
-- 결과
select v_name as '성명', case
	when substr(v_jumin,7,1) in ('1','2') then concat('19',(substr(v_jumin,1,2)),'년',(substr(v_jumin,3,2)),'월',(substr(v_jumin,5,2)),'일')
    when substr(v_jumin,7,1) in ('3','4') then concat('20',(substr(v_jumin,1,2)),'년',(substr(v_jumin,3,2)),'월',(substr(v_jumin,5,2)),'일')
    else '없음'
    end
	as '생년월일',
    concat(
				'만',
                cast(date_format(sysdate(), '%Y') as unsigned) -- 현재년도
				- -- 뺄셈
                concat(case 
							when substr(v_jumin, 7, 1) in('1', '2') then '19'
							when substr(v_jumin, 7, 1) in('3', '4') then '20'
						end,
					   substr(v_jumin, 1, 2)
					  ),
                '세'
			 ) as '나이',
              case
		when substr(v_jumin,7,1) in ('1','3') then '남자'
        when substr(v_jumin,7,1) in ('2','4') then '여자'
        else '없음'
        end as '성별',
        m_no as '후보번호',
        concat( substr(v_time,1,2),':',( substr(v_time,3,2))) as '투표시간',
        case
        when v_confirm = 'N' then '미확인'
		when v_confirm = 'Y' then '확인'
		else '없음'
		end as '유권자확인'
		from tbl_vote_202005;

-- view(뷰)
create view vote_result as
select v_name as '성명', case
	when substr(v_jumin,7,1) in ('1','2') then concat('19',(substr(v_jumin,1,2)),'년',(substr(v_jumin,3,2)),'월',(substr(v_jumin,5,2)),'일')
    when substr(v_jumin,7,1) in ('3','4') then concat('20',(substr(v_jumin,1,2)),'년',(substr(v_jumin,3,2)),'월',(substr(v_jumin,5,2)),'일')
    else '없음'
    end
	as '생년월일',
    concat(
				'만',
                cast(date_format(sysdate(), '%Y') as unsigned) -- 현재년도
				- -- 뺄셈
                concat(case 
							when substr(v_jumin, 7, 1) in('1', '2') then '19'
							when substr(v_jumin, 7, 1) in('3', '4') then '20'
						end,
					   substr(v_jumin, 1, 2)
					  ),
                '세'
			 ) as '나이',
              case
		when substr(v_jumin,7,1) in ('1','3') then '남자'
        when substr(v_jumin,7,1) in ('2','4') then '여자'
        else '없음'
        end as '성별',
        m_no as '후보번호',
        concat( substr(v_time,1,2),':',( substr(v_time,3,2))) as '투표시간',
        case
        when v_confirm = 'N' then '미확인'
		when v_confirm = 'Y' then '확인'
		else '없음'
		end as '유권자확인'
		from tbl_vote_202005;
 -- view 가상테이블       
select * from vote_result;
select * from tbl_vote_202005;