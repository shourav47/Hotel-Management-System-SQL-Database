SELECT * FROM tab;
SELECT * FROM visitor;
SELECT * FROM hotel_employee;
SELECT * FROM room_quality;
SELECT * FROM transactions;
SELECT * FROM employee_status;
SELECT * FROM food_concern;

SELECT ff_name,ll_name FROM visitor WHERE code = 101;

ALTER TABLE food_concern
ADD food_price VARCHAR(10);
DESCRIBE food_concern;

ALTER TABLE food_concern
MODIFY food_price NUMBER(10);
DESCRIBE food_concern;

ALTER TABLE food_concern
DROP COLUMN food_price;
DESCRIBE food_concern;