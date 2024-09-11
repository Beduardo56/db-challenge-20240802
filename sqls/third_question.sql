-- Listar os Produtos sem Estoque;
WITH products_quantity AS (
    SELECT
        product_id,
        SUM(quantity) AS quantity
    FROM
        stocks
    GROUP BY
        product_id)
SELECT
    products.product_id,
    products.product_name AS "Produto",
    brand.brand_name AS "Marca",
    products.model_year AS "Ano do modelo"
FROM
    products_quantity
    LEFT JOIN products ON products_quantity.product_id = products.id
    LEFT JOIN brands ON products.brand_id = brands.id
WHERE
    products_quantity.quantity = 0
