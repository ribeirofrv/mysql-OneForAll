SELECT
  artists.artist_name AS artista,
  albums.title AS album
FROM
  artists
  INNER JOIN albums ON albums.artist_id = artists.artist_id
WHERE
  artists.artist_name = "Walter Phoenix";
