-- Listar todos Clientes que não tenham realizado uma compra;
SELECT
    customers.customer_id,
    concat(customers.first_name, " ", customers.last_name) AS "Nome do Cliente",
    customers.phone AS "Telefone",
    customers.email AS "Email",
    concat(customers.street, '-', customers.state) AS "Endereço",
    customers.zip_code AS "CEP"
FROM customers
WHERE
    customers.customer_id not in (SELECT distinct customer_id from orders)

