SELECT
  FORMAT(MIN(plan.price), 2) AS faturamento_minimo,
  FORMAT(MAX(plan.price), 2) AS faturamento_maximo,
  FORMAT(AVG(plan.price), 2) AS faturamento_medio,
  FORMAT(SUM(plan.price) , 2) AS faturamento_total
FROM
  budget_plans AS plan
  INNER JOIN users ON users.budget_plans_id = plan.plan_id;
