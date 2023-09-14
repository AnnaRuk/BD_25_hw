### Вывести название и стоимость в USD одного самого дорогого проданного товара:

SELECT
ProductName,
Price as Price_usd
FROM [OrderDetails]
join Products on
OrderDetails.ProductID = Products.ProductID
order by price desc
Limit 1


### Вывести два самых дорогих товара из категории Beverages из USA

SELECT * FROM [Products]
join Suppliers on
Products.SupplierID = Suppliers.SupplierID
join Categories on
Products.CategoryID = Categories.CategoryID
Where
country in ('USA')
and
CategoryName in ('Beverages')
order by price desc
limit 2

### Удалить товары с ценой менее 5 EUR

DELETE FROM [Products]
where
Price < 5

### Вывести список стран, которые поставляют морепродукты

SELECT distinct
Country
FROM [Products]
join Suppliers on
Products.SupplierID = Suppliers.SupplierID
join Categories on
Products.CategoryID = Categories.CategoryID
Where
CategoryName in ('Seafood')

### Очистить поле ContactName у всех клиентов не из China

update [Customers]
set
ContactName = ''
where
not Country = 'China'