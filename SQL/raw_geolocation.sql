--------------------------------------------------------------
-- Camada: RAW
-- Tabela: geolocation
-- Descrição: Importação inicial da tabela geolocation do dataset Olist
-- Autor: Rodrigo Lima
--------------------------------------------------------------

DROP TABLE IF EXISTS raw.geolocation;

CREATE TABLE raw.geolocation (
    geolocation_zip_code_prefix TEXT,
    geolocation_lat NUMERIC(10,6),
    geolocation_lng NUMERIC(10,6),
    geolocation_city TEXT,
    geolocation_state TEXT
);

---------------------------------------------------------------
-- Importação dos dados
---------------------------------------------------------------

COPY raw.geolocation
FROM 'C:/Users/user/OneDrive/Desktop/pessoal/PROJETOS/02-olist-ecommerce-data-warehouse/DATA/olist_geolocation_dataset.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ','
);

----------------------------------------------------------------------
-- Consulta de validação
----------------------------------------------------------------------

SELECT COUNT(*) FROM raw.geolocation;

SELECT * FROM raw.geolocation LIMIT 10;
