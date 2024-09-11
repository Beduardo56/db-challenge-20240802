-- Listar os Produtos que não tenham sido comprados

SELECT
    products.product_id,
    products.product_name AS "Produto",
    brand.brand_name AS "Marca",
    products.model_year AS "Ano do modelo"
FROM 
     products
        LEFT JOIN
     brands
    on products.brand_id=brands.id
WHERE
    products.product_id not in (SELECT distinct product_id from order_items)