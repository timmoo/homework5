SELECT 
S.StockItemName, 
MONTH(I.InvoiceDate) AS NumberofMonth, 
SUM(IL.Quantity*IL.UnitPrice) AS TotalSumm, 
YEAR(I.InvoiceDate) AS NumberofYEAR, 
MIN(I.InvoiceDate) AS Firstdate, 
SUM(IL.Quantity) AS TotalQuantity 
FROM Warehouse.StockItems AS S
JOIN  Sales.InvoiceLines AS IL ON S.StockItemID=IL.StockItemID
JOIN Sales.Invoices AS I ON I.InvoiceID=IL.InvoiceID
GROUP BY MONTH(I.InvoiceDate), YEAR(I.InvoiceDate), S.StockItemName, IL.Quantity
HAVING SUM(IL.Quantity) < 50
ORDER BY MONTH(I.InvoiceDate), YEAR(I.InvoiceDate);