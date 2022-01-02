create sequence hibernate_sequence start 2 increment 1;

create table tasks (
    id int8 not null,
    date varchar(255),
    description varchar(255),
    is_done boolean not null,
    name varchar(255),
    user_id int8,
    primary key (id));

create table user_role (
    user_id int8 not null,
    roles varchar(255));

create table usr (
    id int8 not null,
    activation_code varchar(255),
    active boolean not null,
    email varchar(255),
    password varchar(255) not null,
    pay_per_task int8,
    salary int8,
    session_started boolean not null,
    username varchar(255) not null,
    primary key (id));

alter table if exists tasks add constraint FKid0236jhnltusxn9qmkwlbkog foreign key (user_id) references usr;

alter table if exists user_role add constraint FKfpm8swft53ulq2hl11yplpr5 foreign key (user_id) references usr;