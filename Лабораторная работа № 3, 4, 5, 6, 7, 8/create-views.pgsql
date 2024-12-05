-- a. Сложный синтаксис
CREATE VIEW junior_executors AS
SELECT
    e.id,
    p.type AS position_type,
    e.name
FROM
    Executor e
    JOIN Position p ON e.positionid = p.id
WHERE
    e.positionid =(
        SELECT
            id
        FROM
            Position
        WHERE
            type = 'Junior');

-- b. Скрытие столбцов и строк.
CREATE VIEW expensivest_contract_amounts AS
SELECT
    c.id,
    cat.type AS category_type,
    c.paymentamount
FROM
    Contract c
    JOIN Category cat ON c.categoryid = cat.id
WHERE
    c.paymentamount >(
        SELECT
            AVG(paymentamount)
        FROM
            Contract);

-- a. demo
SELECT
    *
FROM
    junior_executors;

-- b. demo
SELECT
    *
FROM
    expensivest_contract_amounts;

