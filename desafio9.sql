SELECT
  COUNT(history.track_id) AS quantidade_musicas_no_historico
FROM
  history
  JOIN users ON users.user_id = history.user_id
WHERE
  users.user_name = "Bill";
