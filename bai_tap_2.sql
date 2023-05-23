create database db;
use db;
create table Customer (
                          cID int primary key,
                          Name varchar(25),
                          cAge tinyint
);
create table Orders (
                        oID int primary key,
                        cID int,
                        oDate datetime,
                        oTotalPrice int,
                        foreign key (cID) references Customer (cID)
);
create table Product (
                         pID int primary key,
                         pName varchar(25),
                         pPrice int
);
create table OrderDetail (
                             oID int,
                             pID int,
                             odQTY int,
                             foreign key (oID) references Orders(oID),
                             foreign key (pID) references Product(pID)
);

insert into Customer values
                         (1, 'Minh Quan', 10),
                         (2, 'Ngoc Oanh', 20),
                         (3, 'Hong Ha', 50);

insert into Orders values
                       (1, 1, '2006/3/21', null),
                       (2, 2, '2006/3/23', null),
                       (3, 1, '2006/3/16', null);

insert into Product values
                        (1, 'May Giat', 3),
                        (2, 'Tu Lanh', 5),
                        (3, 'Quat', 7),
                        (4, 'Dieu Hoa', 1),
                        (5, 'Bep Dien', 2);

insert into OrderDetail values
                            (1, 1, 3),
                            (1, 3, 7),
                            (1, 4, 2),
                            (2, 1, 1),
                            (3, 1, 8),
                            (2, 5, 4),
                            (2, 3, 3);

select Customer.Name, Product.pName, Orders.oID, Product.pPrice, OrderDetail.odQTY
from OrderDetail
         join Orders on OrderDetail.oID = Orders.oID
         join Product on OrderDetail.pID = Product.pID
         join Customer on Orders.cID = Customer.cID;

select Customer.Name, Customer.cAge
from Customer
where Customer.cID not in (select cID from Orders);

select Orders.oID, sum(OrderDetai.odQTY * Product.pPrice) as sex
from Orders
         join OrderDetail on Orders.oID = OrderDetail.oID
         join Product on OrderDetail.pID = Product.pID
group by Orders.oID;