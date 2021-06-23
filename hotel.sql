DROP TABLE food_concern;
DROP TABLE transactions;
DROP TABLE room_quality;
DROP TABLE employee_status;
DROP TABLE hotel_employee;
DROP TABLE visitor;

CREATE TABLE visitor(
    code NUMBER(5) PRIMARY KEY,
    ff_name VARCHAR(10),
    ll_name VARCHAR(10),
    contact VARCHAR(10),
    gendar VARCHAR(10),
    booking_date VARCHAR(10),
    leave_date VARCHAR(10)
);

CREATE TABLE hotel_employee(
    employee_id NUMBER(5) PRIMARY KEY,
    empl_name VARCHAR(10),
    allocated_for NUMBER(5),
    FOREIGN KEY(allocated_for) REFERENCES visitor(code) ON DELETE CASCADE
);

CREATE TABLE room_quality(
    rooms_no NUMBER(5) PRIMARY KEY,
    room_status VARCHAR(10),
    member NUMBER(5),
    flr_nmb NUMBER(10) DEFAULT 1,
    FOREIGN KEY(member) REFERENCES visitor(code)
);

CREATE TABLE transactions(
    bill_code NUMBER(5) PRIMARY KEY,
    code NUMBER(5),
    bil_date VARCHAR(10),
    total_bill NUMBER(5) CHECK(total_bill>=500 AND total_bill<=10000),
    payment_details VARCHAR(10),
    FOREIGN KEY(code) REFERENCES visitor(code)
);

CREATE TABLE employee_status(
    emp_st_id NUMBER(5),
    works_details VARCHAR(10),
    job_dept VARCHAR(10),
    PRIMARY KEY(emp_st_id,works_details),
    FOREIGN KEY(emp_st_id) REFERENCES hotel_employee(employee_id) ON DELETE CASCADE
);

CREATE TABLE food_concern(
    order_no NUMBER(5) PRIMARY KEY,
    order_date VARCHAR(10),
    code NUMBER(5),
    food_name VARCHAR(10),
    FOREIGN KEY(code) REFERENCES visitor(code)
);

INSERT INTO visitor VALUES(101,'Rahim','Molla','01716160','M','2021-06-20','2021-06-23');
INSERT INTO visitor VALUES(102,'Karim','Uddin','01716160','M','2021-06-18','2021-06-21');
INSERT INTO visitor VALUES(103,'Basir','Biswas','01716160','M','2021-06-20','2021-06-22');
INSERT INTO visitor VALUES(104,'Rahim','Molla','01716160','M','2021-06-15','2021-06-21');
INSERT INTO visitor VALUES(105,'Hridoy','Zaman','01716160','M','2021-06-17','2021-06-25');

INSERT INTO hotel_employee VALUES(10,'Abul',101);
INSERT INTO hotel_employee VALUES(11,'Babul',101);
INSERT INTO hotel_employee VALUES(12,'Kabul',102);
INSERT INTO hotel_employee VALUES(13,'Hablu',102);
INSERT INTO hotel_employee VALUES(14,'Gabul',103);
INSERT INTO hotel_employee VALUES(15,'Dablu',104);
INSERT INTO hotel_employee VALUES(16,'Mabul',105);

INSERT INTO room_quality VALUES(201,'VIP',101,DEFAULT);
INSERT INTO room_quality VALUES(202,'1st_Class',101,DEFAULT);
INSERT INTO room_quality VALUES(203,'2nd_Class',101,DEFAULT);
INSERT INTO room_quality VALUES(204,'Normal',101,DEFAULT);
INSERT INTO room_quality VALUES(205,'Ac',101,DEFAULT);

INSERT INTO transactions VALUES(1001,101,'2021-06-20',1000,'card');
INSERT INTO transactions VALUES(1002,102,'2021-06-20',1500,'bkash');
INSERT INTO transactions VALUES(1003,103,'2021-06-20',2000,'dbbl');
INSERT INTO transactions VALUES(1004,104,'2021-06-20',2500,'card');
INSERT INTO transactions VALUES(1005,105,'2021-06-20',1500,'nogod');

INSERT INTO employee_status VALUES(10,'rm_mngmnt','management');
INSERT INTO employee_status VALUES(10,'manager','management');
INSERT INTO employee_status VALUES(11,'electric','service');
INSERT INTO employee_status VALUES(12,'food_shef','food');
INSERT INTO employee_status VALUES(15,'waiter','food');

INSERT INTO food_concern VALUES(1,'2021-06-20',101,'pizza');
INSERT INTO food_concern VALUES(2,'2021-06-21',102,'burger');
INSERT INTO food_concern VALUES(3,'2021-06-22',103,'pizza');








