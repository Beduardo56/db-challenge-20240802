-- Listar os Funcionarios que não estejam relacionados a um Pedido.
SELECT
    staffs.staff_id
    concat(staffs.first_name, " ", staffs.last_name) AS "Nome do vendedor",
    staffs.phone AS "Telefone",
    staffs.email AS "Email"
FROM
    staffs
WHERE
    staffs.staff_id NOT IN (SELECT distinct staff_id from orders) AND
    staffs.active=1