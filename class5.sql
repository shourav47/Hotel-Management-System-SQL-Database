--Print Maximum visitor code id
SET SERVEROUTPUT ON
DECLARE
max_code_no visitor.code%type;
BEGIN
SELECT MAX(code) INTO max_code_no
FROM visitor;
DBMS_OUTPUT.PUT_LINE('The maximum Visitor Code no is : ' ||
max_code_no);
END;
/

--Print the food order date  of a visitor with a particular name
SET SERVEROUTPUT ON
DECLARE
Date_entered food_concern.order_date%type;
Ordered_by visitor.ff_name%type := 'Karim';
BEGIN
SELECT order_date INTO Date_entered
FROM food_concern, visitor
WHERE visitor.code = food_concern.code AND
ff_name = Ordered_by;
DBMS_OUTPUT.PUT_LINE('food_status: ' || Ordered_by || ' ordered a food in '|| Date_entered);
END;
/

--Find a discount price if the total bill is over 1500 taka
SET SERVEROUTPUT ON
DECLARE
full_price transactions.total_bill%type;
codess NUMBER(5);
discount_price transactions.total_bill%type;
BEGIN
codess := 101;
SELECT total_bill INTO full_price
FROM transactions
WHERE codess like code ;
IF full_price < 1500 THEN
discount_price := (full_price-full_price);
ELSIF full_price >= 1500 and full_price <2500 THEN
discount_price := full_price - (full_price*0.05);
ELSIF full_price >= 2500 and full_price <=4000 THEN
discount_price := full_price - (full_price*0.07);
ELSE
discount_price := full_price - (full_price*0.08);
END IF;
DBMS_OUTPUT.PUT_LINE ('For a visitor with code = ' || codess || ' Full Price is =  '||full_price||' Disounted Price is = '|| ROUND(discount_price,2));
EXCEPTION
WHEN others THEN
DBMS_OUTPUT.PUT_LINE (SQLERRM);
END;
/

--show first 4 visitor with their code & contact no using cursor and loop 
SET SERVEROUTPUT ON
DECLARE
CURSOR visitor_cur IS
SELECT code, contact FROM visitor;
visitor_record visitor_cur%ROWTYPE;
BEGIN
OPEN visitor_cur;
LOOP
FETCH visitor_cur INTO visitor_record;
EXIT WHEN visitor_cur%ROWCOUNT > 4;
DBMS_OUTPUT.PUT_LINE ('Visitors code : ' || visitor_record.code || ' ' ||
visitor_record.contact);
END LOOP;
CLOSE visitor_cur;
END;
/

--show first name of the visitor along with the code using procedure
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE getemp IS
visitor_id visitor.code%type;
fname visitor.ff_name%type;
BEGIN
visitor_id := 101;
SELECT ff_name INTO fname
FROM visitor
WHERE code= visitor_id;
DBMS_OUTPUT.PUT_LINE('First name: '||fname);
END;
/

BEGIN
getemp;
END;
/
