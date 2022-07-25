SELECT
  MAX(songs.track_id) AS cancoes,
  MAX(artists.artist_id) AS artistas,
  MAX(albums.album_id) AS albuns
FROM songs
INNER JOIN artists, albums;
