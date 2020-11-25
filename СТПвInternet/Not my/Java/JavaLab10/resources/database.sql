create table users
(
    login        varchar(50),
    password     varchar(256) not null,
    last_login   date,
    login_number integer default 0,
    id           serial       not null
        constraint user_pk
            primary key
);

alter table users
    owner to postgres;

