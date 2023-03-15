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

SELECT officeCode,COUNT(employeeNumber) AS 'Cantidad_de_empleados'
FROM employees
GROUP BY officeCode
ORDER BY Cantidad_de_empleados;

USE classicmodels;

SELECT jobTitle,COUNT(jobTitle) AS 'Cantidad'
FROM employees
GROUP BY jobTitle
ORDER BY Cantidad DESC;

SELECT reportsTo,COUNT(reportsTo)
FROM employees
GROUP BY reportsTo;

SELECT ROUND(8.5);

SELECT CONCAT_WS(' ',UPPER(lastName),UPPER(firstName)) AS 'Nombre Completo'
FROM employees;

SELECT '     5 ESPACIOS';
SELECT LTRIM('     5 ESPACIOS');

SELECT '5 ESPACIOS     ';
SELECT RTRIM('5 ESPACIOS     ');

SELECT '     5 ESPACIOS     ';
SELECT TRIM('     5 ESPACIOS     ');

SELECT TRIM('N' FROM 'NNODE JS N');


SELECT NOW();

SELECT CURRENT_DATE(),CURDATE();

SELECT CURRENT_TIME(),CURTIME();

SELECT firstName,
	CASE officeCode WHEN 1 THEN 'PISO 1'
		WHEN 2 THEN 'PISO 2'
		WHEN 3 THEN 'PISO 3'
		ELSE 'PLANTA BAJA'
	END AS 'UBICACION'
FROM employees;

SELECT *
FROM PRODUCTS;

SELECT productName,
	CASE  WHEN quantityInStock < 1000 THEN 'URGE REALIZAR PEDIDO'
		WHEN quantityInStock > 1000 AND quantityInStock < 2000 THEN 'REALIZAR PEDIDO ESTA SEMANA'
        ELSE 'EN STOCK'
        END AS 'STOCK'
FROM PRODUCTS
ORDER BY quantityInStock;

/*Regresa los empleados con sus oficinas*/
SELECT * FROM employees
INNER JOIN offices
	ON employees.officeCode = offices.officeCode;
    
    /*Regresa los empleados con sus oficinas ALIAS*/
SELECT * FROM employees e
INNER JOIN offices o
	ON e.officeCode = o.officeCode;
    
/*JOINS ANIDADOS*/
SELECT * FROM employees e
INNER JOIN offices o
	ON e.officeCode = o.officeCode
INNER JOIN customers c
	ON e.employeeNumber = c.salesRepEmployeeNumber;
    
USE classicmodels;
    
SELECT * FROM customers;
    
SELECT * FROM employees e
INNER JOIN customers c
    ON e.employeeNumber = c.salesRepEmployeeNumber
WHERE employeeNumber = 1165;
    
SELECT CONCAT_WS(' ',e.lastName,e.firstName) AS employee,
c.customerName
FROM employees e
INNER JOIN customers c
    ON e.employeeNumber = c.salesRepEmployeeNumber
WHERE employeeNumber = 1165
ORDER BY e.lastName;
    
SELECT * FROM customers c
INNER JOIN employees e
    ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE country = 'USA'
ORDER BY c.customerName;

SELECT * FROM offices o
INNER JOIN employees e
	ON o.officeCode = e.officeCode
WHERE o.country = 'FRANCE';

/*USO DE LEFT*/
SELECT * FROM employees e
LEFT JOIN customers c
	ON e.employeeNumber = c.salesRepEmployeeNumber
WHERE c.customerNumber IS NULL;
    
    /*ES POSIBLE CONSULTAR LOS EMPLEADOS QUE NO ATIENDEN CLIENTES*/
SELECT * FROM employees e
left join customers c
    ON e.employeeNumber;
    
    /*CONSULTAR LOS EMPLEADOS QUE REPORTAN AL PRESIDENTE*/
SELECT * FROM employees
WHERE reportsTo = (SELECT employeeNumber
FROM employees
WHERE jobTitle = 'President');
    
SELECT employeeNumber, CONCAT_WS(' ',firstName,lastName) AS Nombre_Completo
FROM employees
WHERE employeeNumber >= (SELECT employeeNumber
FROM employees
WHERE firstName = 'Leslie' AND lastName = 'Thompson');

DELIMITER $$
CREATE PROCEDURE obtenerEmpleado(IN p_employee_number VARCHAR(255))
BEGIN
	SELECT *
    FROM employees
    WHERE employeeNumber = p_employee_number;
END$$

CALL obtenerEmpleado(1002);