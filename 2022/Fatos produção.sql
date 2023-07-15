USE [AdventureWorks2022]
GO



/*
-- ORDENS E OPERA��ES
SELECT WorkOrder.WorkOrderID Ordem,
	   WorkOrder.ProductID CodigoProduto,
	   WorkOrder.OrderQty "Quantidade solicitada",
	   WorkOrder.StockedQty "Quantidade produzida",
	   WorkOrder.ScrappedQty "Quantidade refugada",
	   DATEADD(YEAR, 9, WorkOrder.StartDate) "Data in�cio ordem",
	   DATEADD(YEAR, 9, WorkOrder.DueDate) "Prazo de entrega",
	   DATEADD(YEAR, 9, WorkOrder.EndDate) "Data encerramento ordem",
	   WorkOrder.ScrapReasonID CodigoMotivoRefugo,
	   WorkOrderRouting.OperationSequence "Opera��o",
	   WorkOrderRouting.LocationID "CodigoLocal",
	   DATEADD(YEAR, 9, WorkOrderRouting.ScheduledStartDate) "In�cio planejado opera��o",
	   DATEADD(YEAR, 9, WorkOrderRouting.ScheduledEndDate) "Fim planejado opera��o",
	   WorkOrderRouting.PlannedCost "Custo planejado opera��o",
	   DATEADD(YEAR, 9, WorkOrderRouting.ActualStartDate) "In�cio real opera��o",
	   DATEADD(YEAR, 9, WorkOrderRouting.ActualEndDate) "Fim real opera��o",
	   WorkOrderRouting.ActualCost "Custo real opera��o"
  FROM Production.WorkOrder
  LEFT JOIN Production.WorkOrderRouting ON WorkOrder.WorkOrderID = WorkOrderRouting.WorkOrderID
*/

/*
-- Produ��o 
SELECT 
       TransactionHistory.TransactionID LancamentoId,
	   TransactionHistory.ReferenceOrderID Ordem,
	   DATEADD(YEAR, 9, TransactionHistory.TransactionDate) Data,
	   TransactionHistory.Quantity "Quantidade",
	   TransactionHistory.ActualCost "Custo"
FROM Production.TransactionHistory  
WHERE TransactionType = 'W'

*/

select top 10 * from Production.WorkOrder