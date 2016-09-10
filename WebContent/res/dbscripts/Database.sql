CREATE TABLE customers (
  customers_id NUMBER(10,0) NOT NULL,
  customers_gender char(1) NOT NULL,
  customers_firstname VARCHAR2(32) NOT NULL,
  customers_lastname VARCHAR2(32) NOT NULL,
  customers_dob TIMESTAMP NOT NULL,
  customers_email_address VARCHAR2(96) NOT NULL,
  customers_default_address_id NUMBER(10,0) NOT NULL,
  customers_telephone VARCHAR2(32) NOT NULL,
  customers_fax VARCHAR2(32),
  customers_password VARCHAR2(40) NOT NULL,
  customers_newsletter char(1),
  PRIMARY KEY(customers_id)
);

CREATE TABLE address_book (
  address_book_id NUMBER(10,0) NOT NULL,
  customers_id NUMBER(10,0) NOT NULL,
  entry_gender char(1) NOT NULL,
  entry_company VARCHAR2(32),
  entry_firstname VARCHAR2(32) NOT NULL,
  entry_lastname VARCHAR2(32) NOT NULL,
  entry_street_address VARCHAR2(64) NOT NULL,
  entry_suburb VARCHAR2(32),
  entry_postcode VARCHAR2(10) NOT NULL,
  entry_city VARCHAR2(32) NOT NULL,
  entry_state VARCHAR2(32),
  entry_country_id NUMBER(10,0) DEFAULT 0 NOT NULL,
  entry_zone_id NUMBER(10,0) DEFAULT 0 NOT NULL,
  PRIMARY KEY(address_book_id)
);

CREATE TABLE orders (
  orders_id NUMBER(10,0) NOT NULL,
  customers_id NUMBER(10,0) NOT NULL,
  customers_name VARCHAR2(64) NOT NULL,
  customers_company VARCHAR2(32),
  customers_street_address VARCHAR2(64) NOT NULL,
  customers_suburb VARCHAR2(32),
  customers_city VARCHAR2(32) NOT NULL,
  customers_postcode VARCHAR2(10) NOT NULL,
  customers_state VARCHAR2(32),
  customers_country VARCHAR2(32) NOT NULL,
  customers_telephone VARCHAR2(32) NOT NULL,
  customers_email_address VARCHAR2(96) NOT NULL,
  customers_address_format_id NUMBER(10,0) NOT NULL,
  delivery_name VARCHAR2(64) NOT NULL,
  delivery_company VARCHAR2(32),
  delivery_street_address VARCHAR2(64) NOT NULL,
  delivery_suburb VARCHAR2(32),
  delivery_city VARCHAR2(32) NOT NULL,
  delivery_postcode VARCHAR2(10) NOT NULL,
  delivery_state VARCHAR2(32),
  delivery_country VARCHAR2(32) NOT NULL,
  delivery_address_format_id NUMBER(10,0) NOT NULL,
  billing_name VARCHAR2(64) NOT NULL,
  billing_company VARCHAR2(32),
  billing_street_address VARCHAR2(64) NOT NULL,
  billing_suburb VARCHAR2(32),
  billing_city VARCHAR2(32) NOT NULL,
  billing_postcode VARCHAR2(10) NOT NULL,
  billing_state VARCHAR2(32),
  billing_country VARCHAR2(32) NOT NULL,
  billing_address_format_id NUMBER(10,0) NOT NULL,
  payment_method VARCHAR2(32) NOT NULL,
  cc_type VARCHAR2(20),
  cc_owner VARCHAR2(64),
  cc_number VARCHAR2(32),
  cc_expires VARCHAR2(4),
  last_modified TIMESTAMP,
  date_purchased TIMESTAMP,
  orders_status NUMBER(10,0) NOT NULL,
  orders_date_finished TIMESTAMP,
  currency char(3),
  currency_value NUMBER(14,6),
  PRIMARY KEY(orders_id)
);

CREATE TABLE products (
  products_id NUMBER(10,0) NOT NULL,
  products_quantity NUMBER(10,0) NOT NULL,
  products_model VARCHAR2(12),
  products_image VARCHAR2(64),
  products_price NUMBER(15,4) NOT NULL,
  products_date_added TIMESTAMP NOT NULL,
  products_last_modified TIMESTAMP,
  products_date_available TIMESTAMP,
  products_weight NUMBER(5,2) NOT NULL,
  products_status NUMBER(3,0) NOT NULL,
  products_tax_class_id NUMBER(10,0) NOT NULL,
  manufacturers_id NUMBER(10,0) NULL,
  products_ordered NUMBER(10,0) DEFAULT 0 NOT NULL,
  PRIMARY KEY(products_id)
);
CREATE INDEX idx_products_date_added ON products (products_date_added);
BEGIN EXECUTE IMMEDIATE 'DROP SEQUENCE products_SEQ'; EXCEPTION WHEN OTHERS THEN NULL; END;
CREATE SEQUENCE products_SEQ INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE ORDER;


CREATE TABLE reviews (
  reviews_id NUMBER(10,0) NOT NULL,
  products_id NUMBER(10,0) NOT NULL,
  customers_id int,
  customers_name VARCHAR2(64) NOT NULL,
  reviews_rating NUMBER(10,0),
  date_added TIMESTAMP,
  last_modified TIMESTAMP,
  reviews_read NUMBER(10,0) DEFAULT 0 NOT NULL,
  PRIMARY KEY(reviews_id)
);
BEGIN EXECUTE IMMEDIATE 'DROP SEQUENCE reviews_SEQ'; EXCEPTION WHEN OTHERS THEN NULL; END;
CREATE SEQUENCE reviews_SEQ INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE ORDER;

BEGIN EXECUTE IMMEDIATE 'DROP TABLE reviews_description'; EXCEPTION WHEN OTHERS THEN NULL; END;
CREATE TABLE reviews_description (
  reviews_id NUMBER(10,0) NOT NULL,
  languages_id NUMBER(10,0) NOT NULL,
  reviews_text VARCHAR2(4000) NOT NULL,
  PRIMARY KEY(reviews_id, languages_id)
);

CREATE TABLE categories (
  categories_id NUMBER(10,0) NOT NULL,
  categories_image VARCHAR2(64),
  parent_id NUMBER(10,0) DEFAULT 0 NOT NULL,
  sort_order NUMBER(10,0),
  date_added TIMESTAMP,
  last_modified TIMESTAMP,
  PRIMARY KEY(categories_id)
);
CREATE INDEX idx_categories_parent_id ON categories (parent_id);
BEGIN EXECUTE IMMEDIATE 'DROP SEQUENCE categories_SEQ'; EXCEPTION WHEN OTHERS THEN NULL; END;
CREATE SEQUENCE categories_SEQ INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE ORDER;

CREATE TABLE configuration (
  configuration_id NUMBER(10,0) NOT NULL,
  configuration_title VARCHAR2(64) NOT NULL,
  configuration_key VARCHAR2(64) NOT NULL,
  configuration_value VARCHAR2(255) NULL,
  configuration_description VARCHAR2(255) NOT NULL,
  configuration_group_id NUMBER(10,0) NOT NULL,
  sort_order NUMBER(10,0) NULL,
  last_modified TIMESTAMP NULL,
  date_added TIMESTAMP NOT NULL,
  use_function VARCHAR2(255) NULL,
  set_function VARCHAR2(255) NULL,
  PRIMARY KEY(configuration_id)
);
BEGIN EXECUTE IMMEDIATE 'DROP SEQUENCE configuration_SEQ'; EXCEPTION WHEN OTHERS THEN NULL; END;
CREATE SEQUENCE configuration_SEQ INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE ORDER;

CREATE TABLE customers_basket (
  customers_basket_id NUMBER(10,0) NOT NULL,
  customers_id NUMBER(10,0) NOT NULL,
  products_id VARCHAR2(255) NOT NULL,
  customers_basket_quantity NUMBER(10,0) NOT NULL,
  final_price NUMBER(15,4) NOT NULL,
  customers_basket_date_added char(8),
  PRIMARY KEY(customers_basket_id)
);
BEGIN EXECUTE IMMEDIATE 'DROP SEQUENCE customers_basket_SEQ'; EXCEPTION WHEN OTHERS THEN NULL; END;
CREATE SEQUENCE customers_basket_SEQ INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE ORDER;

CREATE TABLE customers_basket_attrs (
  customers_basket_attributes_id NUMBER(10,0) NOT NULL,
  customers_id NUMBER(10,0) NOT NULL,
  products_id VARCHAR2(255) NOT NULL,
  products_options_id NUMBER(10,0) NOT NULL,
  products_options_value_id NUMBER(10,0) NOT NULL,
  PRIMARY KEY(customers_basket_attributes_id)
);
BEGIN EXECUTE IMMEDIATE 'DROP SEQUENCE customers_basket_attrs_SEQ'; EXCEPTION WHEN OTHERS THEN NULL; END;
CREATE SEQUENCE customers_basket_attrs_SEQ INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE ORDER;

CREATE TABLE customers_info (
  customers_info_id NUMBER(10,0) NOT NULL,
  customers_info_date_last_logon TIMESTAMP,
  customers_info_number_of_logon NUMBER(10,0),
  customers_info_date_created TIMESTAMP,
  customers_info_date_modified TIMESTAMP,
  global_product_notifications NUMBER(10,0) DEFAULT 0,
  PRIMARY KEY(customers_info_id)
);

CREATE TABLE manufacturers (
  manufacturers_id NUMBER(10,0) NOT NULL,
  manufacturers_name VARCHAR2(32) NOT NULL,
  manufacturers_image VARCHAR2(64),
  date_added TIMESTAMP NULL,
  last_modified TIMESTAMP NULL,
  PRIMARY KEY(manufacturers_id)
);
CREATE INDEX IDX_MANUFACTURERS_NAME ON manufacturers (manufacturers_name);
BEGIN EXECUTE IMMEDIATE 'DROP SEQUENCE manufacturers_SEQ'; EXCEPTION WHEN OTHERS THEN NULL; END;
CREATE SEQUENCE manufacturers_SEQ INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE ORDER;

BEGIN EXECUTE IMMEDIATE 'DROP TABLE manufacturers_info'; EXCEPTION WHEN OTHERS THEN NULL; END;
CREATE TABLE manufacturers_info (
  manufacturers_id NUMBER(10,0) NOT NULL,
  languages_id NUMBER(10,0) NOT NULL,
  manufacturers_url VARCHAR2(255) NOT NULL,
  url_clicked NUMBER(10,0) DEFAULT 0 NOT NULL,
  date_last_click TIMESTAMP NULL,
  PRIMARY KEY(manufacturers_id, languages_id)
);

CREATE TABLE orders_products (
  orders_products_id NUMBER(10,0) NOT NULL,
  orders_id NUMBER(10,0) NOT NULL,
  products_id NUMBER(10,0) NOT NULL,
  products_model VARCHAR2(12),
  products_name VARCHAR2(64) NOT NULL,
  products_price NUMBER(15,4) NOT NULL,
  final_price NUMBER(15,4) NOT NULL,
  products_tax NUMBER(7,4) NOT NULL,
  products_quantity NUMBER(10,0) NOT NULL,
  PRIMARY KEY(orders_products_id)
);
BEGIN EXECUTE IMMEDIATE 'DROP SEQUENCE orders_products_SEQ'; EXCEPTION WHEN OTHERS THEN NULL; END;
CREATE SEQUENCE orders_products_SEQ INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE ORDER;

CREATE TABLE orders_status (
  orders_status_id NUMBER(10,0) DEFAULT 0 NOT NULL,
  language_id NUMBER(10,0) DEFAULT 1 NOT NULL,
  orders_status_name VARCHAR2(32) NOT NULL,
  PRIMARY KEY(orders_status_id, language_id)
);
CREATE INDEX idx_orders_status_name ON orders_status (orders_status_name);

BEGIN EXECUTE IMMEDIATE 'DROP TABLE orders_status_history'; EXCEPTION WHEN OTHERS THEN NULL; END;
CREATE TABLE orders_status_history (
  orders_status_history_id NUMBER(10,0) NOT NULL,
  orders_id NUMBER(10,0) NOT NULL,
  orders_status_id NUMBER(10,0) NOT NULL,
  date_added TIMESTAMP NOT NULL,
  customer_notified NUMBER(10,0) DEFAULT 0,
  comments VARCHAR2(4000),
  PRIMARY KEY(orders_status_history_id)
);
BEGIN EXECUTE IMMEDIATE 'DROP SEQUENCE orders_status_history_SEQ'; EXCEPTION WHEN OTHERS THEN NULL; END;
CREATE SEQUENCE orders_status_history_SEQ INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE ORDER;

CREATE TABLE products_description (
  products_id NUMBER(10,0) NOT NULL,
  language_id NUMBER(10,0) DEFAULT 1 NOT NULL,
  products_name VARCHAR2(64) NOT NULL,
  products_description VARCHAR2(4000),
  products_url VARCHAR2(255) default NULL,
  products_viewed NUMBER(10,0) DEFAULT 0,
  PRIMARY KEY(products_id,language_id)
);
CREATE INDEX products_name ON products_description (products_name);
BEGIN EXECUTE IMMEDIATE 'DROP SEQUENCE products_description_SEQ'; EXCEPTION WHEN OTHERS THEN NULL; END;
CREATE SEQUENCE products_description_SEQ INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE ORDER;

CREATE TABLE products_notifications (
  products_id NUMBER(10,0) NOT NULL,
  customers_id NUMBER(10,0) NOT NULL,
  date_added TIMESTAMP NOT NULL,
  PRIMARY KEY(products_id, customers_id)
);

CREATE TABLE specials (
  specials_id NUMBER(10,0) NOT NULL,
  products_id NUMBER(10,0) NOT NULL,
  specials_new_products_price NUMBER(15,4) NOT NULL,
  specials_date_added TIMESTAMP,
  specials_last_modified TIMESTAMP,
  expires_date TIMESTAMP,
  date_status_change TIMESTAMP,
  status NUMBER(10,0) DEFAULT 1 NOT NULL,
  PRIMARY KEY(specials_id)
);
BEGIN EXECUTE IMMEDIATE 'DROP SEQUENCE specials_SEQ'; EXCEPTION WHEN OTHERS THEN NULL; END;
CREATE SEQUENCE specials_SEQ INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE ORDER;

BEGIN EXECUTE IMMEDIATE 'DROP TABLE geo_zones'; EXCEPTION WHEN OTHERS THEN NULL; END;
CREATE TABLE geo_zones (
  geo_zone_id NUMBER(10,0) NOT NULL,
  geo_zone_name VARCHAR2(32) NOT NULL,
  geo_zone_description VARCHAR2(255) NOT NULL,
  last_modified TIMESTAMP NULL,
  date_added TIMESTAMP NOT NULL,
  PRIMARY KEY(geo_zone_id)
);
BEGIN EXECUTE IMMEDIATE 'DROP SEQUENCE geo_zones_SEQ'; EXCEPTION WHEN OTHERS THEN NULL; END;
CREATE SEQUENCE geo_zones_SEQ INCREMENT BY 1 START WITH 1 NOMAXVALUE NOCYCLE NOCACHE ORDER;
