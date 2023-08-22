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

-- create customer table 
CREATE TABLE customer (
    customer_id     	  INT           NOT NULL  AUTO_INCREMENT,
    customer_email		  VARCHAR(75)   NOT NULL,
    customer_first_name   VARCHAR(75)   NOT NULL,
    customer_last_name    VARCHAR(75)   NOT NULL,
    customer_phone		  VARCHAR(75)   NOT NULL,   
    customer_password	  VARCHAR(75)   NOT NULL,
     
    PRIMARY KEY(customer_id)
);
-- create reservation table
CREATE TABLE reservation (
    reservation_id      INT           NOT NULL  AUTO_INCREMENT,
    customer_id         INT           NOT NULL,
    room_size           VARCHAR(75)   NOT NULL,
    number_of_guest     VARCHAR(75)   NOT NULL,
    check_in_date       DATE          NOT NULL,
    check_out_date      DATE          NOT NULL,
    number_of_night     INT           NOT NULL,
    total_cost          INT           NOT NULL,
    
    PRIMARY KEY(reservation_id),

    CONSTRAINT fk_customer
    FOREIGN KEY(customer_id)
    REFERENCES customer(customer_id)
);

-- Create room_size table
CREATE TABLE room_size(
	room_size_id INT AUTO_INCREMENT,
    room_size VARCHAR(75) NOT NULL,
    
    PRIMARY KEY(room_size_id)
);

-- populate customer table
INSERT INTO customer (customer_email, customer_first_name, customer_last_name, customer_phone, customer_password)
VALUES('DavidMartina@gmail.com', 'David', 'Martina ','309 501 4452',  'DavidM@2232');
INSERT INTO customer (customer_email, customer_first_name, customer_last_name, customer_phone, customer_password)
VALUES('MariaMartinez@gmail.com', 'Maria', 'Martinez','309 305 1142',  'Martinez_2023');
INSERT INTO customer (customer_email, customer_first_name, customer_last_name, customer_phone, customer_password)
VALUES('MichaelGarcia@yahoo.com', 'Michael', 'Garcia','309 492 4132',  'Michael@65');

-- populate reservation table
INSERT INTO reservation (customer_id, room_size, number_of_guest, check_in_date, check_out_date, number_of_night, total_cost)
VALUES ();
INSERT INTO reservation (customer_id, room_size, number_of_guest, check_in_date, check_out_date, number_of_night, total_cost)
VALUES ();
INSERT INTO reservation (customer_id, room_size, number_of_guest, check_in_date, check_out_date, number_of_night, total_cost)
VALUES ();

-- populate room_size table
INSERT INTO room_size (room_size_id, room_size) VALUES (1, 'Double Full Beds');
INSERT INTO room_size (room_size_id, room_size) VALUES (1, 'Queen Bed');
INSERT INTO room_size (room_size_id, room_size) VALUES (1, 'Double Full Beds');
INSERT INTO room_size (room_size_id, room_size) VALUES (1, 'King Bed');