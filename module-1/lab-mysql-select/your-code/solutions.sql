#___________________________________________________
# CHALLENGE 1 Who Have Published What At Where

/*
select titaut.au_id as Author_ID, aut.au_lname as Last_Name, aut.au_fname as First_Name, titles.title as Title, pubs.pub_name as Publisher
from publications.titleauthor titaut, publications.authors aut, publications.titles titles, publications.publishers pubs
where
	titaut.au_id in 
	(select titaut.au_id
	from publications.titleauthor titaut
	join publications.authors aut
	on titaut.au_id = aut.au_id)
		and
	titaut.title_id in 
	(select titaut.title_id
	from publications.titleauthor titaut
	join publications.titles titles
	on titaut.title_id = titles.title_id)
		and
	titles.pub_id in
	(select pubs.pub_id
	from publications.publishers pubs);
*/    
    
select authors.au_id as AUTHOR_ID, authors.au_fname as FIRST_NAME, authors.au_lname as LAST_NAME, titles.title as TITLE, publishers.pub_name as PUBLISHER
from authors

join titleauthor 
on authors.au_id = titleauthor.au_id

join titles 
on titles.title_id = titleauthor.title_id

join publishers 
on publishers.pub_id = titles.pub_id

order by authors.au_id;




#___________________________________________________
# CHALLENGE 2 Who Have Published How Many At Where

# Nombre de titres par publishers

select publishers.pub_name, count(titles.title)
from publishers, titles
where publishers.pub_id = titles.pub_id
group by publishers.pub_name;


# Réponse :

select authors.au_id as AUTHOR_ID, authors.au_lname as LAST_NAME, authors.au_fname as FIRST_NAME, publishers.pub_name as PUBLISHER, count(titles.title) as TITLE_COUNT

from authors

join titleauthor 
on authors.au_id = titleauthor.au_id

join titles 
on titles.title_id = titleauthor.title_id

join publishers 
on publishers.pub_id = titles.pub_id

group by authors.au_id, publishers.pub_name

order by greatest(count(titles.title), authors.au_id) desc; 




#___________________________________________________
# CHALLENGE 3 Best Selling Authors

select authors.au_id as AUTHOR_ID, authors.au_lname as LAST_NAME, authors.au_fname as FIRST_NAME, count(sales.qty) as TOTAL

from AUTHORS

join titleauthor 
on authors.au_id = titleauthor.au_id

join titles 
on titles.title_id = titleauthor.title_id

join sales 
on sales.title_id = titles.title_id

group by authors.au_id

order by count(sales.qty) desc

limit 3;




#___________________________________________________
# CHALLENGE 4 Best Selling Authors Ranking


select authors.au_id as AUTHOR_ID, authors.au_lname as LAST_NAME, authors.au_fname as FIRST_NAME, coalesce(sum(sales.qty), 0) as TOTAL

from AUTHORS

left join titleauthor 
on authors.au_id = titleauthor.au_id

left join titles 
on titles.title_id = titleauthor.title_id

left join sales 
on sales.title_id = titles.title_id

group by authors.au_id

order by sum(sales.qty) desc;



#___________________________________________________
# CHALLENGE Bonus Most Profiting Authors



# bonus avec les advance
select authors.au_id as AUTHOR_ID, authors.au_lname as LAST_NAME, authors.au_fname as FIRST_NAME, sum(sales.qty), count(titles.advance), sum(distinct titles.advance)

from AUTHORS

left join titleauthor 
on authors.au_id = titleauthor.au_id

left join titles 
on titles.title_id = titleauthor.title_id

left join sales 
on sales.title_id = titles.title_id



group by authors.au_id

order by greatest(sum(sales.qty), authors.au_id) desc;

# bonus avec les royalty
select authors.au_fname as FIRST_NAME, sum(sales.qty), titleauthor.royaltyper, titles.royalty, (sum(sales.qty)/100*royalty)/100*royaltyper

from AUTHORS

left join titleauthor 
on authors.au_id = titleauthor.au_id

left join titles 
on titles.title_id = titleauthor.title_id

left join sales 
on sales.title_id = titles.title_id



group by authors.au_id, titleauthor.royaltyper, titles.royalty

order by greatest(sum(sales.qty), authors.au_id) desc;


# bonus avec les royalty
select authors.au_id as AUTHOR_ID, authors.au_lname as LAST_NAME, authors.au_fname as FIRST_NAME, sum(sales.qty / 100 * royalty / 100 * royaltyper) as PROFIT

from AUTHORS

left join titleauthor 
on authors.au_id = titleauthor.au_id

left join titles 
on titles.title_id = titleauthor.title_id

left join sales 
on sales.title_id = titles.title_id

group by authors.au_id, LAST_NAME, FIRST_NAME

order by authors.au_id desc;

# -> il faut ajouter le prix des livres

select authors.au_id as AUTHOR_ID, authors.au_lname as LAST_NAME, authors.au_fname as FIRST_NAME, sum(sales.qty / 100 * royalty / 100 * royaltyper) as PROFIT, sum(distinct titles.advance) as ADVANCE, sum(sales.qty / 100 * royalty / 100 * royaltyper) + sum(distinct titles.advance) as SOMME

from AUTHORS

left join titleauthor 
on authors.au_id = titleauthor.au_id

left join titles 
on titles.title_id = titleauthor.title_id

left join sales 
on sales.title_id = titles.title_id

group by authors.au_id, LAST_NAME, FIRST_NAME

order by authors.au_id desc;
