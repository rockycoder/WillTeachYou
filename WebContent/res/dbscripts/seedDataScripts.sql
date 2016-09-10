#CATEGORIES

update categories set category_name='Laptops' where categories_id=4

insert into categories values(categories_id,categories_image,category_name,date_added,last_modified,sortorder)
('4','res/Laptop.png','Laptop',null,null,null);

insert into categories values ('6','res/home.png','Appliances',null,null,null);
insert into categories values
(1,'/image.png',null,null,'Mobiles');

commit;
insert into categories values
(2,'/image.png',null,null,'Cameras');

commit;
insert into categories values
(3,'/image.png',null,null,'Tabelets');


# Reviews 

insert into reviews (reviews_id,date_added,last_modified,review_text,reviews_rating,reviews_read,customers_id,products_id) 
values (3001,null,null,'Samsung is a perfect phone for any app you want to present. Well organized, fully repsonsive and easy to customize are only some key features.','5',123,1,101);

insert into reviews (reviews_id,date_added,last_modified,review_text,reviews_rating,reviews_read,customers_id,products_id) 
values (3002,null,null,'Apple is a perfect phone for any app you want to present. Well organized, fully repsonsive and easy to customize are only some key features.','5',110,2,102);


#PRODUCTS


insert into products (products_id,products_date_added,products_image,products_model,products_price,categories_id,manufacturer_name)
values ( (select max(products_id) + 1 from products) , GETDATE ( ),'res/img/HTCOneMini.jpg','HTC One',42000,1,'HTC' );


insert into products (products_id,products_date_added,products_image,products_model,products_price,categories_id,manufacturer_name)
values ( (select max(products_id) + 1 from products) , GETDATE ( ),'res/img/oppo.jpg','Oppo N1',35000,1,'OPPO' );

insert into products (products_id,products_date_added,products_image,products_model,products_price,categories_id,manufacturer_name)
values ( (select max(products_id) + 1 from products) , GETDATE ( ),'res/img/HPlaptop.jpg','Hp Pavilon ',50000,4,'Hewlett Packard' );