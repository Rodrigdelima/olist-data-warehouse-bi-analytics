--------------------------------------------------------------------
-- Camada: ANALYTICS
-- View: vw_performance_logistica
-- Descrição: Análise de performance logística e comercial por estado
--------------------------------------------------------------------

CREATE OR REPLACE VIEW analytics.vw_performance_logistica AS

SELECT

c.customer_state,

COUNT(DISTINCT f.order_id) AS total_pedidos,

SUM(f.receita_total) AS receita_total,

SUM(f.frete_total) AS frete_total,

ROUND(AVG(f.lead_time_dias)::numeric,2) AS lead_time_medio,

ROUND(AVG(f.review_score)::numeric,2) AS avaliacao_media,

SUM(
CASE
WHEN f.pedido_atrasado = 1
THEN 1
ELSE 0
END
) AS pedidos_atrasados,

ROUND(
SUM(
CASE
WHEN f.pedido_atrasado = 1
THEN 1
ELSE 0
END
)::numeric
/
COUNT(*) * 100
,2) AS taxa_atraso

FROM dw.fato_pedidos f

LEFT JOIN dw.dim_cliente c
ON f.customer_id = c.customer_id

GROUP BY
c.customer_state;

----------------------------------------------------------------
-- validação
-- quantidade total de registros
SELECT COUNT(*) FROM analytics.vw_performance_logistica;
-- visualizando os dados
SELECT * FROM analytics.vw_performance_logistica
LIMIT 10;
-- verificando a receita total 
SELECT *
FROM analytics.vw_performance_logistica
ORDER BY receita_total DESC;

-- verificando a taxa de atraso por estado 
SELECT customer_state, taxa_atraso
FROM analytics.vw_performance_logistica
ORDER BY taxa_atraso DESC;
-- verificando a relação entre lead time médio e taxa de atraso
SELECT customer_state, lead_time_medio, taxa_atraso
FROM analytics.vw_performance_logistica
ORDER BY lead_time_medio DESC;
-- verificando a relação entre avaliação média e taxa de atraso
SELECT customer_state, avaliacao_media, taxa_atraso
FROM analytics.vw_performance_logistica
ORDER BY avaliacao_media DESC;


