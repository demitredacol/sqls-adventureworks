USE [AdventureWorks2022]
GO



-- ORDENS E OPERAÇÕES
/*
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
  JOIN Production.WorkOrderRouting ON WorkOrder.WorkOrderID = WorkOrderRouting.WorkOrderID
UNION
SELECT WorkOrder.WorkOrderID Ordem,
	   WorkOrder.ProductID CodigoProduto,
	   WorkOrder.OrderQty "Quantidade solicitada",
	   WorkOrder.StockedQty "Quantidade produzida",
	   WorkOrder.ScrappedQty "Quantidade refugada",
	   DATEADD(YEAR, 9, WorkOrder.StartDate) "Data início ordem",
	   DATEADD(YEAR, 9, WorkOrder.DueDate) "Prazo de entrega",
	   DATEADD(YEAR, 9, WorkOrder.EndDate) "Data encerramento ordem",
	   WorkOrder.ScrapReasonID CodigoMotivoRefugo,
	   1 "Operação",
	   CASE WHEN ProductID < 500 THEN 1
	        WHEN ProductID < 600 THEN 2
			WHEN ProductID < 730 THEN 3
			WHEN ProductID < 820 THEN 4
			WHEN ProductID < 870 THEN 5
			WHEN ProductID < 900 THEN 6
			ELSE 7
			END AS "CodigoLocal",
	   DATEADD(YEAR, 9, WorkOrder.StartDate) "Início planejado operação",
	   DATEADD(YEAR, 9, WorkOrder.EndDate) "Fim planejado operação",
	   NULL "Custo planejado operação",
	   DATEADD(YEAR, 9, WorkOrder.StartDate) "Início real operação",
	   DATEADD(YEAR, 9, WorkOrder.EndDate) "Fim real operação",
	   NULL "Custo real operação"
  FROM Production.WorkOrder
 WHERE NOT EXISTS (SELECT 1 FROM Production.WorkOrderRouting WHERE WorkOrder.WorkOrderID = WorkOrderRouting.WorkOrderID)