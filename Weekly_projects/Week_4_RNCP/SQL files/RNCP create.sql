# Database and table creation

create database if not exists paris_event;
use paris_event;

create table if not exists insee (
code_insee varchar(50),
nom_commune varchar(100),
code_postal int,
libelle varchar(100),
coord_gps varchar(100),
PRIMARY KEY (code_insee)
);

create table if not exists organisator (
url varchar(750),
url_contact varchar(100),
telephone varchar(30),
email varchar(100),
facebook varchar(100),
PRIMARY KEY (url)
);

create table if not exists location (
lieu varchar(100),
titre varchar(100),
adresse varchar(100),
ville varchar(100),
code_postal int,
code_insee int,
PRIMARY KEY (lieu),
FOREIGN KEY (code_insee) references insee(code_insee)
);

create table if not exists event (
ID int,
titre varchar(100),
chapeau varchar(100),
mots_cles varchar(100),
type_prix varchar(100),
date_debut date,
date_fin date,
nb_occurrences int,
acces_pmr int,
acces_mal_voyant int,
acces_mal_entendant varchar(100),
lieu varchar(100),
code_insee int,
url varchar(100),
PRIMARY KEY (ID),
FOREIGN KEY (lieu) references location(lieu),
FOREIGN KEY (code_insee) references insee(code_insee),
FOREIGN KEY (url) references organisator(url)
);


#We can import data into table this way

LOAD DATA INFILE 'C:\Users\matui\Downloads\insee.csv'
INTO TABLE insee
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

#Error message because I don't have the file in my computer for now:
#Error Code: 1290. The MySQL server is running with the --secure-file-priv option so it cannot execute this statement
