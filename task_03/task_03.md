### В рамках БД "онлайн-магазин" напишите след/запросы:
### Вывести ко-во поставщиков не из UK и не из China ///27

SELECT
COUNT(*) AS total_suppliers_not_from_uk_and_china
FROM [Suppliers]
where
Country not in ('UK','China')

### Вывести среднюю/MAX/MIN стоимости и ко-во товаров из категорий 3 и 5

SELECT
AVG(Price) AS avg_price,
MIN(Price) AS min_price,
MAX(Price) AS max_price
FROM [Products]
where
CategoryID in (3,5)


### Вывести общую сумму проданных товаров ///386424.23

SELECT
SUM(Products.Price * OrderDetails.Quantity) AS total_sum
FROM [OrderDetails]
join Products on
OrderDetails.ProductID = Products.ProductID

### Вывести ко-во стран, которые поставляют напитки ///12

SELECT distinct
Country,
COUNT(*) AS country_drinks
FROM [Products]
join Suppliers on
Products.SupplierID = Suppliers.SupplierID
join Categories on
Products.CategoryID = Categories.CategoryID
where
Description like '%drink%'

### Вывести сумму, на которую было отправлено товаров клиентам в Germany///47241.82000000001

SELECT
SUM(Products.Price * OrderDetails.Quantity) AS total_sold_to_germany
FROM [OrderDetails]
JOIN Orders ON OrderDetails.OrderID=Orders.OrderID
JOIN Customers ON Orders.CustomerID=Customers.CustomerID
JOIN Products ON OrderDetails.ProductID=Products.ProductID
where
Customers.Country  = 'Germany'