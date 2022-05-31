create database Lab32;
use Lab32;

create table bank (
TransactionID integer,
ClientID integer,
Profession varchar(20),
Bank_dep integer,
Risk varchar(10),
Number_credits integer,
Revenue integer);

insert into bank 
values (1, 231, 'Self-employed', '009', 'High', 2, 30200), 
(2, 765, 'students', '005', 'high', 3, 12700),
(3, 453, 'Horeca', '007', 'medium', 5, 89400),
(4, 231, 'self-employed', '009', 'high', 2, 30200),
(5, 892, 'finance', '003', 'low', 3, 740000);

select * from bank;
