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
