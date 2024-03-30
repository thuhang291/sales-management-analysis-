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