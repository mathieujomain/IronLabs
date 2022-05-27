create database if not exists project_3;
use project_3;


#Understanding the distribution of data by education sector, gender and number of student

select distinct EducationSector, Gender, count(Age) as Number_of_Student
from data
group by EducationSector, Gender
order by EducationSector, count(Age) desc;


# Look at the number of entrepeneurial competency for each sector of education

select distinct EducationSector, count(`Target-ent_competency`) as Number_of_ent
from data
where `Target-ent_competency` = 1 
group by EducationSector
order by count(`Target-ent_competency`) desc;


#Find out what KeyTrait is most present in targeted ent competency

select KeyTraits, count(KeyTraits) as Number_of_ent
from data
where `Target-ent_competency` = 1
group by KeyTraits
order by count(KeyTraits) desc;


#Number of ent with mental disorder

select count(`Target-ent_competency`) as Number_of_ent, MentalDisorder
from data
where `Target-ent_competency`= 1
group by MentalDisorder;