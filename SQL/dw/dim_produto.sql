--------------------------------------------------------------------
-- Camada: DW
-- Tabela: dim_produto
-- Descrição: Dimensão de produtos
--------------------------------------------------------------------

DROP TABLE IF EXISTS dw.dim_produto;

CREATE TABLE dw.dim_produto AS
SELECT
    product_id,
    product_category_name,
    product_weight_g,
    product_length_cm,
    product_height_cm,
    product_width_cm
FROM raw.products;

----------------------------------------------------------------
-- validação
-- quantidade total de registros
SELECT COUNT(*) FROM dw.dim_produto;
-- quantidade de produtos únicos
SELECT * 
FROM dw.dim_produto
LIMIT 10;
-- Verificando se há produtos com categorias duplicadas
SELECT product_id, COUNT(*)
FROM dw.dim_produto
GROUP BY product_id
HAVING COUNT(*) > 1;
-- Verificando a quantidade de categorias nulas
SELECT 
    product_category_name, 
    COUNT(*) as total
FROM dw.dim_produto
WHERE product_category_name IS NULL
GROUP BY 1;
-- Verificando se os nulos têm algum padrão de peso ou tamanho
SELECT 
    AVG(product_weight_g) as peso_medio,
    COUNT(*) as qtd
FROM dw.dim_produto
WHERE product_category_name IS NULL;