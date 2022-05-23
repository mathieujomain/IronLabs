# Database and table creation

create database if not exists lab_20;
use lab_20;

create table if not exists cars (
ID int,
VIN varchar(20),
manufacturer varchar(15),
model varchar(15),
year year,
color varchar(15));

create table if not exists salespersons (
ID int,
staff_id int,
name varchar(15),
store_id varchar(20));

create table if not exists customers (
ID int,
cust_id int,
name varchar(50),
phone varchar(30),
email varchar(30),
adress varchar(30),
city varchar(20), 
state varchar(20),
country varchar(20),
postal integer);

create table if not exists invoices (
ID int,
invoice_id varchar(20),
inv_date date,
car varchar(20),
customer varchar(20),
sales_person varchar(20));


--
--
--



