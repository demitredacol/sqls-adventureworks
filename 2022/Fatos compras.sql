USE [AdventureWorks2022]
GO

-- SELECT * FROM Purchasing.ShipMethod

SELECT 
       PurchaseOrderDetail.PurchaseOrderDetailID ItemId,
       
	   PurchaseOrderHeader.PurchaseOrderID Pedido,
	   ROW_NUMBER() OVER(PARTITION BY PurchaseOrderHeader.PurchaseOrderID ORDER BY PurchaseOrderDetail.PurchaseOrderDetailID) Item,
	   
	   
	   PurchaseOrderHeader.Status CodigoStatus,
	   PurchaseOrderHeader.VendorID CodigoFornecedor,
	   PurchaseOrderHeader.ShipMethodID CodigoMetodoEnvio,
	   
	   DATEADD(YEAR, 9, PurchaseOrderHeader.OrderDate) "Data criação", 
	   DATEADD(YEAR, 9, PurchaseOrderHeader.ShipDate) "Data de envio" ,
	   
	   CASE ROW_NUMBER() OVER(PARTITION BY PurchaseOrderHeader.PurchaseOrderID ORDER BY PurchaseOrderDetail.PurchaseOrderDetailID ASC)
         WHEN 1 THEN PurchaseOrderHeader.TaxAmt
         ELSE 0 END "Valor total impostos do pedido", 
	   
	   CASE ROW_NUMBER() OVER(PARTITION BY PurchaseOrderHeader.PurchaseOrderID ORDER BY PurchaseOrderDetail.PurchaseOrderDetailID ASC)
         WHEN 1 THEN PurchaseOrderHeader.Freight
         ELSE 0 END "Valor total frete do pedido", 
	   
	   PurchaseOrderDetail.ProductID CodigoProduto,
	   PurchaseOrderDetail.OrderQty "Quantidade pedida",
	   PurchaseOrderDetail.UnitPrice "Valor unitário",	   
	   PurchaseOrderDetail.OrderQty * PurchaseOrderDetail.UnitPrice "Valor total do item",
	   
	   PurchaseOrderDetail.ReceivedQty "Quantidade recebida",
	   PurchaseOrderDetail.ReceivedQty * PurchaseOrderDetail.UnitPrice "Valor total recebido",
	   
	   PurchaseOrderDetail.RejectedQty "Quantidade reprovada", 
	   PurchaseOrderDetail.RejectedQty * PurchaseOrderDetail.UnitPrice "Valor total reprovado",

	   PurchaseOrderDetail.OrderQty - PurchaseOrderDetail.ReceivedQty "Quantidade pendente",

	   DATEADD(YEAR, 9, PurchaseOrderDetail.DueDate ) "Prazo de entrega"


  FROM Purchasing.PurchaseOrderHeader
  JOIN Purchasing.PurchaseOrderDetail ON PurchaseOrderHeader.PurchaseOrderID = PurchaseOrderDetail.PurchaseOrderID
  

  