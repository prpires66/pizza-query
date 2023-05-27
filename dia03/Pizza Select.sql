-- Databricks notebook source
SELECT descItem, count(*) AS qtdPedido
FROM silver.pizza_query.item_pedido
WHERE descTipoItem = 'borda'
GROUP BY descItem
ORDER BY qtdPedido DESC
LIMIT 1


-- COMMAND ----------

SELECT descItem, count(*) as qtdPedido
FROM silver.pizza_query.item_pedido
WHERE descTipoItem = 'massa'
GROUP BY descItem
ORDER BY qtdPedido DESC
LIMIT 1

-- COMMAND ----------

SELECT descItem, count(*) as qtdPedido
FROM silver.pizza_query.item_pedido
WHERE descItem LIKE '%queijo%'
GROUP BY descItem
ORDER BY qtdPedido DESC
LIMIT 1


-- COMMAND ----------



-- COMMAND ----------

 SELECT * FROM ((SELECT descItem, count(*) AS qtdPedido
FROM silver.pizza_query.item_pedido
WHERE descTipoItem = 'borda'
GROUP BY descItem
ORDER BY qtdPedido DESC
LIMIT 1)

UNION ALL

(SELECT descItem, count(*) as qtdPedido
FROM silver.pizza_query.item_pedido
WHERE descTipoItem = 'massa'
GROUP BY descItem
ORDER BY qtdPedido DESC
LIMIT 1)

UNION ALL

(SELECT descItem, count(*) as qtdPedido
FROM silver.pizza_query.item_pedido
WHERE descItem LIKE '%queijo%'
GROUP BY descItem
ORDER BY qtdPedido DESC
LIMIT 1)) AS  t1
LEFT JOIN silver.pizza_query.produto AS t2
ON t1.descItem = t2.descItem
