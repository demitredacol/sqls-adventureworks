USE [AdventureWorks2022]
GO


/*
-- Cliente
SELECT Customer.CustomerID CodigoCliente,  
       COALESCE(Person.FirstName + ' ', '') + COALESCE(Person.MiddleName + ' ', '') + COALESCE(Person.LastName, '') Cliente,
	   Endereco."Endere�o", Endereco.Cidade, Endereco.CEP, Endereco.Estado, Endereco."Pa�s"
  FROM Sales.Customer
  LEFT JOIN Person.Person on Customer.PersonID = Person.BusinessEntityID
  LEFT JOIN (SELECT BusinessEntityAddress.BusinessEntityID, 
 				    COALESCE(Address.AddressLine1, ' ') + COALESCE(Address.AddressLine2, ' ') AS "Endere�o",
				    Address.PostalCode "CEP",
				    Address.City Cidade, 
				    StateProvince.Name Estado, CountryRegion.Name "Pa�s"
			 FROM (SELECT BusinessEntityID, AddressID
				  FROM (SELECT BusinessEntityID, AddressID,
							   ROW_NUMBER() OVER(PARTITION BY BusinessEntityAddress.BusinessEntityID ORDER BY BusinessEntityAddress.AddressId ASC) AS XORDEM
						FROM Person.BusinessEntityAddress ) AS X
				  WHERE X.XORDEM = 1) AS BusinessEntityAddress
			 JOIN Person.Address       ON BusinessEntityAddress.AddressID = Address.AddressID
			 JOIN Person.StateProvince ON Address.StateProvinceID = StateProvince.StateProvinceID
			 JOIN Person.CountryRegion ON StateProvince.CountryRegionCode = CountryRegion.CountryRegionCode ) AS Endereco ON Person.BusinessEntityID = Endereco.BusinessEntityID
 */


-- Fornecedor
/*
SELECT Vendor.BusinessEntityID CodigoFornecedor,
       Vendor.Name Fornecedor
  FROM Purchasing.Vendor
  */


/*
-- Vendedor
 SELECT Person.BusinessEntityID CodigoVendedor, 
        SalesPerson.CommissionPct PercentualComissao, 
		COALESCE(Person.FirstName + ' ', '') + COALESCE(Person.MiddleName + ' ', '') + COALESCE(Person.LastName, '') Vendedor,		
		SalesPerson.TerritoryID CodigoRegiaoVendas
   FROM Sales.SalesPerson
   JOIN Person.Person on SalesPerson.BusinessEntityID = Person.BusinessEntityID


-- SalesPerson.SalesQuota "Valor meta de venda",
*/

-- Regi�o de vendas
-- SELECT TerritoryID CodigoRegiaoVendas, Name "Regi�o de vendas", CountryRegionCode "Pa�s" FROM Sales.SalesTerritory

--Motivos da ordem
-- SELECT SalesReasonID CodigoMotivo, [Name] "Motivo da ordem" FROM Sales.SalesReason


/*
-- Produtos
SELECT Product.ProductId CodigoProduto, 
       Product.Name Produto, 
	   DATEADD(YEAR, 8, Product.SellStartDate) "Data in�cio vendas",
	   DATEADD(YEAR, 8, Product.DiscontinuedDate) "Data descontinuado",
	   ProductCategory.Name "Categoria",
       ProductSubcategory.Name "Sub categoria",
	   ProductModel.Name "Modelo"
  FROM Production.Product
  LEFT JOIN Production.ProductSubcategory ON Product.ProductSubcategoryID = ProductSubcategory.ProductSubcategoryID
  LEFT JOIN Production.ProductCategory ON ProductSubcategory.ProductCategoryID =  ProductCategory.ProductCategoryID
  LEFT JOIN Production.ProductModel ON ProductModel.ProductModelID = Product.ProductModelID
*/

-- Custo do produto
-- SELECT ProductID CodigoProduto, StartDate "In�cio validade custo", COALESCE(EndDate, CAST('2099-12-31' as Date)) "Fim validade custo", StandardCost "Valor custo padr�o" FROM Production.ProductCostHistory

-- Motivos de refugo
-- SELECT ScrapReasonID CodigoMotivoRefugo, [Name] "Motivo do refugo" FROM Production.ScrapReason

-- Locais de produ��o
-- SELECT LocationID "CodigoLocal", Name "Local de produ��o", Availability "Disponibilidade", CostRate "Rateio de custos" FROM Production.Location
