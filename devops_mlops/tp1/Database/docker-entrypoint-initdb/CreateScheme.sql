create table public.departments (
   id   serial primary key,
   name varchar(20) not null
);

create table public.students (
   id            serial primary key,
   department_id int not null
      references departments ( id ),
   first_name    varchar(20) not null,
   last_name     varchar(20) not null
);