# Making some updates in tables

use lab_20;
select * from cars;
select * from sales;
select * from customers;
select * from invoices;

update salespersons
set store_id = "Miami"
where store_id = "Mimia";

update customers
set name = "Abraham Lincoln"
where name = "Abraham Linclon";

update customers
set email = "ppicasso@gmail.com"
where name = "Pablo Picasso";

update customers
set email = "lincoln@us.gov"
where name = "Abraham Lincoln";

update customers
set email = "hello@napoleon.me"
where name = "Napoléon Bonaparte";

delete from cars
where cars.ID=4;