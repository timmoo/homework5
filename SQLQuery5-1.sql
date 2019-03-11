SELECT 
AVG(DISTINCT S.UnitPrice) AS AveragePrice,  
SUM(IL.Quantity*IL.UnitPrice) AS TotalSumm, 
MONTH(I.InvoiceDate) AS NumberOfMonth, 
YEAR(I.InvoiceDate) AS NumberOfYear  
FROM Warehouse.StockItems AS S
JOIN  Sales.InvoiceLines AS IL ON S.StockItemID=IL.StockItemID
JOIN Sales.Invoices AS I ON I.InvoiceID=IL.InvoiceID
GROUP BY  YEAR(I.InvoiceDate), MONTH(I.InvoiceDate)
ORDER BY  YEAR(I.InvoiceDate), MONTH(I.InvoiceDate);
