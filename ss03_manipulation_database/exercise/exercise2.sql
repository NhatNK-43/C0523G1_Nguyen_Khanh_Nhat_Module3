use quan_ly_ban_hang;

insert into customers (customer_name, age)
value
	('Minh Quan',10),
	('Ngoc Oanh',20),
	('Hong Ha',50);

insert into products (product_name, price)
value
	('May Giat',3),
    ('Tu Lanh',5),
    ('Dieu Hoa',7),
    ('Quat',1),
    ('Bep Dien',2);

insert into orders (customer_id, order_date, total_price)
value
	(1,'2006-03-21',null),
    (2,'2006-03-23',null),
    (1,'2006-03-16',null);
    
insert into order_detail (order_id, product_id, quantity)
value
	(1,1,3),
    (1,3,7),
    (1,4,2),
    (2,1,1),
    (3,1,8),
    (2,5,4),
    (2,3,3);
    
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order

select 
	order_id, 
    order_date, 
    price 
from 
	order_detail
	join orders on orders.id = order_detail.order_id
    join products on products.id = order_detail.product_id;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách

select 
	customers.id, customers.customer_name, products.product_name
from 
	customers
	join orders on orders.customer_id = customers.id
	join order_detail on order_detail.order_id = orders.id
    join products on products.id = order_detail.product_id;
    
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào

select 
	customers.id, customers.customer_name
from 
	customers
	left join orders on orders.customer_id = customers.id
	left join order_detail on order_detail.order_id = orders.id
    left join products on products.id = order_detail.product_id
    where products.product_name is null;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng 
-- tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được 
-- tính = odQTY*pPrice)

select 
	orders.id, orders.order_date, sum(ifnull (orders.total_price, order_detail.quantity * products.price)) as total_price
from 
	orders
	join order_detail on order_detail.order_id = orders.id
    join products on products.id = order_detail.product_id
    group by orders.id;