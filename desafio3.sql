SELECT
  users.user_name AS usuario,
  COUNT(history.user_id = users.user_id) AS qtde_musicas_ouvidas,
  ROUND(SUM(songs.duration_sec)/60, 2) AS total_minutos
FROM
  history
  INNER JOIN songs ON songs.track_id = history.track_id
  JOIN users ON users.user_id = history.user_id
GROUP BY
  users.user_name
ORDER BY
  `usuario` ASC;
