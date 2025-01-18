```sql

create database ecomdb;

use ecomdb;

create table first_user(
id int not null auto_increment,
email_address varchar (255) not null,
phone_number varchar (20) not null,
password varchar (255) not null,
primary key (id)
);

create table product (
id int not null auto_increment, 
product_id varchar (50) unique not null,
SKU varchar (50) unique not null,
qty_in_stock int not null,
price Decimal (10, 2) not null,
primary key (id)
);

create table supplier (
id int not null auto_increment, 
supplier_name varchar (255) not null, 
primary key (id)
);

create table stock (
id int not null auto_increment, 
product_id int not null, 
qty_in_stock int not null,
supplier_id int not null,
primary key (id),

foreign key (supplier_id)
references supplier(id)
on delete cascade
on update cascade
);

create table shopping_cart_item(
id int not null auto_increment,
product_item_id int not null,
qty int not null,
primary key (id),

foreign key (product_item_id)
references product (id)
on delete cascade
on update cascade
);

create index idx_product_id on stock (product_id);
create index idx_supplier_id on stock(supplier_id);
create index idx_product_item_id on shopping_cart_item (product_item_id);


insert into first_user (email_address, phone_number, password)
values 
 ('john.doe@example.com', '555-101-2345', 'securePass123'),
  ('jane.smith@example.com', '555-101-2346', 'myPass456'),
  ('mark.jones@example.com', '555-101-2347', 'password789'),
  ('lisa.martin@example.com', '555-101-2348', 'password321'),
  ('chris.brown@example.com', '555-101-2349', 'strongPass999'),
  ('emma.white@example.com', '555-101-2350', 'password1001');
  
INSERT INTO product (product_id, SKU, qty_in_stock, price)
VALUES
  ('PROD001', 'SKUA123', 150, 29.99),
  ('PROD002', 'SKUB234', 350, 45.75),
  ('PROD003', 'SKUC345', 200, 12.50),
  ('PROD004', 'SKUD456', 500, 75.99),
  ('PROD005', 'SKUE567', 120, 19.99),
  ('PROD006', 'SKUF678', 80, 39.50);
  
select * from supplier;

INSERT INTO supplier (supplier_name)
VALUES
  ('Global Supplies Ltd.'),
  ('Tech Distributors Inc.'),
  ('Fast Goods Corp.'),
  ('Premium Products Co.'),
  ('Eco Solutions LLC'),
  ('Super Mart Enterprises');
  
  
INSERT INTO stock (product_id, qty_in_stock, supplier_id)
VALUES
  (1, 150, 1),  
  (2, 350, 2),  
  (3, 200, 3),
  (4, 500, 4),  
  (5, 120, 5),  
  (6, 80, 6); 
  
  insert into shopping_cart_item (product_item_id, qty)
  values
  (1, 3),
  (2, 2),
  (3, 1),
  (4, 4),
  (5, 5),
  (6, 2);

select * from supplier;
describe shopping_cart_item;

SELECT
  first_user.email_address AS username,
  shopping_cart_item.product_item_id,
  shopping_cart_item.qty
FROM
  first_user
JOIN
  shopping_cart_item
ON
  first_user.id = shopping_cart_item.user_id  -- Update with correct column
WHERE
  first_user.email_address = 'john.doe@example.com'
LIMIT 0, 1000;

  select * from first_user;

describe shopping_cart_item;

ALTER TABLE shopping_cart_item
ADD COLUMN user_id INT;

ALTER TABLE shopping_cart_item
ADD CONSTRAINT fk_user_id
FOREIGN KEY (user_id) REFERENCES first_user(id);

SELECT
  first_user.email_address AS username,
  shopping_cart_item.product_item_id,
  shopping_cart_item.qty
FROM
  first_user
JOIN
  shopping_cart_item
ON
  first_user.id = shopping_cart_item.user_id
WHERE
  first_user.email_address = 'john.doe@example.com'
LIMIT 0, 1000;

ALTER TABLE stock
ADD CONSTRAINT fk_product_id
FOREIGN KEY (product_id) REFERENCES product(id);

```sql
