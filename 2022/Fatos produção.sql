USE [AdventureWorks2022]
GO



/*
-- ORDENS E OPERAÇÕES
SELECT WorkOrder.WorkOrderID Ordem,
	   WorkOrder.ProductID CodigoProduto,
	   WorkOrder.OrderQty "Quantidade solicitada",
	   WorkOrder.StockedQty "Quantidade produzida",
	   WorkOrder.ScrappedQty "Quantidade refugada",
	   DATEADD(YEAR, 9, WorkOrder.StartDate) "Data início ordem",
	   DATEADD(YEAR, 9, WorkOrder.DueDate) "Prazo de entrega",
	   DATEADD(YEAR, 9, WorkOrder.EndDate) "Data encerramento ordem",
	   WorkOrder.ScrapReasonID CodigoMotivoRefugo,
	   WorkOrderRouting.OperationSequence "Operação",
	   WorkOrderRouting.LocationID "CodigoLocal",
	   DATEADD(YEAR, 9, WorkOrderRouting.ScheduledStartDate) "Início planejado operação",
	   DATEADD(YEAR, 9, WorkOrderRouting.ScheduledEndDate) "Fim planejado operação",
	   WorkOrderRouting.PlannedCost "Custo planejado operação",
	   DATEADD(YEAR, 9, WorkOrderRouting.ActualStartDate) "Início real operação",
	   DATEADD(YEAR, 9, WorkOrderRouting.ActualEndDate) "Fim real operação",
	   WorkOrderRouting.ActualCost "Custo real operação"
  FROM Production.WorkOrder
  LEFT JOIN Production.WorkOrderRouting ON WorkOrder.WorkOrderID = WorkOrderRouting.WorkOrderID
*/

/*
-- Produção 
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