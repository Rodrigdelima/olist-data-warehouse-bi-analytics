--------------------------------------------------------------------
-- Camada: ANALYTICS
-- View: vw_performance_logistica
-- Descrição: Análise de performance logística e comercial por estado
--------------------------------------------------------------------
CREATE OR REPLACE VIEW analytics.vw_performance_logistica AS
SELECT 
    -- Usamos a data_sk para o eixo de tempo
    data_sk,
    -- Calculamos a média do Lead Time que já criamos na Fato
    AVG(lead_time_dias) AS media_lead_time,
    -- Calculamos a porcentagem de pedidos atrasados
    ROUND(SUM(pedido_atrasado)::DECIMAL / COUNT(order_id) * 100, 2) AS taxa_atraso_percentual,
    -- Somamos o frete total
    SUM(frete_total) AS custo_frete_total
FROM dw.fato_pedidos
GROUP BY data_sk;

----------------------------------------------------------------
-- validação
-- quantidade total de registros
SELECT COUNT(*) FROM analytics.vw_performance_logistica;
-- visualizando os dados
SELECT * FROM analytics.vw_performance_logistica
LIMIT 10;
-- verificando a receita total
SELECT SUM(custo_frete_total) FROM analytics.vw_performance_logistica;
-- verificando a média do lead time
SELECT AVG(media_lead_time) FROM analytics.vw_performance_logistica;
-- verificando a taxa de atraso média
SELECT AVG(taxa_atraso_percentual) FROM analytics.vw_performance_logistica;
-- verificando a correlação entre lead time e taxa de atraso
SELECT 
    media_lead_time, 
    taxa_atraso_percentual
FROM analytics.vw_performance_logistica
WHERE media_lead_time IS NOT NULL AND taxa_atraso_percentual IS NOT NULL
ORDER BY media_lead_time DESC
LIMIT 100;
-- verificando a correlação entre custo de frete e taxa de atraso
SELECT 
    custo_frete_total, 
    taxa_atraso_percentual
FROM analytics.vw_performance_logistica
WHERE custo_frete_total IS NOT NULL AND taxa_atraso_percentual IS NOT NULL
ORDER BY custo_frete_total DESC
LIMIT 100;
-- verificando a correlação entre custo de frete e média do lead time
SELECT 
    custo_frete_total, 
    media_lead_time
FROM analytics.vw_performance_logistica
WHERE custo_frete_total IS NOT NULL AND media_lead_time IS NOT NULL
ORDER BY custo_frete_total DESC
LIMIT 100;
-- verificando a distribuição do lead time
SELECT 
    media_lead_time, 
    COUNT(*) AS quantidade
FROM analytics.vw_performance_logistica
WHERE media_lead_time IS NOT NULL
GROUP BY media_lead_time
ORDER BY media_lead_time;


