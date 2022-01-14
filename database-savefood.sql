USE SaveFood;

CREATE TABLE customer (
  customer_id INT PRIMARY KEY,
  cus_name VARCHAR(40) NOT NULL,
  order_id INT NOT NULL,
  shipper_id INT NOT NULL,
  payment_id INT NOT NULL,
  orders VARCHAR(40) NOT NULL,
  location VARCHAR(20) NOT NULL,
  phone VARCHAR(20)
  );
  
  CREATE TABLE payment (
  paymnet_id INT PRIMARY KEY,
  order_id INT NOT NULL,
  customer_id INT NOT NULL,
  price VARCHAR(20) NOT NULL,
  payment_method VARCHAR(20) NOT NULL
  );
  
 CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  vehicle_id INT NOT NULL,
  payment_id INT NOT NULL,
  customer_id INT NOT NULL,
  shipper_id INT NOT NULL,
  price VARCHAR(20) NOT NULL
  ); 
  
   CREATE TABLE shipper (
  shipper_id INT PRIMARY KEY,
  shipper_name VARCHAR(40) NOT NULL,
  vehicle VARCHAR(20) NOT NULL,
  departure VARCHAR(20) NOT NULL,
  destination VARCHAR(20) NOT NULL,
  vehicle_id INT NOT NULL,
  order_id INT NOT NULL,
  customer_id INT NOT NULL,
  farmer_id INT NOT NULL,
  branch_id INT NOT NULL
  ); 
  
   CREATE TABLE food (
  food_id INT PRIMARY KEY,
  food_name VARCHAR(20) NOT NULL,
  food_type VARCHAR(20) NOT NULL,
  vehicle_id INT NOT NULL,
  shipper_id INT NOT NULL,
  order_id INT NOT NULL,
  customer_id INT NOT NULL,
  farmer_id INT NOT NULL,
  location VARCHAR(20) NOT NULL,
  price VARCHAR(20) NOT NULL
  ); 
  
     CREATE TABLE SaveFood_Branch (
  branch_id INT PRIMARY KEY,
  vehicle VARCHAR(20) NOT NULL,
  vehicle_id INT NOT NULL,
  shipper_id INT NOT NULL,
  order_id INT NOT NULL,
  location VARCHAR(20) NOT NULL
  ); 
  
  CREATE TABLE farmer (
  farmer_id INT PRIMARY KEY,
  vehicle_id INT NOT NULL,
  farmer_name VARCHAR(40) NOT NULL,
  location VARCHAR(40) NOT NULL,
  shipper_id INT NOT NULL,
  food_id INT NOT NULL,
  phone VARCHAR(20)
  );
  
  CREATE TABLE order_details (
  food_id INT,
  order_id INT,
  location VARCHAR(40) NOT NULL,
  ammount VARCHAR(20) NOT NULL,
  PRIMARY KEY(food_id, order_id),
  FOREIGN KEY(food_id) REFERENCES food(food_id) ON DELETE CASCADE,
  FOREIGN KEY(order_id) REFERENCES orders(order_id) ON DELETE CASCADE
);

SET FOREIGN_KEY_CHECKS = 1;
DROP TABLE customer;
DROP TABLE shipper;
DROP TABLE orders;
DROP TABLE order_details;
DROP TABLE food;
DROP TABLE farmer;
DROP TABLE payment;
DROP TABLE SaveFood_Branch;


 ALTER TABLE orders
ADD FOREIGN KEY(shipper_id)
REFERENCES shipper(shipper_id);

  ALTER TABLE payment
ADD FOREIGN KEY(order_id)
REFERENCES orders(order_id);

  ALTER TABLE orders
ADD FOREIGN KEY(customer_id)
REFERENCES customer(customer_id);

  ALTER TABLE shipper
ADD FOREIGN KEY(branch_id)
REFERENCES SaveFood_Branch(branch_id);

  ALTER TABLE food
ADD FOREIGN KEY(farmer_id)
REFERENCES farmer(farmer_id);

SELECT *
FROM customer;

INSERT INTO customer VALUES
(001,  'James Smith', 101, 201, 301, 'order1', 'sukabumi', '+6283283283223'),
(002, 'Stefanie Martin',  102, 202,  302, 'order2', 'majalengka', '+6283283683223'), 
(003, 'Steve Wang', 103, 203, 303, 'order3', 'bekasi', '+6283283283859'),
(004, 'Friederike Müller-Rossi', 104, 204, 304,  'order4', 'depok', '+6283283282390'),
(005, 'Isobel Ivanova', 105, 205,  305, 'order5', 'tanggerang', '+6283283283333');

INSERT INTO food VALUES
(501, 'carrot', 'vegetables', 601, 201, 101, 001, 701, 'sukabumi','+6281283283223'),
(502, 'broccoli', 'vegetables', 602, 202, 101, 002, 702,'majalengka', '+6281283683223'), 
(503, 'apple', 'fruit', 603, 203, 101, 003, 703, 'bekasi','+6281283283859'),
(504, 'grape', 'fruit', 604, 204, 101, 004, 704, 'depok','+6283183282390'),
(505, 'banana', 'fruit', 605, 205, 101, 005, 705, 'tanggerang', '+6281283283333');

INSERT INTO shipper VALUES
(201, 'simon petrus', 'truck1', 'sukabumi','sukabumi', 401, 101, 001, 701, 801),
(202, 'andreas', 'truck2', 'majalengka','majalengka', 402, 102, 002, 702, 802), 
(203, 'yakobus', 'truck3', 'bekasi', 'bekasi', 403, 103, 003, 703, 803),
(204, 'john', 'truck4', 'depok', 'depok', 404, 104, 004, 704, 804),
(205, 'thomas', 'truck5', 'tanggerang', 'tanggerang', 405, 105, 005, 705, 805);

INSERT INTO farmer VALUES
(701, 401, 'matius', 'sukabumi', 201, 501, '+6281283283223'),
(702, 402,  'markus', 'majalengka', 202, 502, '+6281283683223'), 
(703, 403, 'lukas', 'bekasi', 203, 503, '+6281283283859'),
(704, 404, 'yohanes', 'depok', 204, 504, '+6283183282390'),
(705, 405, 'filipus', 'tanggerang', 205, 505, '+6281283283333');

INSERT INTO order_details VALUES
(501, 101, 'sukabumi', 10),
(502, 102,  'majalengka', 20), 
(503, 103, 'bekasi', 30),
(504, 104, 'depok', 40),
(505, 105, 'tanggerang', 50);

INSERT INTO orders VALUES
(101,  401, 301, 001, 201, '150000'),
(102, 402,  302, 002, 202, '200000'), 
(103, 403, 303, 003, 203, '300000'),
(104, 404, 304, 004, 204, '900000'),
(105, 405, 305, 005, 205, '1050000');

INSERT INTO SaveFood_Branch VALUES
(801, 'truck1', 601, 201, 101, 'sukabumi'),
(802, 'truck2', 602, 202, 102, 'majalengka'), 
(803, 'truck3', 603, 203, 103, 'bekasi'),
(804, 'truck4', 604, 204, 104, 'depok'),
(805, 'truck5', 605, 205, 105, 'tanggerang');

INSERT INTO payment VALUES
(301, 101, 001, '150000', 'bank transfer'),
(302, 102, 002, '200000', 'gopay'), 
(303, 103, 003, '300000', 'dana'),
(304, 104, 004, '900000', 'bank transfer'),
(305, 105, 005, '1050000', 'gopay');

SELECT *
FROM customer;

SELECT *
FROM payment;

SELECT *
FROM orders;

SELECT *
FROM order_details;

SELECT *
FROM shipper;

SELECT *
FROM food;

SELECT *
FROM farmer;

SELECT *
FROM SaveFood_Branch;

SELECT *
FROM farmer
WHERE location = 'Sukabumi';

SELECT *
FROM customer
ORDER BY cus_name;

SELECT *
FROM customer
ORDER BY cus_name;

SELECT *
FROM food
WHERE location = 'sukabumi' OR food_type = 'fruit';