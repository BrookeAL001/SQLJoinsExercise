/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT products.Name as ProductName, categories.Name as CategoryName
FROM products
INNER JOIN categories
ON categories.CategoryID = products.CategoryID
WHERE categories.Name = 'Computers';
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT products.Name as ProductName, products.Price as ProductPrice, reviews.Rating as Rating
FROM products
INNER JOIN reviews
ON products.ProductID = reviews.ProductID
WHERE reviews.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT employees.FirstName, employees.LastName, SUM(sales.Quantity) AS Total 
FROM sales
INNER JOIN employees
ON sales.EmployeeID =  employees.EmployeeID
group by employees.EmployeeID
ORDER BY Total DESC;


/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.Name, categories.NAME
FROM departments
INNER JOIN categories
ON categories.DepartmentID = departments.DepartmentID
WHERE categories.Name = 'Appliances' OR categories.NAME = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 SELECT products.Name as ProductName, SUM(sales.Quantity) as TotalQTYSold, SUM(sales.PricePerUnit * sales.Quantity) as TotalDollars
 FROM products
 INNER JOIN sales
 ON products.ProductID = sales.ProductID
 WHERE products.Name = 'Eagles: Hotel California';
 
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */

SELECT products.Name, reviews.Reviewer, reviews.Rating, reviews.Comment
FROM products
INNER JOIN reviews
ON products.ProductID = reviews.ProductID
WHERE products.ProductID = 857 AND reviews.Rating = 1;



-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
SELECT employees.FirstName as FirstName, employees.LastName as LastName, products.Name as Name, sales.Quantity as Qty
FROM employees
INNER JOIN products
INNER JOIN sales
ON employees.EmployeeID = sales.EmployeeID
AND sales.ProductID = products.ProductID
ORDER BY employees.EmployeeID;