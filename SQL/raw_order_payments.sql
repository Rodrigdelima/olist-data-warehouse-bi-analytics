----------------------------------------------------------------
-- Camada: RAW
-- Tabela: order_payments
-- Descrição: Importação inicial da tabela order_payments do dataset Olist
-- Autor: Rodrigo Lima
----------------------------------------------------------------


DROP TABLE IF EXISTS raw.order_payments;

CREATE TABLE raw.order_payments (
    order_id TEXT,
    payment_sequential INT,
    payment_type TEXT,
    payment_installments INT,
    payment_value NUMERIC(10,2)
);

---------------------------------------------------------------
-- Importação dos dados
---------------------------------------------------------------


COPY raw.order_payments
FROM 'C:/Users/user/OneDrive/Desktop/pessoal/PROJETOS/02-olist-ecommerce-data-warehouse/DATA/olist_order_payments_dataset.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ','
);


----------------------------------------------------------------------
-- Consulta de validação
----------------------------------------------------------------------

SELECT COUNT(*) FROM raw.order_payments;

SELECT * FROM raw.order_payments LIMIT 10;
