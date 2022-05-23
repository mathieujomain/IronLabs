# Adding values in our tables

use lab_20;
select * from cars;
select * from sales;
select * from customers;
select * from invoices;

insert into cars values
(0, '3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', 2019, 'Blue'),
(1, 'ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', 2019 ,'Red'),
(2, 'RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', 2018 ,'White'),
(3, 'HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4',2018,'Silver'),
(4, 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60', 2019 , 'Gray'),
(5, 'DAM41UDN3CHU2WVF6', 'Volvo' ,'V60 Cross Coun', 2019,'Gray');

insert into customers values
(0, 10001, "Pablo Picasso", 34636176382, "-", "Paseo de la Chopera, 14", "Madrid", "Madrid", "Spa", 28045),
(1, 20001, "Abraham Linclon", 13059077086, "-", "120 SW 8th St", "Miami", "Florida", "Usa", 33130),
(2, 30001, "Napoléon Bonaparte", 33179754000, "-", "40 Rue du Colisée", "Paris", "Ile-de-France", "Fra", 75008);

insert into salespersons values
(0, 00001, "Petey Cruiser", "Madrid"),
(1, 00002, "Anna Sthesia", "Barcelona"),
(2, 00003, "Paul Molive", "Berlin"),
(3, 00004, "Gail Forcewind", "Paris"),
(4, 00005, "Paige Turner", "Mimia"),
(5, 00006, "Bob Frapples", "Mexico City"),
(6, 00007, "Walter Melon", "Amsterdam"),
(7, 00008, "Shonda Leer", "São Paulo");

insert into invoices values
(0, "852399038", "2018-08-22", 0, 1, 3),
(1, "731166526", "2018-12-31", 3, 0, 5),
(2, "271135104","2019-01-22", 2, 2, 7);