package com.app.web.ServiceApi;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.List;

import com.app.Persistance.Filter;
import com.app.Utils.SocialLoginUtil;
import com.app.dto.CartSyncDto;
import com.app.dto.DiscountResponse;
import com.app.dto.GenericMinimizedProductsDetailsDto;

import com.app.dto.ReviewDto;
import com.app.pojo.AddressBook;
import com.app.pojo.Customers;
import com.app.pojo.Feedback;
import com.app.pojo.Orders;

import com.app.pojo.TryKaroCoupon;
import com.app.pojo.Wishlist;
import com.app.dto.CustCartDto;
import com.app.pojo.ProductAvailabilityNotification;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public interface ICustomerService
{

    Object save( Object cust );

    UserDetails loadUserByCustomername( Integer id ) throws UsernameNotFoundException;

    Boolean addCustomer( Customers cust );

    Boolean addFeedback( Feedback feedback );

    Boolean addNotification( ProductAvailabilityNotification ProductAvailabilityNotification );

    Boolean addSubscriber( String subscription );

    Boolean addWishlistItem( Wishlist wishlist );

    Boolean addPasswordRecoveryCode( String iCode,
            Customers cust );

    Customers checkRecoveryCode( String iCode,
            String userId ) throws NoSuchAlgorithmException, InvalidKeySpecException;

    Customers getCustByPasswordRecoveryCode( String passwordGuid,
            String userId );

    Orders generateOrder( AddressBook addressBookEntity,
            Customers cust,
            String paymentMethod );

    Boolean addUpdatedCustomer( Customers cust );

    String addItemInCustomerBasket( Integer categoriesId,
            Integer lProductId,
            Customers lCust,
            String lColor );

    Boolean addReview( ReviewDto lReviewDto );

    Customers addSocialCustomer( SocialLoginUtil socLog );

    Integer getCountByEntity( Class<?> lEntity );

    List<GenericMinimizedProductsDetailsDto> findListPageData( String lClass,
            List<Filter> filters,
            List<Object> values,
            String pageNumber );

    Object findDetailPageData( String lClass,
            List<Filter> filters,
            List<Object> values,
            String pageNumber );

    CartSyncDto syncCartWithServer( List<CustCartDto> lProductList,
            Customers cart );

    DiscountResponse deleteItemInCustomerBasket( Integer lCategoriesId,
            Integer lProductId,
            Customers lCust,
            String lColor );

    DiscountResponse applyCoupon( Customers cust,
            TryKaroCoupon coupon );

    void updateCustomersBasketStatus( Customers cust,
            String status );

    Orders updatePaytmOrderStatus( String orderNumber,
            Customers cust,
            String lStatus );

    DiscountResponse removeCoupon( Customers cust );

    void update( Object obj );

    int count( String className,
            List<Filter> filters,
            List<Object> values );

    List<String> getProjectionData( String lClass,
            List<Filter> filters,
            List<Object> values,
            String projection );


}
