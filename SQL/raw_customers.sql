------------------------------------------------------------
-- Camada: RAW
-- Tabela: customers
-- Descrição: Importação inicial da tabela customers do dataset Olist
-- Autor: Rodrigo Lima
------------------------------------------------------------

DROP TABLE IF EXISTS raw.customers;

CREATE TABLE raw.customers (
    customer_id TEXT,
    customer_unique_id TEXT,
    customer_zip_code_prefix TEXT,
    customer_city TEXT,
    customer_state TEXT
);
--------------------------------------------------------------
-- Importação dos dados 
--------------------------------------------------------------
COPY raw.customers
FROM 'C:/Users/user/OneDrive/Desktop/pessoal/PROJETOS/02-   
olist-ecommerce-data-warehouse/DATA/olist_customers_dataset.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ','
);      
----------------------------------------------------------------------
-- Consulta de validação
----------------------------------------------------------------------


SELECT COUNT(*) FROM raw.customers;

SELECT * FROM raw.customers LIMIT 10;

