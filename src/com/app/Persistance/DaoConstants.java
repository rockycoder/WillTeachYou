package com.app.Persistance;

public class DaoConstants {

	public static final int POPULAR_MIN = 0;
	public static final int POPULAR_MAX = 5;

	/*
	 * HQL QUERIES START
	 */

	// public static final String FIND_USER_BY_ID="from User where ";
	public static final String IS_BRAND_PRESENT = "from LatestPhoneSpecifications where brandName=:bid";
	public static final String FIND_ALL_MIN_SPECS_BY_BRAND = "Select productName,screenSize,camera,operatingSystem,processor,ram,image1,price from LatestPhoneSpecifications where brandName=:bid";
	public static final String FIND_ALL_MIN_SPECS = "Select productName,screenSize,camera,operatingSystem,processor,ram,image1,price from LatestPhoneSpecifications where isDeleted =:isDel";
	// public static final String
	// FIND_ALL_MIN_SPECS_BY_BRAND="from Phonespecificationentity where BrandName=:bid";
	// public static final String
	// FIND_ALL_MIN_SPECS="from Phonespecificationentity";

	public static final String FIND_CUSTOMER_BY_ID = "from Customers where customersId=:cid";
	public static final String FIND_BY_ID = "from sample where id=?";
	public static final String ALL_CATEGORIES = "from Categories";
	public static final String ALL_PRODUCTS = "from Products";
	public static final String GET_ALL_PRODUCTS_BY_CATEGORY = "from Categories c where c.categoriesId=:cid";
	public static final String ALL_REVIEWS = "from Reviews";
	public static final String GET_LATEST_PRODUCTS = "FROM Products p ORDER BY p.productsDateAdded asc";
	public static final String GET_POPULAR_PRDUCTS = "FROM Products p ORDER BY p.productsViewed,p.productsOrdered asc";
	public static final String GET_POPULAR_PRODUCTS_BY_CATEGORYID = "SELECT productses  FROM Categories c where c.categoriesId=:cid";
	public static final String GET_LATEST_PRODUCTS_BY_CATEGORY_ID = "SELECT productses  FROM Categories c where c.categoriesId=:cid";
	public static final String GET_TOP_PRODUCT = "FROM Products p order by p.productsOrdered,p.productsViewed desc limit 1";

	public static final String FIND_CUSTOMER_BY_EMAIL = "from Customers where customersEmailAddress=:emailId";
	public static final String FIND_CUSTOMER_BY_USERID = "from Customers where customersId=:userId";
	public static final String FIND_CUSTOMER_BY_EMAIL_AND_MOBILE = "from Customers where customersEmailAddress=:emailId AND customersTelephone=:mobile";
	public static final String FIND_CUSTOMER_BY_MOBILE = "from Customers where customersTelephone=:mobile";
	public static final String FIND_PRODUCT_BY_ID = "from Products where productsId=:pid";
	public static final String FIND_CUSTOMERS_BY_ID = "from Customers where customersId=:cid";
	public static final String CHECK_CUSTOMER_PRESENT_ON_RECOVERY_ID = "from Customers where passwordRecoveryCode=:iCode";
	/*
	 * HQL QUERIES END
	 */
}
