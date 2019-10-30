
#Challenge 1
SELECT 
		authors.au_id as 'AUTHOR ID', 
		authors.au_lname as 'LAST NAME', 
        authors.au_fname as 'FIRST NAME', 
        titles.title as 'TITLE', 
        publishers.pub_name as 'PUBLISHER'
        
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titles.title_id = titleauthor.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id;

#Challenge 2
SELECT 
		authors.au_id as 'AUTHOR ID', 
		authors.au_lname as 'LAST NAME', 
        authors.au_fname as 'FIRST NAME', 
        publishers.pub_name as 'PUBLISHER',
        COUNT(titles.title) as 'TITLE COUNT'
        
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titles.title_id = titleauthor.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY publishers.pub_name, authors.au_id;


#Challenge 3
SELECT 
		authors.au_id as 'AUTHOR ID', 
		authors.au_lname as 'LAST NAME', 
        authors.au_fname as 'FIRST NAME',
        SUM(sales.qty) as 'TOTAL'
        
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
			LEFT JOIN titles ON titles.title_id = titleauthor.title_id
						LEFT JOIN sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC
LIMIT 3

#Challenge 4
SELECT 
		authors.au_id as 'AUTHOR ID', 
		authors.au_lname as 'LAST NAME', 
        authors.au_fname as 'FIRST NAME',
        IFNULL(SUM(sales.qty),0) as 'TOTAL'
        
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
			LEFT JOIN titles ON titles.title_id = titleauthor.title_id
						LEFT JOIN sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC
LIMIT 23
