use publications;

# Challenge 1: Who Have Published What At Where?

select authors.au_id as AUTHOR_ID, authors.au_lname as LAST_NAME, authors.au_fname as FIRST_NAME, titles.title as TITLE, publishers.pub_name as PUBLISHER
from authors
	join titleauthor
	on authors.au_id = titleauthor.au_id
		join titles
		on titleauthor.title_id = titles.title_id
			join publishers
			on publishers.pub_id = titles.pub_id
order by authors.au_id;


# Challenge 2: Who Have Published How Many At Where?

select authors.au_id as AUTHOR_ID, authors.au_lname as LAST_NAME, authors.au_fname as FIRST_NAME,  publishers.pub_name as PUBLISHER, count(titles.title) as TITLE_COUNT
from authors
	join titleauthor
	on authors.au_id = titleauthor.au_id
		join titles
		on titleauthor.title_id = titles.title_id
			join publishers
			on publishers.pub_id = titles.pub_id
group by authors.au_id, publishers.pub_id
order by authors.au_id desc;


# Challenge 3:  Best Selling Authors

select authors.au_id as AUTHOR_ID, authors.au_lname as LAST_NAME, authors.au_fname as FIRST_NAME, count(sales.title_id) as TOTAL
from authors
	join titleauthor
	on authors.au_id = titleauthor.au_id
		join sales
		on sales.title_id = titleauthor.title_id
			
group by authors.au_id
order by count(sales.title_id) desc
limit 3;


# Challenge 4: Best Selling Authors Ranking

select authors.au_id as AUTHOR_ID, authors.au_lname as LAST_NAME, authors.au_fname as FIRST_NAME, count(sales.title_id) as TOTAL
from authors
	left join titleauthor
	on authors.au_id = titleauthor.au_id
		left join sales
		on sales.title_id = titleauthor.title_id
			
group by authors.au_id
order by count(sales.title_id) desc;