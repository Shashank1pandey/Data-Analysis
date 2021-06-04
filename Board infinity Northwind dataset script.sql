use northwind;

/*                           -- Northwind Database Exercises--                              */

/*1. Write a query to get Product name and quantity/unit*/ 
SELECT ProductName, QuantityPerUnit 
FROM Products;

/*2. Write a query to get current Product list (Product ID and name)*/
SELECT ProductID, ProductName
FROM Products;

/*3. Write a query to get discontinued Product list (Product ID and name)*/
SELECT ProductID, ProductName
FROM Products
WHERE Discontinued = 1; 

/*4. Write a query to get most expense and least expensive Product list (name and unit price)*/
SELECT ProductName, UnitPrice 
FROM Products 
ORDER BY UnitPrice DESC;

/*5. Write a query to get Product list (id, name, unit price) where current products cost less than $20*/
SELECT ProductID, ProductName, UnitPrice
FROM Products
WHERE (((UnitPrice)<20) AND ((Discontinued)=False))
ORDER BY UnitPrice DESC;

/*6. Write a query to get Product list (id, name, unit price) where products cost between $15 and $25*/
SELECT ProductName, UnitPrice
FROM Products
WHERE (((UnitPrice)>=15 And (UnitPrice)<=25) 
AND ((Products.Discontinued)=False))
ORDER BY Products.UnitPrice DESC;

/*7. Write a query to get Product list (name, unit price) of above average price*/
SELECT DISTINCT ProductName, UnitPrice
FROM Products
WHERE UnitPrice > (SELECT avg(UnitPrice) FROM Products)
ORDER BY UnitPrice;

/*8. Write a query to get Product list (name, unit price) of ten most expensive products*/
SELECT DISTINCT ProductName as Twenty_Most_Expensive_Products, UnitPrice
FROM Products AS a
WHERE 20 >= (SELECT COUNT(DISTINCT UnitPrice)
                    FROM Products AS b
                    WHERE b.UnitPrice >= a.UnitPrice)
ORDER BY UnitPrice desc;

/*9. Write a query to count current and discontinued products*/
SELECT Count(ProductName)
FROM Products
GROUP BY Discontinued;

/*10. Write a query to get Product list (name, units on order , units in stock) of stock is less than the quantity on order*/
SELECT ProductName,  UnitsOnOrder , UnitsInStock
FROM Products
WHERE (((Discontinued)=False) AND ((UnitsInStock)<UnitsOnOrder));