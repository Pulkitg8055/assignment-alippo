use growskill;

insert into customers values (default, "Pulkit", "gupta", "pk@gmail.com", "2022-10-10");
insert into customers values (default, "Amit", "Kumar", "amikt@gmail.com", "2021-04-09");
insert into customers values (default, "Vivek", "mihra", "vive@gmail.com", "2021-01-15");

insert into instructors values (default, "Anushka");
insert into instructors values (default, "Mohit");
insert into instructors values (default, "Shilpi");

insert into courses values (default, "Baking", 42.05, 1);
insert into courses values (default, "MakeUp", 420.05, 2);
insert into courses values (default, "HandCraft", 94.05, 3);

insert into enrollments values (1, 2,  "2021-09-01", 420.05);
insert into enrollments values (2, 1,  "2022-09-10", 42.05);

insert into class_status values (1, "UpComing");
insert into class_status values (2, "Live");
insert into class_status values (3, "Download");

insert into links values (1, "http:hello");
insert into links values (2, "http:com.com");
insert into links values (3, "http:google");

insert into classes values(default, "How to bake", "2023-11-11", 1, 1, 1);
insert into classes values(default, "How to do makeup", "2021-11-11", 2, 3, 2);
insert into classes values(default, "How to bake", "2021-11-11", 1, 3, 3);

-- To check total customers
select * from customers;

-- To check enrolled customer
select *
from customers 
where customer_id in (
			select customer_id
            from enrollments);

-- To check courses list
select * from courses;

-- To check enrolled courses list
select * from courses
where course_id in (
				select course_id from enrollments);

-- To check instructor of course 
select * from courses c
join instructors i
using(instructor_id)
where course_id in (select course_id from enrollments);

start transaction;
insert into enrollments values (1, 3, "2022-11-10", 50);
commit;

-- To delete customer and its data
start transaction;
delete from enrollments where customer_id = 1;
delete from customers where customer_id = 1;
commit;

start transaction;
insert into links values (4, "https:gg.com");
insert into classes values (default, "How to do", "2023-01-01", 3, 1, 4);
commit;

