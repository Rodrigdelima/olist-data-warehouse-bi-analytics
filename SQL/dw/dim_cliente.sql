--------------------------------------------------------------------
-- Camada: DW
-- Tabela: dim_cliente
-- Descrição: Dimensão de clientes com dados de localização
--------------------------------------------------------------------

DROP TABLE IF EXISTS dw.dim_cliente;

CREATE TABLE dw.dim_cliente AS
SELECT 
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix,
    customer_city,
    customer_state
FROM raw.customers;

--------------------------------------------------------------------
-- Validação
--------------------------------------------------------------------

SELECT COUNT(*) FROM dw.dim_cliente;

SELECT * FROM dw.dim_cliente LIMIT 10;