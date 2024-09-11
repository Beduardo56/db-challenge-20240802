-- Agrupar a quantidade de vendas que uma determinada Marca por Loja.

-- Quantidade de produtos de uma marca que uma loja vendeu.
WITH big_table AS (
SELECT
    orders.store_id,
    products.brand_id,
    SUM(order_items.quantity) AS quantity
FROM
    order_items
    LEFT JOIN orders ON order_items.order_id=orders.order_id
    LEFT JOIN products on order_items.product_id = products.id
GROUP BY
orders.store_id,
products.brand_id
)
SELECT
    stores.store_name AS "Nome da Loja",
    brands.brand_name AS "Nome da Marca",
    big_table.quantity AS "Quantidade de produtos vendidos"
FROM
    big_table
    LEFT JOIN brands ON big_table.brand_id=brands.brand_id
    LEFT JOIN stores ON big_table.store_id=stores.store_id;
