USE [AdventureWorks2022]
GO



-- ORDENS E OPERA��ES
/*
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
  JOIN Production.WorkOrderRouting ON WorkOrder.WorkOrderID = WorkOrderRouting.WorkOrderID
UNION
SELECT WorkOrder.WorkOrderID Ordem,
	   WorkOrder.ProductID CodigoProduto,
	   WorkOrder.OrderQty "Quantidade solicitada",
	   WorkOrder.StockedQty "Quantidade produzida",
	   WorkOrder.ScrappedQty "Quantidade refugada",
	   DATEADD(YEAR, 9, WorkOrder.StartDate) "Data in�cio ordem",
	   DATEADD(YEAR, 9, WorkOrder.DueDate) "Prazo de entrega",
	   DATEADD(YEAR, 9, WorkOrder.EndDate) "Data encerramento ordem",
	   WorkOrder.ScrapReasonID CodigoMotivoRefugo,
	   1 "Opera��o",
	   CASE WHEN ProductID < 500 THEN 1
	        WHEN ProductID < 600 THEN 2
			WHEN ProductID < 730 THEN 3
			WHEN ProductID < 820 THEN 4
			WHEN ProductID < 870 THEN 5
			WHEN ProductID < 900 THEN 6
			ELSE 7
			END AS "CodigoLocal",
	   DATEADD(YEAR, 9, WorkOrder.StartDate) "In�cio planejado opera��o",
	   DATEADD(YEAR, 9, WorkOrder.EndDate) "Fim planejado opera��o",
	   NULL "Custo planejado opera��o",
	   DATEADD(YEAR, 9, WorkOrder.StartDate) "In�cio real opera��o",
	   DATEADD(YEAR, 9, WorkOrder.EndDate) "Fim real opera��o",
	   NULL "Custo real opera��o"
  FROM Production.WorkOrder
 WHERE NOT EXISTS (SELECT 1 FROM Production.WorkOrderRouting WHERE WorkOrder.WorkOrderID = WorkOrderRouting.WorkOrderID)