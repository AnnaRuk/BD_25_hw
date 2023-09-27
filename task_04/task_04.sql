В рамках БД "онлайн-магазин" напишите след/запросы:
### Найти мин/стоимость товаров для каждой категории

SELECT
    Products.CategoryID,
    MIN(Products.Price) as min_price
FROM [Products]
group by Products.CategoryID

 ### Вывести ТОП-3 стран по количеству доставленных заказов

SELECT
    Customers.Country,
    count(*) as amount_orders
FROM [Orders]
    join Customers on Orders.CustomerID = Customers.CustomerID
group by Customers.Country
order by amount_orders desc
    limit 3

    ### Вывести названия категорий, в которых более 10 товаров

SELECT
    Categories.CategoryName,
    count (*) as products_include
FROM [Products]
    join Categories
on Products.CategoryID = Categories.CategoryID
group by Products.CategoryID
having products_include > 10
order by products_include desc

    ### Очистить тел/номер поставщикам из USA

update [Suppliers]
set
    Suppliers.Phone = ""
where
    Suppliers.Country  = 'USA'


    ### Вывести имена и фамилии (и ко-во заказов) менеджеров, у которых ко-во заказов менее 15

SELECT
    Employees.LastName,
    Employees.FirstName,
    count (*) as amount_of_orders
FROM [Orders]
    join Employees
on Orders.EmployeeID = Employees.EmployeeID
group by Orders.EmployeeID
having amount_of_orders < 15

    #### Вывести товар, который находится на втором месте по ко-ву заказов

SELECT
    Products.ProductName,
    count (*) as times_to_order
FROM [OrderDetails]
    join Products
on OrderDetails.ProductID = Products.ProductID
group by Products.ProductID
order by times_to_order desc
    limit 2 offset 3