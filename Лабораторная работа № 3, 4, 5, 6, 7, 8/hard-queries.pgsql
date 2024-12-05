-- a. Продемонстрировать работу различных типов соединений
SELECT
    Customer.Name AS CustomerName,
    Contract.ConcluslonDate
FROM
    Customer
    INNER JOIN Contract ON Customer.ID = Contract.CustomerID;

SELECT
    Customer.Name AS CustomerName,
    Contract.ConcluslonDate
FROM
    Customer
    LEFT JOIN Contract ON Customer.ID = Contract.CustomerID;

SELECT
    Customer.Name AS CustomerName,
    Contract.ConcluslonDate
FROM
    Customer
    RIGHT JOIN Contract ON Customer.ID = Contract.CustomerID;

SELECT
    Customer.Name AS CustomerName,
    Contract.ConcluslonDate
FROM
    Customer
    FULL OUTER JOIN Contract ON Customer.ID = Contract.CustomerID;

-- b. Сформировать набор данных из нескольких таблиц (3-х и более) с помощью оператора соединения
SELECT
    Customer.Name AS CustomerName,
    Contract.ConcluslonDate,
    Executor.Name AS ExecutorName,
    Category.Type AS CategoryType
FROM
    Customer
    INNER JOIN Contract ON Customer.ID = Contract.CustomerID
    INNER JOIN Executor ON Contract.ExecutorID = Executor.ID
    INNER JOIN Category ON Contract.CategoryID = Category.ID;

-- c. Продемонстрировать результат группировки данных из нескольких таблиц
SELECT
    Customer.Name AS CustomerName,
    COUNT(Contract.ID) AS ContractCount
FROM
    Customer
    INNER JOIN Contract ON Customer.ID = Contract.CustomerID
GROUP BY
    Customer.Name;

-- d. Выполнение вложенных запросов: сформировать набор данных из нескольких 
-- таблиц с помощью вложенных запросов, имеющий два или более уровней вложенности
SELECT
    Customer.Name AS CustomerName,
    Contract.ConcluslonDate
FROM
    Customer
    INNER JOIN (
        SELECT
            ID,
            CustomerID,
            ConcluslonDate
        FROM
            Contract
        WHERE
            ConcluslonDate > '2023-01-06'
    ) AS Contract ON Customer.ID = Contract.CustomerID;