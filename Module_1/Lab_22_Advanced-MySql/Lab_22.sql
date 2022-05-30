use publications;

# Challenge 1:  Most Profiting Authors
# Step 1: Calculate the royalty of each sale for each author and the advance for each author and publication

select titleauthor.title_id, titleauthor.au_id, 
((titles.advance*titleauthor.royaltyper)/100) as author_Advance, 
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as sales_royalty
from titles
join titleauthor
on titleauthor.title_id=titles.title_id
join sales
on titleauthor.title_id=sales.title_id;

# Step 2: Aggregate the total royalties for each title and author
select title_id, au_id, sum(sales_royalty) as Total_royalties
from (
select titleauthor.title_id, titleauthor.au_id, 
((titles.advance*titleauthor.royaltyper)/100) as author_Advance, 
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as sales_royalty
from titles
join titleauthor
on titleauthor.title_id=titles.title_id
join sales
on titleauthor.title_id=sales.title_id) royalties
group by au_id, title_id;

#Step 3: Calculate the total profits of each author
select au_id, sum(author_Advance + Total_royalties) as profits
from (
select title_id, au_id, sum(sales_royalty) as Total_royalties, author_Advance
from (
select titleauthor.title_id, titleauthor.au_id, 
((titles.advance*titleauthor.royaltyper)/100) as author_Advance, 
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as sales_royalty
from titles
join titleauthor
on titleauthor.title_id=titles.title_id
join sales
on titleauthor.title_id=sales.title_id) royalties
group by au_id, title_id) profit_table
group by au_id
order by profits desc
limit 3;


# Challenge 2: Alternative Solution
create temporary table publications.royalty_advance 
select titleauthor.title_id, titleauthor.au_id, 
titles.advance as author_Advance, 
titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as sales_royalty
from titles
join titleauthor
on titleauthor.title_id=titles.title_id
join sales
on titles.title_id=sales.title_id;

create temporary table publications.sum_royalties
select title_id, au_id, sum(sales_royalty) as Total_royalties 
from royalty_advance
group by au_id, title_id;

select sum_royalties.au_id, sum(Advance + Total_royalties) as profits
from publications.sum_royalties
inner join titles
on sum_royalties.title_id=titles.title_id
inner join authors
on sum_royalties.au_id= authors.au_id
group by au_id
order by profits desc
limit 3;

select * from sum_royalties;
select * from royalty_advance;
drop temporary table royalty_advance;
drop temporary table sum_royalties;


# Challenge 3:

create table most_profiting_authors
select sum_royalties.au_id, sum(Advance + Total_royalties) as profits
from publications.sum_royalties
inner join titles
on sum_royalties.title_id=titles.title_id
inner join authors
on sum_royalties.au_id= authors.au_id
group by au_id
order by profits desc
limit 3;

select * from most_profiting_authors;