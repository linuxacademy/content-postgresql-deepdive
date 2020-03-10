------------------------------------------------------------------------
-- Source: Linux Acadamey PostgreSQL Administration Deep Dive Course
-- Author: Landon Fowler
-- Purpose: SQL script for creating the 'acweb' database structures.
--   This is for easily studying the structure information.
--   To recreate the database in full, please use the backup 'acweb.tar.
-- Date Updated: 03/05/2020
------------------------------------------------------------------------

-- Create the database (Commented out as this is done separately in the lab.)
-- CREATE DATABASE acweb;

-- Create the schemas
CREATE SCHEMA sales;
CREATE SCHEMA hr;


-- State Table
CREATE TABLE sales.state (
    state_id SERIAL PRIMARY KEY,
    name VARCHAR (50) NOT NULL
);


-- City Table
CREATE TABLE sales.city (
    city_id SERIAL PRIMARY KEY,
    name VARCHAR (50) NOT NULL,
    state_id INTEGER NOT NULL
);

ALTER TABLE sales.city
ADD CONSTRAINT stfk FOREIGN KEY (state_id) REFERENCES sales.state (state_id);


-- Address Table
CREATE TABLE sales.address (
    addr_id SERIAL PRIMARY KEY,
    address VARCHAR (100),
    address2 VARCHAR (100),
    city_id INTEGER NOT NULL,
    postal_code VARCHAR (30)
);

-- Customer Table
CREATE TABLE sales.customer (
   customer_id SERIAL PRIMARY KEY,
   first_name VARCHAR (50),
   last_name VARCHAR (50),
   addr_id INTEGER,
   email VARCHAR (100) UNIQUE,
   phone VARCHAR (20)
);

ALTER TABLE sales.customer
ADD CONSTRAINT addrfk FOREIGN KEY (addr_id) REFERENCES sales.address (addr_id);


-- Category Table
CREATE TABLE sales.category (
    cat_id SERIAL PRIMARY KEY,
    name VARCHAR (50) UNIQUE,
    description TEXT
);

-- Products Table
CREATE TABLE sales.products (
    id SERIAL PRIMARY KEY,
    name VARCHAR (50),
    cat_id INTEGER NOT NULL,
    color VARCHAR (50),
    description TEXT,
    price NUMERIC(6,2)
);

ALTER TABLE sales.products
ADD CONSTRAINT catfk FOREIGN KEY (cat_id) REFERENCES sales.category (cat_id);

-- Payment Table
CREATE TABLE sales.payment (
    payment_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    amount numeric(6,2) NOT NULL,
    payment_date timestamp without time zone NOT NULL
);

ALTER TABLE sales.payment
ADD CONSTRAINT custfk FOREIGN KEY (customer_id) REFERENCES sales.customer (customer_id);

-- Staff Table
CREATE TABLE hr.staff (
    staff_id SERIAL PRIMARY KEY,
    first_name VARCHAR (50),
    last_name VARCHAR (50),
    addr_id INTEGER,
    email VARCHAR (100) UNIQUE,
    phone VARCHAR (20),
    active boolean DEFAULT true NOT NULL,
    username VARCHAR (50) NOT NULL
);

ALTER TABLE hr.staff
ADD CONSTRAINT addrfk FOREIGN KEY (addr_id) REFERENCES sales.address (addr_id);