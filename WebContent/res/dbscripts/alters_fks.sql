ALTER TABLE address_book 
ADD CONSTRAINT addbk_customers_id_fk
FOREIGN KEY (customers_id) 
REFERENCES customers(customers_id) 
ON DELETE CASCADE;

ALTER TABLE address_book 
ADD CONSTRAINT addbk_vendors_id_fk
FOREIGN KEY (vendors_id) 
REFERENCES vendors(vendors_id) 
ON DELETE CASCADE;

ALTER TABLE customers 
ADD CONSTRAINT cust_address_book_id_fk
FOREIGN KEY (address_book_id) 
REFERENCES address_book(address_book_id) 
ON DELETE CASCADE;

ALTER TABLE customers 
ADD CONSTRAINT cust_order_id_fk
FOREIGN KEY (orders_id) 
REFERENCES orders(orders_id) 
ON DELETE CASCADE;

ALTER TABLE customers 
ADD CONSTRAINT cust_customers_basket_id_fk
FOREIGN KEY (customers_basket_id) 
REFERENCES customers_basket(customers_basket_id) 
ON DELETE CASCADE;


ALTER TABLE customers_basket 
ADD CONSTRAINT cust_bsk_customers_id_fk
FOREIGN KEY (customers_id) 
REFERENCES customers(customers_id) 
ON DELETE CASCADE;

ALTER TABLE vendors 
ADD CONSTRAINT vend_address_book_id_fk
FOREIGN KEY (address_book_id) 
REFERENCES Address_book(address_book_id) 
ON DELETE CASCADE;


ALTER TABLE orders_products 
ADD CONSTRAINT ordprd_orders_id_fk
FOREIGN KEY (orders_id) 
REFERENCES orders(orders_id) 
ON DELETE CASCADE;

ALTER TABLE orders_products 
ADD CONSTRAINT ordprd_products_id_fk
FOREIGN KEY (products_id) 
REFERENCES products(products_id) 
ON DELETE CASCADE;


ALTER TABLE products 
ADD CONSTRAINT prds_products_id_fk
FOREIGN KEY (categories_id) 
REFERENCES categories(categories_id) 
ON DELETE CASCADE;

ALTER TABLE products_vendors 
ADD CONSTRAINT prdvend_vendors_id_fk
FOREIGN KEY (vendors_id) 
REFERENCES vendors(vendors_id) 
ON DELETE CASCADE;

ALTER TABLE products_vendors 
ADD CONSTRAINT prdvend_products_id_fk
FOREIGN KEY (products_id) 
REFERENCES products(products_id) 
ON DELETE CASCADE;

ALTER TABLE reviews 
ADD CONSTRAINT rvw_customers_id_fk
FOREIGN KEY (customers_id) 
REFERENCES customers(customers_id) 
ON DELETE CASCADE;

ALTER TABLE reviews 
ADD CONSTRAINT rvw_products_id_fk
FOREIGN KEY (products_id) 
REFERENCES products(products_id) 
ON DELETE CASCADE;
