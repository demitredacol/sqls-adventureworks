USE [AdventureWorks2022]
GO



/*
-- ORDENS E OPERA��ES
SELECT WorkOrder.WorkOrderID Ordem,
	   WorkOrder.ProductID CodigoProduto,
	   WorkOrder.OrderQty Quantidade,
	   WorkOrder.StartDate "Data in�cio ordem",
	   WorkOrder.DueDate "Prazo de entrega",
	   WorkOrder.EndDate "Data encerramento ordem",
	   WorkOrder.ScrapReasonID CodigoMotivoRefugo,
	   WorkOrderRouting.OperationSequence "Opera��o",
	   WorkOrderRouting.LocationID "CodigoLocal",
	   WorkOrderRouting.ScheduledStartDate "In�cio planejado opera��o",
	   WorkOrderRouting.ScheduledEndDate "Fim planejado opera��o",
	   WorkOrderRouting.PlannedCost "Custo planejado opera��o",
	   WorkOrderRouting.ActualStartDate "In�cio real opera��o",
	   WorkOrderRouting.ActualEndDate "Fim real opera��o",
	   WorkOrderRouting.ActualCost "Custo real opera��o"
  FROM Production.WorkOrder
  LEFT JOIN Production.WorkOrderRouting ON WorkOrder.WorkOrderID = WorkOrderRouting.WorkOrderID
*/

/*
-- Produ��o 
SELECT 
       TransactionHistory.TransactionID LancamentoId,
	   TransactionHistory.ReferenceOrderID Ordem,
	   TransactionHistory.TransactionDate Data,
	   TransactionHistory.Quantity "Quantidade",
	   TransactionHistory.ActualCost "Custo"
FROM Production.TransactionHistory  
WHERE TransactionType = 'W'

*/