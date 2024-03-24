select * from album;

select * from employee
order by levels desc
limit 1 

select count(*), billing_country
	from invoice
    group by billing_country 
    order by count desc 

select total from invoice
order by total desc 
limit 3 

select sum(total) as invoice_total, billing_city 
	from invoice
group by billing_city
order by invoice_total desc 

select customer.customer_id, customer.first_name, customer.last_name, sum(invoice.total) as total 
from customer 
join invoice on customer.customer_id = invoice.customer_id 
group by customer.customer_id 
order by total desc 
limit 1 

select distinct email, first_name, last_name
from customer 
join invoice on customer.customer_id = invoice.customer_id 
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
where track_id in(
select track_id from track 
join genre on track.genre_id = genre.genre_id
where genre.name like 'Rock'	
)
order by email;

SELECT artist.artist_id, artist.name,COUNT(artist.artist_id) AS number_of_songs
FROM track
JOIN album ON album.album_id = track.album_id
JOIN artist ON artist.artist_id = album.artist_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name LIKE 'Rock'
GROUP BY artist.artist_id
ORDER BY number_of_songs DESC
LIMIT 10;

SELECT name,milliseconds
FROM track
WHERE milliseconds > (
	SELECT AVG(milliseconds) AS avg_track_length
	FROM track )
ORDER BY milliseconds DESC;




