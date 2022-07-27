SELECT
  artists.artist_name AS artista,
  albums.title AS album,
  COUNT(followers.user_id) AS seguidores
FROM
  artists
  JOIN albums ON albums.artist_id = artists.artist_id
  JOIN followers ON artists.artist_id = followers.artist_id
GROUP BY
  followers.artist_id,
  albums.title
ORDER BY
  seguidores DESC,
  artista ASC,
  album ASC;
