/*
Questions:
How many tracks does each album have? Your solution should include Album id and its number of tracks sorted from highest to lowest.

Find the album title of the tracks. Your solution should include track name and its album title.

Find the minimum duration of the track in each album. Your solution should include album id, album title and duration of the track sorted from highest to lowest.

Find the total duration of each album. Your solution should include album id, album title and its total duration sorted from highest to lowest.

Based on the previous question, find the albums whose total duration is higher than 70 minutes. Your solution should include album title and total duration.
*/
/*Question_1*/
select AlbumId, count(TrackId)
from tracks
group by AlbumId
order by count(TrackId) DESC;

/*Question_2*/
select tracks.name,
       albums.Title
from tracks
inner join albums
on tracks.AlbumId = albums.AlbumId;

/*Question_3*/
 select albums.AlbumId,
       albums.Title,
       min(tracks.Milliseconds) as duration_of_track
from albums
left join tracks
on albums.AlbumId = tracks.AlbumId
group by albums.AlbumId
order by duration_of_track desc;

/*Question_4*/
select albums.AlbumId, 
       albums.Title,
       Sum(tracks.Milliseconds) as duration
from albums
left join tracks
on albums.AlbumId = tracks.AlbumId
group by albums.AlbumId
order by duration desc;

/*Question_5*/
select albums.Title,
        Sum(tracks.Milliseconds) as duration
from albums
left join tracks
on albums.AlbumId = tracks.AlbumId
group by albums.Title
HAVING SUM(Milliseconds)>4200000;    
