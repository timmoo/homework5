SELECT   
SUM(IL.UnitPrice*IL.Quantity) AS TotalSumm,  
MONTH(I.InvoiceDate) AS NumberOfMonth, 
YEAR(I.InvoiceDate) AS NumberOfYear 
FROM Sales.InvoiceLines AS IL
JOIN Sales.Invoices AS I ON I.InvoiceID=IL.InvoiceID
GROUP BY YEAR(I.InvoiceDate), MONTH(I.InvoiceDate)
HAVING SUM(IL.UnitPrice*IL.Quantity) > 10000
ORDER BY  YEAR(I.InvoiceDate), MONTH(I.InvoiceDate);
