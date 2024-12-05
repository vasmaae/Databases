CREATE OR REPLACE PROCEDURE add_category(category_type varchar(50))
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO category(type)
        VALUES(category_type);
END;
$$;

CALL add_category('Coś nowego');

SELECT
    *
FROM
    category;

DELETE FROM category
WHERE id > 2;

CREATE OR REPLACE FUNCTION get_average_payment_amount(category_id integer)
    RETURNS numeric
    AS $$
DECLARE
    avg_payment numeric;
BEGIN
    SELECT
        avg(paymentamount) INTO avg_payment
    FROM
        contract
    WHERE
        categoryid = category_id;
    RETURN avg_payment;
END;
$$
LANGUAGE plpgsql;

SELECT
    get_average_payment_amount(1),
    get_average_payment_amount(2);
