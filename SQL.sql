CREATE DATABASE test;
use test;

/*CREATE TABLE <<NOMBRE DE LA TABLA >>(<<COLUMNAS>>);*/

CREATE TABLE `employees` (
`id` bigint NOT NULL,
`employeeNumber` int(11) NOT NULL,
`lastName` varchar(50) NOT NULL,
`firstName` varchar(50) NOT NULL,
`email` varchar(100) NOT NULL,
`extension` varchar(10) 1NOT NULL,
`officeCode` varchar(10) NOT NULL,
`jobTitle` varchar(50) NOT NULL
)DEFAULT CHARSET=latin1;

ALTER TABLE employees DROP COLUMN extension;

ALTER TABLE employees ADD extension INT;

select*from employees;

INSERT INTO `employees`(`id`,`employeeNumber`,`lastName`,`firstName`,`email`,`officeCode`,`jobTitle`)
VALUES
(1,1001,"Lopez","Marco","marcoxx1@hotmail.com","1","President"),
(2,1002,'Renteria','Alan','alanbtt@hotmail.com','2','VP Marketing');

select*from employees;

use classicmodels;
select*from employees;

SELECT employeeNumber,lastName
FROM employees;

SELECT employeeNumber AS 'Numero de empleado'
FROM employees;

SELECT productName AS 'Producto',
buyPrice AS 'Precio',
buyPrice*1.16 AS 'Precio de venta'
FROM products;

SELECT concat(lastName," ",firstName)
FROM employees;