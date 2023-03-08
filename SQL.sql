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

SELECT employeeNumber,
email, concat_ws('_',firstName,LastName) as 'Nombre completo'
FROM employees;
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

SELECT * FROM employees;

SELECT *
FROM employees
WHERE employeeNumber > 1200;

SELECT *
FROM employees
WHERE employeeNumber = 1611;

SELECT * 
FROM employees
WHERE jobTitle = 'Sales Rep' AND officeCode = 1;

SELECT * 
FROM employees
WHERE jobTitle = 'Sales Rep' AND officeCode != 1;

SELECT employeeNumber AS 'Numero de empleado', concat_ws('_',lastName,firstName) AS 'Empleado' 
FROM employees
WHERE employeeNumber > 1000 AND employeeNumber <= 2000;

SELECT *
FROM employees
WHERE jobTitle='Sales Rep' AND reportsTo=1143;

SELECT *
FROM employees
WHERE reportsTo=1002 AND firstName!='Jeff';

/*Selecciona todos los empleados que esten en 2 y 3*/
SELECT officeCode,employeeNumber,lastName,firstName
FROM employees
WHERE employees.officeCode in (2,3);

/*Selecciona nombres que empiecen por S*/
SELECT officeCode,employeeNumber,lastName,firstName
FROM employees
WHERE firstName LIKE '%S%';

/*Esta expresion es incorrecta*/
SELECT officeCode,employeeNumber,lastName,firstName
FROM employees
WHERE reportsTo = NULL;

SELECT officeCode,employeeNumber,lastName,firstName
FROM employees
WHERE reportsTo IS NULL;

SELECT * 
FROM employees
WHERE reportsTo = 1143
ORDER BY lastName;

SELECT employeeNumber, concat_ws('_',lastName,firstName) AS 'Nombre completo', jobTitle AS 'Area de trabajo'
FROM employees
WHERE jobTitle = 'Sales Rep'
ORDER BY employeeNumber;

SELECT * 
FROM employees
WHERE reportsTo = 1143
ORDER BY lastName desc;

/*Selecciona el codigo */
SELECT MAX(officeCode) AS 'Oficina mayor'
FROM employees;
SELECT officeCode AS 'Oficina mayor'
FROM employees
ORDER BY officeCode desc;

select COUNT(*)
FROM employees;

select COUNT(*)
FROM employees
WHERE reportsTo = 1143;

SELECT COUNT(DISTINCT officeCode) FROM employees;

SELECT * 
FROM employees
ORDER BY officeCode;

SELECT officeCode,COUNT(employeeNumber)
FROM employees
GROUP BY officeCode;