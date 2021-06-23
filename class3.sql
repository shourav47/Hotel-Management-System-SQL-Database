--sub Query
--1. select the visitor first name & last name who have spent greater than 2000 and also use alaising
SELECT v.ff_name,v.ll_name
FROM visitor v
WHERE v.code IN(
    SELECT t.code 
    FROM transactions t
    WHERE t.total_bill>1500
);

--2. Use Union ALL to select the visitor first name & last name who have spent greater than 2000
SELECT ff_name,ll_name
FROM visitor 
UNION ALL
SELECT v.ff_name,v.ll_name
FROM visitor v
WHERE v.code IN(
    SELECT t.code 
    FROM transactions t
    WHERE t.total_bill>1500
);

--3.USE UNION to select the visitor first name & last name who have spent greater than 2000
SELECT ff_name,ll_name
FROM visitor 
UNION 
SELECT v.ff_name,v.ll_name
FROM visitor v
WHERE v.code IN(
    SELECT t.code 
    FROM transactions t
    WHERE t.total_bill>1500
);

--3.USE INTERSECTION to select the visitor first name & last name who have spent greater than 2000
SELECT ff_name,ll_name
FROM visitor 
INTERSECT
SELECT v.ff_name,v.ll_name
FROM visitor v
WHERE v.code IN(
    SELECT t.code 
    FROM transactions t
    WHERE t.total_bill>1500
);


