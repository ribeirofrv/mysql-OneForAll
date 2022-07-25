SELECT
  DISTINCT songs.track_name AS cancao,
  COUNT(history.track_id) AS reproducoes
FROM
  history
  INNER JOIN songs on songs.track_id = history.track_id
GROUP BY
  songs.track_name
ORDER BY
  reproducoes DESC,
  `cancao` ASC
LIMIT 2;
