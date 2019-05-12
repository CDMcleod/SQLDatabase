/* Connor McLeod
SQL Assignment 5
12/10/2016
last modified:
03/12/2019 */

--Question 1
Select ShippedDate as ShippedLate
From Orders o
Group by ShippedDate, RequiredDate
Having ShippedDate > RequiredDate

--Question 2
Select ProductID, 
		ProductName, 
		UnitsInStock,
		CategoryID
From Products p
Where CategoryID = 2
Group by ProductID, CategoryID, UnitsInStock, ProductName
Having UnitsInStock > AVG(UnitsInStock)

--Question 3
Select ProductID, 
		ProductName, 
		UnitsInStock,
		CategoryID
From Products p
Where CategoryID IN
	(Select CategoryID
	From Products p
	Where CategoryID = 2)
Group by ProductID, CategoryID, UnitsInStock, ProductName
Having UnitsInStock > AVG(UnitsInStock)

--Question 4
Select CustomerID,
		ContactName,
		Country
From Customers c
Where Country NOT IN ('USA', 'UK', 'Australia', 'Canada')

--Question 5
Select CustomerID,
		ContactName
From Customers c
Where CustomerID Not In
	(Select Distinct CustomerID
		From Orders o)

--Question 6
Select EmployeeID,
		FirstName + LastName as EmployeeName

From Employees e
Where ReportsTo = '122'
Order By LastName

--Question 7
Select CustomerID,
		CompanyName,
		ContactName
From Customers c
Where LEN(CompanyName) < 12