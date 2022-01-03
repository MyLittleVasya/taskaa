insert into usr(id, username, password, active, session_started, salary, pay_per_task)
    values(1, 'admin', '1', true, false, 0, 0);
insert into user_role(user_id, roles)
    values(1, 'ADMIN');