--[1]---How many songs are in the playlists------------------

Select  p.name, COUNT(*) as tracks_on_playlist
From playlist as p join playlist_track as pt
on p.playlist_id = pt.playlist_id
where p.name not like 'Music' and p.name not like 'Music Videos'
group by p.name
order by tracks_on_playlist desc

--------------------------------------------------------
--[2]---Top 5 artists on the playlist with the most tracks------------------

Select TOP 5 a.name, COUNT(*) as number_of_90sTracks
From playlist as p join playlist_track as pt
on p.playlist_id = pt.playlist_id join track as t
on t.track_id = pt.track_id join album as al
on al.album_id = t.album_id join artist as a
on a.artist_id = al.artist_id
where p.name like '90’s Music'
group by a.name
order by number_of_90sTracks desc

----------------------------------------------------------------
--[3]---Top 10 earning songs of Iron Maiden---------------------

Select TOP 10 t.name, SUM(i.total) as Total_earnings, al.title as Album_name
From artist as a join album as al
on a.artist_id = al.artist_id join track as t
on t.album_id = al.album_id join invoice_line as il
on il.track_id = t.track_id join invoice as i 
on i.invoice_id = il.invoice_id
Where a.name like 'Iron Maiden'
group by t.name, al.title
order by Total_earnings desc

-----------------------------------------------------------------
--[4]---Top 10 earning songs of Metallica---------------------

Select TOP 10 t.name, SUM(i.total) as Total_earnings, al.title as Album_name
From artist as a join album as al
on a.artist_id = al.artist_id join track as t
on t.album_id = al.album_id join invoice_line as il
on il.track_id = t.track_id join invoice as i 
on i.invoice_id = il.invoice_id
Where a.name like 'Metallica'
group by t.name, al.title
order by Total_earnings desc

--[5]---Top 10 earning songs of U2---------------------

Select TOP 10 t.name, SUM(i.total) as Total_earnings, al.title as Album_name
From artist as a join album as al
on a.artist_id = al.artist_id join track as t
on t.album_id = al.album_id join invoice_line as il
on il.track_id = t.track_id join invoice as i 
on i.invoice_id = il.invoice_id
Where a.name like 'U2'
group by t.name, al.title
order by Total_earnings desc

-----------------------------------------------------------------
--[6]---Top 10 earning songs of Eric Clapton---------------------

Select TOP 10 t.name, SUM(i.total) as Total_earnings, al.title as Album_name
From artist as a join album as al
on a.artist_id = al.artist_id join track as t
on t.album_id = al.album_id join invoice_line as il
on il.track_id = t.track_id join invoice as i 
on i.invoice_id = il.invoice_id
Where a.name like 'Eric Clapton'
group by t.name, al.title
order by Total_earnings desc

-----------------------------------------------------------------
--[7]---Top 10 earning songs of Deep Purple---------------------

Select TOP 10 t.name, SUM(i.total) as Total_earnings, al.title as Album_name
From artist as a join album as al
on a.artist_id = al.artist_id join track as t
on t.album_id = al.album_id join invoice_line as il
on il.track_id = t.track_id join invoice as i 
on i.invoice_id = il.invoice_id
Where a.name like 'Deep Purple'
group by t.name, al.title
order by Total_earnings desc

-----------------------------------------------------------------