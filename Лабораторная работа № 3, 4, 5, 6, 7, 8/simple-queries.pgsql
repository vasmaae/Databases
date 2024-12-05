-- a. вывести набор строк, удовлетворяющих определенному условию
SELECT
    *
FROM
    Contract
WHERE
    ConcluslonDate > '2023-01-05'
    AND PaymentAmount > 30000
    AND paymentamount < 50000;

-- b. вывести набор строк, отсортированных по определенному полю по возрастанию и по убыванию
SELECT
    *
FROM
    Customer
ORDER BY
    Name ASC;

SELECT
    *
FROM
    Contract
ORDER BY
    ConcluslonDate DESC;

-- c. продемонстрировать результат группировки
SELECT
    Status,
    COUNT(*) AS ContractCount
FROM
    Contract
GROUP BY
    Status;

-- d. Продемонстрировать работу с операторами обработки атрибутов текста
SELECT
    REPLACE(Name, 'а', 'о') AS ModifiedName
FROM
    Executor;

-- e. Продемонстрировать работу с операторами обработки атрибутов даты
SELECT
    ConcluslonDate,
    Deadline,
    extract(DAY FROM (deadline - concluslondate)) AS DaysLeft
    -- deadline - concluslondate as DayLeft
FROM
    Contract;

