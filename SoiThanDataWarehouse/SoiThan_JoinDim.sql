--Product
SELECT P.ProductID ,P.ProductNumber, P.Name as ProductName, P.Color, P.ProductSubCategoryID, PC.ProductCategoryID, PS.Name as SubcategoryName, Pc.Name AS ProductType
FROM AdventureWorks2019.Production.Product P 
JOIN AdventureWorks2019.Production.ProductSubcategory PS ON P.ProductSubcategoryID = PS.ProductSubcategoryID
JOIN AdventureWorks2019.Production.ProductCategory PC ON PC.ProductCategoryID = PS.ProductCategoryID;

--ProductSubCategory
SELECT ProductSubcategoryID , ProductCategoryID, Name as Name
FROM AdventureWorks2019.Production.ProductSubcategory
ORDER BY ProductSubcategoryID;

--ProductCategory
SELECT ProductCategoryID , Name as CategoryName
FROM AdventureWorks2019.Production.ProductCategory;

--Territory
SELECT S.TerritoryID , S.Name as Region, R.Name as Country, S.[Group] as CountryGroup
FROM AdventureWorks2019.Sales.SalesTerritory S, AdventureWorks2019.Person.CountryRegion R	
WHERE S.CountryRegionCode = R.CountryRegionCode;

--Customer
SELECT *
FROM AdventureWorks2019.Sales.Customer C
JOIN ( 
SELECT P.BusinessEntityID 
, P.[FirstName] 
, P.[MiddleName] 
, P.[LastName] 
, P.[FirstName] + ' ' + P.[MiddleName] + ' ' + P.[LastName] as Fullname
, D.[BirthDate] 
, D.[MaritalStatus] 
, D.[Gender] 
, D.[Education]
, D.[Occupation]
, D.NumberCarsOwned
, D.NumberChildrenAtHome
, D.HomeOwnerFlag
, D.TotalChildren
, D.YearlyIncome
FROM 
AdventureWorks2019.Person.Person P 
JOIN AdventureWorks2019.Sales.vPersonDemographics D on P.BusinessEntityID = D.BusinessEntityID) as PersonDemo
on C.PersonID = PersonDemo.BusinessEntityID

--InternetSales
SELECT SH.SalesOrderID 
, SD.ProductID
, SH.SalesOrderNumber 
, CustomerID 
, TerritoryID 
, TotalDue as TotalAmount
, Freight
, UnitPrice
, OrderQty,
CONVERT(datetime,orderdate) as OrderDate,
CONVERT(datetime,ShipDate) as ShipDate,
CONVERT(datetime,DueDate) as DueDate
FROM [AdventureWorks2019].Sales.[SalesOrderHeader] SH
JOIN [AdventureWorks2019].Sales.[SalesOrderDetail] SD 
on SD.SalesOrderID = SH.SalesOrderID
Where SH.OnlineOrderFlag = 1

--ResellerSales
SELECT SH.SalesOrderID 
, SD.ProductID
, SH.SalesOrderNumber 
, CustomerID 
, TerritoryID 
, TotalDue as TotalAmount
, Freight
, UnitPrice
, OrderQty,
CONVERT(datetime,orderdate) as OrderDate,
CONVERT(datetime,ShipDate) as ShipDate,
CONVERT(datetime,DueDate) as DueDate
FROM [AdventureWorks2019].Sales.[SalesOrderHeader] SH
JOIN [AdventureWorks2019].Sales.[SalesOrderDetail] SD 
on SD.SalesOrderID = SH.SalesOrderID
Where SH.OnlineOrderFlag = 0