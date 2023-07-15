USE [AdventureWorks2022]
GO



/*
-- ORDENS E OPERAÇÕES
SELECT WorkOrder.WorkOrderID Ordem,
	   WorkOrder.ProductID CodigoProduto,
	   WorkOrder.OrderQty Quantidade,
	   WorkOrder.StartDate "Data início ordem",
	   WorkOrder.DueDate "Prazo de entrega",
	   WorkOrder.EndDate "Data encerramento ordem",
	   WorkOrder.ScrapReasonID CodigoMotivoRefugo,
	   WorkOrderRouting.OperationSequence "Operação",
	   WorkOrderRouting.LocationID "CodigoLocal",
	   WorkOrderRouting.ScheduledStartDate "Início planejado operação",
	   WorkOrderRouting.ScheduledEndDate "Fim planejado operação",
	   WorkOrderRouting.PlannedCost "Custo planejado operação",
	   WorkOrderRouting.ActualStartDate "Início real operação",
	   WorkOrderRouting.ActualEndDate "Fim real operação",
	   WorkOrderRouting.ActualCost "Custo real operação"
  FROM Production.WorkOrder
  LEFT JOIN Production.WorkOrderRouting ON WorkOrder.WorkOrderID = WorkOrderRouting.WorkOrderID
*/

/*
-- Produção 
SELECT 
       TransactionHistory.TransactionID LancamentoId,
	   TransactionHistory.ReferenceOrderID Ordem,
	   TransactionHistory.TransactionDate Data,
	   TransactionHistory.Quantity "Quantidade",
	   TransactionHistory.ActualCost "Custo"
FROM Production.TransactionHistory  
WHERE TransactionType = 'W'

*/