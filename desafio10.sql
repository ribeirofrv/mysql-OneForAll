SELECT
  DISTINCT songs.track_name AS nome,
  COUNT(history.user_id) AS reproducoes
FROM
  history
  JOIN songs ON songs.track_id = history.track_id
  JOIN users ON users.user_id = history.user_id
  JOIN signature_plans ON signature_plans.plan_id = users.signature_plans_id
WHERE
  users.signature_plans_id IN (1, 3)
GROUP BY
  nome
ORDER BY
  nome ASC
