#Selecting the database
use paris_event;

#Query 1: For example we want to get the email of events related to sport that occurs more than 2 times
select email, ID, titre
from event
join organisator
on organisator.url = event.url
where mots_cles = 'sport' and nb_occurrences > 2;


#Query 2: We want to have the list of events keywords and their total count
select mots_cles, count(mots_cles)
from event
group by mots_cles
order by count(mots_cles) desc;


#Query 3: Where most of events take place based on the type of price
select nom_commune, type_prix, count(type_prix)
from event
join insee
on insee.code_insee = event.code_insee
group by nom_commune, type_prix
order by count(type_prix) desc;


#Query 4: Here almost same as query 3 but with the key word
select nom_commune, mots_cles, count(mots_cles)
from event
join insee
on insee.code_insee = event.code_insee
group by nom_commune, mots_cles
order by count(mots_cles) desc;


#Query 5: Again same thing but with occurrences
select nom_commune, sum(nb_occurrences) as occurences
from event
join insee
on insee.code_insee = event.code_insee
group by nom_commune
order by sum(nb_occurrences) desc;