--1. Select all the visitor name with which food they ordered through join
SELECT visitor.code,visitor.ff_name,food_concern.food_name
FROM visitor
JOIN food_concern
ON visitor.code = food_concern.code;

--2. Select all the visitor name with which way they paid the bill through Natural join
SELECT visitor.ff_name,transactions.payment_details
FROM visitor
NATURAL JOIN transactions;

--3. Select all the visitor name with which food they ordered through left join
SELECT visitor.code,visitor.ff_name,food_concern.food_name
FROM visitor
LEFT JOIN food_concern
ON visitor.code = food_concern.code;

--4. Select all the visitor name with which food they ordered through right join
SELECT visitor.code,visitor.ff_name,food_concern.food_name
FROM visitor
RIGHT JOIN food_concern
ON visitor.code = food_concern.code;

--5. Select all the visitor name with which food they ordered through full outer join
SELECT visitor.code,visitor.ff_name,food_concern.food_name
FROM visitor
FULL OUTER JOIN food_concern
ON visitor.code = food_concern.code;

--6. Select all the visitor name with which way they paid the bill through cross join
SELECT v.ff_name,t.payment_details
FROM visitor v
CROSS JOIN transactions t;


