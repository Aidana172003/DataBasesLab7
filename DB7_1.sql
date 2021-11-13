--task1
-- Large objects (photos, videos, CAD files, etc.) are stored as a large object:
--• blob: binary large object -- object is a large collection of uninterpreted binary data (whose interpretation is left to
--an application outside of the database system)
--• clob: character large object -- object is a large collection of character data
-- When a query returns a large object, a pointer is returned rather than the large object itself.
--task2
--A user privilege is a right to execute a particular type of SQL statement, or a right to access another user's object.
--Roles are created by users (usually administrators) and are used to group together privileges or other roles.
--1
create role accountant;
create role administrator;
create role support;
grant insert on transactions to accountant;
grant update on customers to administrator;
grant select, insert on accounts to support;
--2
create user A;
create user A1;
create user A2;
grant accountant to A;
grant administrator to A1;
grant support to A2;
--3
create user B;
grant all privileges on customers, accounts, transactions to B with grant option;
--4
revoke select, update on customers, accounts, transactions from B;
--task3
create table student(
    id int not null,
    name varchar(12) not null
);
--task5
--1
create index currency on accounts (customer_id,currency);
--2
create index search_index on accounts (currency,balance);
--task6
do $$declare
    begin
    update accounts
    set balance=balance-1000
    where account_id='RS88012';
    update accounts
    set balance=balance+1000
    where account_id='NT10204';
    update transactions set status='commited' where id=3;
    commit;
end$$;
