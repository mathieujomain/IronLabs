use applestore;
#1
select distinct prime_genre from applestore order by prime_genre;
select prime_genre from applestore group by prime_genre order by prime_genre;

#2
select prime_genre, rating_count_tot from applestore
group by rating_count_tot order by rating_count_tot desc
limit 1;

#3
select prime_genre, count(track_name) from applestore
order by count(track_name) desc
limit 1;

#4
select prime_genre, count(track_name) from applestore
group by prime_genre order by count(track_name) 
limit 1;

#5
select track_name, rating_count_tot from applestore
order by rating_count_tot desc
limit 10; 
#7 :Most rated doesn't mean best rated apps. This is just a list with most rating but we don't know if those are good or bad reviews

#6
select track_name, user_rating from applestore
order by user_rating desc
limit 10;
#8: This might not be the best solution given many apps can reach the max level of rating. 
#The result limit is 10 but much more have 5 star rating

#9 : We can't see any common element from those queries

#10
select track_name, user_rating, rating_count_tot from applestore
order by user_rating desc, rating_count_tot desc
limit 3;

#11
select track_name, user_rating, rating_count_tot, price from applestore
where user_rating=5
order by rating_count_tot desc, price;
# We can see that the best apps cost barely 1$ and is very well rated regarding the rating count
# We also can see that there are free apps in this list aswell, meaning that user don't really rely on the price to enjoy, rate an app
# To conclude the price might be a blocker for some users but on average it doesn't make the app better from the user point of view