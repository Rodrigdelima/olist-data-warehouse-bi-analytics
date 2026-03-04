----------------------------------------------------------------
-- Camada: RAW
-- Tabela: order_reviews
-- Descrição: Importação inicial da tabela order_reviews do dataset Olist
-- Autor: Rodrigo Lima
----------------------------------------------------------------

DROP TABLE IF EXISTS raw.order_reviews;

CREATE TABLE raw.order_reviews (
    review_id TEXT,
    order_id TEXT,
    review_score INT,
    review_comment_title TEXT,
    review_comment_message TEXT,
    review_creation_date TIMESTAMP,
    review_answer_timestamp TIMESTAMP
);

----------------------------------------------------------------
-- Importação dos dados
----------------------------------------------------------------

COPY raw.order_reviews
FROM 'C:/Users/user/OneDrive/Desktop/pessoal/PROJETOS/02-olist-ecommerce-data-warehouse/DATA/olist_order_reviews_dataset.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ','
);

----------------------------------------------------------------------
-- Consulta de validação
----------------------------------------------------------------------

SELECT COUNT(*) FROM raw.order_reviews;

SELECT * FROM raw.order_reviews LIMIT 10;
