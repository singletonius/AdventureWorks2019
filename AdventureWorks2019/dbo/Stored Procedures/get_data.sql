create   proc dbo.get_data @name varchar(50) = null, @params varchar(max) = null, @result varchar(max) = null out as

set nocount on
set transaction isolation level read uncommitted

declare @res varchar(max)

-- set @res = (
--   select /*top 3*/ p.ProductID, p.Name, p.ProductNumber from Production.Product p for json auto
-- )

set @res = (
  select top 100 CreditCardID, CardType, CardNumber, ExpMonth, ExpYear, ModifiedDate from Sales.CreditCard c for json auto
)

-- set @res = (
--   select * from (
--     select p.ProductID, p.Name, p.ProductNumber from Production.Product p
--     union all
--     select p.ProductID, p.Name, p.ProductNumber from Production.Product p
--     union all
--     select p.ProductID, p.Name, p.ProductNumber from Production.Product p
--     union all
--     select p.ProductID, p.Name, p.ProductNumber from Production.Product p
--   ) t for json auto
-- )

-- set @result = '{"data": ' + @res + '}'
set @result = @res