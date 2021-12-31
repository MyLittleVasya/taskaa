insert into usr(id, username, password, active, session_started)
    values(1, 'admin', '1', true, false);
insert into user_role(user_id, roles)
    values(1, 'ADMIN');