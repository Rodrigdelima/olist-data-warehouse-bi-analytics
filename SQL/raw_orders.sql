--------------------------------------------------------------------
-- Camada: RAW
-- Tabela: orders
-- Descrição: Importação inicial da tabela orders do dataset Olist
-- Autor: Rodrigo Lima
---------------------------------------------------------------------

DROP TABLE IF EXISTS raw.orders;

CREATE TABLE raw.orders (
    order_id TEXT,
    customer_id TEXT,
    order_status TEXT,
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP
);


--------------------------------------------------------------------
-- Carga de dados RAW - orders
-- Fonte: olist_orders_dataset.csv
-- Observação: Arquivo CSV com delimitador vírgula e header
---------------------------------------------------------------------

COPY raw.orders
FROM 'C:/Users/user/OneDrive/Desktop/pessoal/PROJETOS/02-olist-ecommerce-data-warehouse/DATA/olist_orders_dataset.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ','
);



---------------------------------------------------------------------
-- Consulta de validação
---------------------------------------------------------------------

SELECT COUNT(*) FROM raw.orders;

SELECT * FROM raw.orders LIMIT 10;