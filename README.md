# Data Analysis Project: Sales Management Analysis
## Project Overview
### a. Project Background and Objectives
A bike company namely Adventure Works requested for this project to create an Internet Sales Report for this Sales Department. Based on the dashboard, the Sales Manager will have enough information to inform decisions for the business's operations.

### b. Data Sources and Description
- Data Source: Adventure Works Sample Databases 2019</b>
- Data types:
Sales Data</b>
Customer Data</b>
Product Data</b>
Calendar Data</b>
Budget Data</b>

### c. Languages & Tools
- SQL</b>
- Microsoft Excel</b>
- Microsoft Power BI</b>

## 2. Data Cleaning and Preparation
An important step before diving into the analysis of Internet Sales analysis is cleaning and preparing the data. This dataset contains multiple tables, I'll select some relevant ones based on the specific needs of the sales department, defined in the user stories.

I've prepared the data for analysis using the following SQL queries. These queries ensure the data is clean and accurate for our internet sales analysis.

**DIM_Calendar**
```c
SELECT [DateKey]
      ,[FullDateAlternateKey] as Date
      --,[DayNumberOfWeek]
      ,[EnglishDayNameOfWeek] as Day
      --,[SpanishDayNameOfWeek]
      --,[FrenchDayNameOfWeek]
      --,[DayNumberOfMonth]
      --,[DayNumberOfYear]
      --,[WeekNumberOfYear]
      ,LEFT([EnglishMonthName],3) as Month
      --,[SpanishMonthName]
      --,[FrenchMonthName]
      ,[MonthNumberOfYear] as MonthNo
      ,[CalendarQuarter] as Quarter 
      ,[CalendarYear]as Year
      --,[CalendarSemester]
      --,[FiscalQuarter]
      --,[FiscalYear]
      --,[FiscalSemester]
  FROM dbo.DimDate
  WHERE CalendarYear>=2022
```
**DIM_Customers**
```c
--Cleansed Dim_Customers Table--
SELECT c.CustomerKey as CustomerKey
      --,[GeographyKey]
      --,[CustomerAlternateKey]
      --,[Title]
      ,c.FirstName as [First Name]
      --,[MiddleName]
      ,c.LastName as [Last Name]
	  ,c.FirstName +' '+c.LastName as [Full Name]
      --,[NameStyle]
      --,[BirthDate]
      --,[MaritalStatus]
      --,[Suffix]
      ,CASE c.Gender WHEN 'M' THEN 'Male' WHEN 'F' THEN 'Female' END as Gender
      --,[EmailAddress]
      --,[YearlyIncome]
      --,[TotalChildren]
      --,[NumberChildrenAtHome]
      --,[EnglishEducation]
      --,[SpanishEducation]
      --,[FrenchEducation]
      --,[EnglishOccupation]
      --,[SpanishOccupation]
      --,[FrenchOccupation]
      --,[HouseOwnerFlag]
      --,[NumberCarsOwned]
      --,[AddressLine1]
      --,[AddressLine2]
      --,[Phone]
      ,c.DateFirstPurchase as DateFirstPurchase
      --,[CommuteDistance]
	  ,g.City as [Customer City]
	  ,g.EnglishCountryRegionName as Country
  FROM dbo.DimCustomer as c 
       LEFT JOIN dbo.DimGeography as g 
	   ON g.GeographyKey = c.GeographyKey
  ORDER BY CustomerKey --Order list by CustomerKey
```
**DIM_Products**
```c
--Cleansed Dim_Product Table--
SELECT [ProductKey]
      ,[ProductAlternateKey] as ProductItemCode
      --,[ProductSubcategoryKey]
      --,[WeightUnitMeasureCode]
      --,[SizeUnitMeasureCode]
      ,[EnglishProductName] as [Product Name]
	  ,[EnglishProductCategoryName] as [Product Cate] --Join table
	  ,[EnglishProductSubcategoryName] as [Product Sub] --Join table
      --,[SpanishProductName]
      --,[FrenchProductName]
      --,[StandardCost]
      --,[FinishedGoodsFlag]
      ,[Color] as [Product Color]
      --,[SafetyStockLevel]
      --,[ReorderPoint]
      --,[ListPrice]
      ,[Size] as[Product Size]
      --,[SizeRange]
      --,[Weight]
      --,[DaysToManufacture]
      ,[ProductLine] as [Product Line]
      --,[DealerPrice]
      --,[Class]
      --,[Style]
      ,[ModelName] as [Product Model Name]
      --,[LargePhoto]
      ,[EnglishDescription] as [Product Description]
      --,[FrenchDescription]
      --,[ChineseDescription]
      --,[ArabicDescription]
      --,[HebrewDescription]
      --,[ThaiDescription]
      --,[GermanDescription]
      --,[JapaneseDescription]
      --,[TurkishDescription]
      --,[StartDate]
      --,[EndDate]
	  --,Status as Test --Check Status
      ,ISNULL(Status,'Outdated') as [Product Status]
  FROM [AdventureWorksDW2022].[dbo].[DimProduct] as p
	LEFT JOIN DimProductSubcategory as s
	ON p.ProductSubcategoryKey = s.ProductSubcategoryKey
	LEFT JOIN DimProductCategory as c
	ON s.ProductCategoryKey = c.ProductCategoryKey
ORDER BY ProductKey
```
**FACT_InternetSales**
```c
SELECT [ProductKey]
      ,[OrderDateKey]
      ,[DueDateKey]
      ,[ShipDateKey]
      ,[CustomerKey]
      --,[PromotionKey]
      --,[CurrencyKey]
      --,[SalesTerritoryKey]
      ,[SalesOrderNumber]
      --,[SalesOrderLineNumber]
      --,[RevisionNumber]
      --,[OrderQuantity]
      --,[UnitPrice]
      --,[ExtendedAmount]
      --,[UnitPriceDiscountPct]
      --,[DiscountAmount]
      --,[ProductStandardCost]
      --,[TotalProductCost]
      ,[SalesAmount]
      --,[TaxAmt]
      --,[Freight]
      --,[CarrierTrackingNumber]
      --,[CustomerPONumber]
      --,[OrderDate]
      --,[DueDate]
      --,[ShipDate]
  FROM [AdventureWorksDW2022].[dbo].[FactInternetSales]
  WHERE LEFT(OrderDateKey,4) >= YEAR(GETDATE()) - 2
  ORDER BY OrderDateKey
```
## 3. Data Model and Data Analysis
### a.Data Analysis
- Budget amount
Revenue
Profit
Profit = Revenue – Budget
If the profit is positive (greater than zero), the company is making money and is considered profitable.</b>
If the profit is negative (less than zero), the company is losing money and is considered unprofitable.

### b.Data Visualization
[The interactive sales management dashboard](https://app.powerbi.com/view?r=eyJrIjoiYzg5YmM0YmUtNjA2ZS00YWZmLWEzYTUtODVkNzQ0ZTFkNzdhIiwidCI6ImMzYWYzODY0LWU2NjgtNDZkZS04NzQ4LTkzZTRjMzk2M2E4NiIsImMiOjEwfQ%3D%3D) offers sales managers a centralized view of key metrics. It provides an overview page showcasing overview of sales performance, followed by dedicated pages that allow for deeper dives into customer data and product data trends over time. 
## 4. Recommendations and Actionable Steps
The increasing number of customers and orders indicates a growing demand for the company's products.

### Regional Analysis
- The United States is the country with the highest revenue over the years, followed by Australia and Canada.</b>
- France has the top customers with the highest spending.

### Product Analysis
- The Bike category generates the highest revenue over the years.</b>
- The top revenue-generating products belong to the Bike category and are mainly Mountain and Road bikes in Black and Silver colors.

### Conclusion
- The United States is the most potential market with the highest revenue over the data consolidation period.</b>
- Bike products, especially the Mountain bike line, are the company's main products.</b>
- The percentage of new customers is increasing.

### Recommendations
- It is necessary to maintain operations in the US and expand activities in the two potential countries of Australia and Canada. In particular, France has the top customers with high spending but a small number of customers, so it needs to be focused on attracting more customers.</b>
- The popular Bike product line needs to remain the quality and continuously invested in to dominate the market.
