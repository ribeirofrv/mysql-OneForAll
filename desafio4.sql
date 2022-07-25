SELECT
  DISTINCT users.user_name AS usuario,
  IF (
    MAX(YEAR(history.reproduction_date) = '2021'),
    'Usuário ativo',
    'Usuário inativo'
  ) AS condicao_usuario
FROM
  history
  INNER JOIN users ON users.user_id = history.user_id
GROUP BY
  users.user_name
ORDER BY
  `usuario` ASC;
