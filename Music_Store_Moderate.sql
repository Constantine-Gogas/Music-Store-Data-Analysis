--[1]---Rock Music Listeners---------------------------------------

Select distinct c.email, c.first_name, c.last_name
From track as t join genre as g
on t.genre_id = g.genre_id join invoice_line as l 
on t.track_id = l.track_id join invoice as i
on i.invoice_id = l.invoice_id join customer as c
on c.customer_id = i.customer_id
where g.name like 'Rock'
order by c.email asc

--------------------------------------------------------------
--[2]---Top 10 rock Bands artists--------------------------------

Select TOP 10 ar.artist_id ,ar.name, count(*) as number_of_songs 
From artist as ar join album as al
on ar.artist_id = al.artist_id join track as t
on t.album_id = al.album_id join genre as g
on g.genre_id = t.genre_id
where g.name like 'Rock'
group by ar.name , ar.artist_id
order by number_of_songs desc

--------------------------------------------------------------
--[3]---Return all the track names that have a song length longer than the average song length---------------

Select name, milliseconds
From track
where milliseconds > (
Select AVG(milliseconds) as avg_track_length
From track 
)
order by milliseconds desc

-------------------------------------------------------------------