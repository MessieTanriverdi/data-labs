#___________________________________________________
# CHALLENGE 1

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
from AUTHORS

join titleauthor 
on authors.au_id = titleauthor.au_id

join titles 
on titles.title_id = titleauthor.title_id

join publishers 
on publishers.pub_id = titles.pub_id

order by authors.au_id;


#___________________________________________________
# CHALLENGE 2


