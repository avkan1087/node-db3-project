-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT ProductName, CategoryName from Product as P
join Category as c
on p.CategoryId = c.Id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT Id, CompanyName, OrderDate from [Order] as o
join Shipper as s
on s.Id = o.ShipVia
where OrderDate < '2012-08-09';


-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT Quantity, ProductName from OrderDetail as od
join Product as p
on p.Id = od.ProductId
WHERE OrderId = 10251


-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT Id, CompanyName, LastName from [Order] as o
join Customer as c
on c.Id = o.CustomerId
join Employee as e
on e.Id = o.EmployeeId

--Stretch Problems: In SQL Try Editor at W3Schools.com:

--Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 9 records. //Type should be 9=8

SELECT c.categoryName, COUNT(c.categoryId) as Count 
FROM Products as p
JOIN categories as c 
on c.categoryId = p.categoryId
GROUP BY c.categoryId


--Display OrderID and a column called ItemCount that shows the total number of products placed on the order. Shows 196 records.

SELECT od.Orderid, od.quantity as ItemCount, SUM(od.quantity) as 'Orders Placed'
from orderdetails as od
GROUP BY od.orderId




