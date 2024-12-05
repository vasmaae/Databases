-- Функция изменения статуса по проценту завершения
CREATE OR REPLACE FUNCTION change_status()
    RETURNS TRIGGER
    AS $$
BEGIN
    IF NEW.completion = 0 THEN
        NEW.status = 'Новый';
    ELSIF NEW.completion = 100 THEN
        NEW.status = 'Завершен';
    ELSE
        NEW.status = 'В процессе';
    END IF;
    RETURN new;
END;
$$
LANGUAGE plpgsql;

-- Триггер на изменение статуса по проценту завершения
CREATE TRIGGER update_contract_status
    BEFORE UPDATE ON contract
    FOR EACH ROW
    WHEN(NEW.completion IS DISTINCT FROM OLD.completion)
    EXECUTE FUNCTION change_status();

--------------------------------------- demo1
UPDATE
    contract
SET
    completion = 100
WHERE
    id = 2;

SELECT
    id,
    completion,
    status
FROM
    contract
WHERE
    id = 2;

--------------------------------------- demo1
CREATE OR REPLACE FUNCTION check_contact()
    RETURNS TRIGGER
    AS $$
BEGIN
    IF NEW.contact IS NULL OR length(NEW.contact) != 12 OR
    LEFT(NEW.contact,
    1) != '+' THEN
        RAISE EXCEPTION 'Неправильный номер телефона';
    END IF;
    RETURN new;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER check_customer_contact
    BEFORE INSERT OR UPDATE ON customer
    FOR EACH ROW
    EXECUTE FUNCTION check_contact();

UPDATE
    customer
SET
    contact = '+79912345661'
WHERE
    id = 1;

SELECT
    id,
    name,
    contact
FROM
    customer
WHERE
    id = 1;

