SELECT
  s.track_name AS nome_musica,
  CASE
    WHEN s.track_name LIKE '%Streets' 
    	THEN REPLACE (s.track_name, 'Streets', 'Code Review')
    WHEN s.track_name LIKE '%Her Own'
    	THEN REPLACE (s.track_name, 'Her Own', 'Trybe')
    WHEN s.track_name LIKE '%Inner Fire'
    	THEN REPLACE (s.track_name, 'Inner Fire', 'Project')
    WHEN s.track_name LIKE '%Silly'
    	THEN REPLACE (s.track_name, 'Silly', 'Nice')
    WHEN s.track_name LIKE '%Circus'
    	THEN REPLACE (s.track_name, 'Circus', 'Pull Request')
  END AS novo_nome
FROM
  songs AS s
ORDER BY
  novo_nome ASC
LIMIT 5 OFFSET 35;
