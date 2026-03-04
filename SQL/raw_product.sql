---------------------------------------------------------------
-- Camada: RAW          
-- Tabela: products
-- Descrição: Importação inicial da tabela products do dataset Olist
-- Autor: Rodrigo Lima
---------------------------------------------------------------


DROP TABLE IF EXISTS raw.products;


CREATE TABLE raw.products (
    product_id TEXT,
    product_category_name TEXT,
    product_name_length INT,
    product_description_length INT,
    product_photos_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT
);
---------------------------------------------------------------
-- Importação dos dados
---------------------------------------------------------------

COPY raw.products
FROM 'C:/Users/user/OneDrive/Desktop/pessoal/PROJETOS/02-olist-ecommerce-data-warehouse/DATA/olist_products_dataset.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ','
);

----------------------------------------------------------------------
-- Consulta de validação        
----------------------------------------------------------------------

SELECT COUNT(*) FROM raw.products;

SELECT * FROM raw.products LIMIT 10;
