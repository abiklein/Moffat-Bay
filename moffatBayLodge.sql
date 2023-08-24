/*
    Title: moffat_lodgeSQL.sql
    Team: Silver 
    Author(s): Shayla Bradley, Patrick Ellis, Abigail Klein, Yawa Hallo 
    Professor: Professor Sampson
    Date: August 21, 2023
    Description: Moffat Bay Lodge database
*/

-- Drop database if exists
DROP DATABASE IF EXISTS moffat_lodge;
-- Create database
CREATE DATABASE moffat_lodge;

-- drop database user if exists 
DROP USER 'MoffatLodge'@'localhost';
-- create database user
CREATE USER 'MoffatLodge'@'localhost' IDENTIFIED BY 'MLData';

-- grant user privilege
GRANT ALL ON moffat_lodge.* TO 'MoffatLodge'@'localhost';

-- Drop tables if exist
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS reservation;
DROP TABLE IF EXISTS rooms;
DROP TABLE IF EXISTS guest_price;

-- create customer table 
CREATE TABLE customer (
    customer_id     	  INT           NOT NULL  AUTO_INCREMENT,
    customer_email		  VARCHAR(75)   NOT NULL,
    customer_first_name   VARCHAR(75)   NOT NULL,
    customer_last_name    VARCHAR(75)   NOT NULL,
    customer_phone		  VARCHAR(20)   NOT NULL,   
    customer_password	  VARCHAR(75)   NOT NULL,
     
    PRIMARY KEY(customer_id)
);
-- create reservation table
CREATE TABLE reservation (
    reservation_id      INT           NOT NULL  AUTO_INCREMENT,
    customer_id         INT           NOT NULL,
    room_size_id        INT           NOT NULL,
    number_of_guests    INT           NOT NULL,
    check_in_date       DATE          NOT NULL,
    check_out_date      DATE          NOT NULL,
    total_nights        INT           NOT NULL,
    total_cost          INT           NOT NULL,
    
    PRIMARY KEY(reservation_id),

    CONSTRAINT fk_customer
    FOREIGN KEY(customer_id)
    REFERENCES customer(customer_id)

    CONSTRAINT fk_room
    FOREIGN KEY(room_size_id)
    REFERENCES customer(room_size_id)

    CONSTRAINT fk_guest_price
    FOREIGN KEY(number_of_guests)
    REFERENCES customer(number_of_guests)
);

-- Create room_size table
CREATE TABLE room (
	room_size_id        INT           AUTO_INCREMENT,
    room_size           VARCHAR(20))   NOT NULL,
    
    PRIMARY KEY(room_size_id)
);

-- create guest_price table
CREATE TABLE guest_price (
	number_of_guests	INT			NOT NULL,
    cost				INT			NOT NULL,
    
    PRIMARY KEY(number_of_guests)
);

-- populate customer table
INSERT INTO customer (customer_email, customer_first_name, customer_last_name, customer_phone, customer_password)
VALUES('DavidMartina@gmail.com', 'David', 'Martina ','309 501 4452',  'DavidM@2232');
INSERT INTO customer (customer_email, customer_first_name, customer_last_name, customer_phone, customer_password)
VALUES('MariaMartinez@gmail.com', 'Maria', 'Martinez','309 305 1142',  'Martinez_2023');
INSERT INTO customer (customer_email, customer_first_name, customer_last_name, customer_phone, customer_password)
VALUES('MichaelGarcia@yahoo.com', 'Michael', 'Garcia','309 492 4132',  'Michael@65');

-- populate reservation table
INSERT INTO reservation (customer_id, room_size, number_of_guest, check_in_date, check_out_date, total_nights, total_cost)
VALUES (1, 'Queen Bed', 2, '2023-10-20', '2023-10-22', 2, 345);
INSERT INTO reservation (customer_id, room_size, number_of_guest, check_in_date, check_out_date, total_nights, total_cost)
VALUES (2, 'Double Queen Beds', 5, '2024-01-12', '2024-01-15', 3, 450);
INSERT INTO reservation (customer_id, room_size, number_of_guest, check_in_date, check_out_date, total_nights, total_cost)
VALUES (3,'King Bed', 2, '2023-11-20', '2023-11-26', 6, 690);
INSERT INTO reservation (customer_id, room_size, number_of_guest, check_in_date, check_out_date, total_nights, total_cost)
VALUES (3, 'Double Queen Beds', 3, '2023-11-20', '2023-11-26', 6, 900);

-- populate rooms table
INSERT INTO room (room_size) VALUES ('Double Full Beds');
INSERT INTO room (room_size) VALUES ('Queen Bed');
INSERT INTO room (room_size) VALUES ('Double Queen Beds');
INSERT INTO room (room_size) VALUES ('King Bed');

-- populate guest_price table
INSERT INTO guest_price (number_of_guests, cost) VALUES (1, 115);
INSERT INTO guest_price (number_of_guests, cost) VALUES (2, 115);
INSERT INTO guest_price (number_of_guests, cost) VALUES (3, 150);
INSERT INTO guest_price (number_of_guests, cost) VALUES (4, 150);
INSERT INTO guest_price (number_of_guests, cost) VALUES (5, 150);
