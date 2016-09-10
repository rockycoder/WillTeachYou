package com.app.web.serviceImpl;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.app.Persistance.AbstractDao;
import com.app.Persistance.Filter;
import com.app.Utils.MinimizedDetailUtil;
import com.app.Utils.PasswordEncryptionService;
import com.app.Utils.SocialLoginUtil;
import com.app.dto.CartSyncDto;
import com.app.dto.CustCartDto;
import com.app.dto.DiscountResponse;
import com.app.dto.GenericMinimizedProductsDetailsDto;
import com.app.dto.ItemDetail;
import com.app.dto.ReviewDto;
import com.app.pojo.AddressBook;
import com.app.pojo.Customers;
import com.app.pojo.CustomersBasket;
import com.app.pojo.Feedback;
import com.app.pojo.Orders;
import com.app.pojo.Reviews;
import com.app.pojo.TryKaroCoupon;
import com.app.pojo.Wishlist;
import com.app.web.ServiceApi.ICustomerService;
import com.app.pojo.ProductAvailabilityNotification;

@SuppressWarnings( "unchecked" )
@Service
public class ServiceImpl implements ICustomerService
{

    PasswordEncryptionService encryptionServive = new PasswordEncryptionService();
    public final static double DELIVERY_CHARGES = 30.0;

    @Autowired
    AbstractDao dao;
    Calendar calObj = Calendar.getInstance();

    @Override
    public Object save( Object cust )
    {

        return dao.save( cust );

    }

    @Override
    public void update( Object obj )
    {
        dao.update( obj );
    }

    @Override
    public Boolean addUpdatedCustomer( Customers cust )
    {
        return dao.addUpdatedCustomer( cust );
    }

    @Override
    public Boolean addFeedback( Feedback feedback )
    {
        return dao.addFeedback( feedback );
    }

    @Override
    public Boolean addSubscriber( String subscription )
    {
        return dao.addSubscriber( subscription );
    }

    @Override
    public int count( String className,
            List<Filter> filters,
            List<Object> values )
    {
        return dao.count( className,
                          filters,
                          values );
    }

    @Override
    public List<String> getProjectionData( String lClass,
            List<Filter> filters,
            List<Object> values,
            String projection )
    {

        return dao.getProjectionData( lClass,
                                      filters,
                                      values,
                                      projection );
    }

    @Override
    public List<GenericMinimizedProductsDetailsDto> findListPageData( String lClass,
            List<Filter> filters,
            List<Object> values,
            String pageNumber )
    {

        return MinimizedDetailUtil.getMinimizedDetailsList( dao.findAllData( lClass,
                                                                             filters,
                                                                             values,
                                                                             pageNumber ) );
    }

    @Override
    public Object findDetailPageData( String lClass,
            List<Filter> filters,
            List<Object> values,
            String pageNumber )
    {

        List<?> list = dao.findAllData( lClass,
                                        filters,
                                        values,
                                        pageNumber );
        return ( null != list && list.size() > 0 ) ? list.get( 0 )
            : null;
    }

    @Override
    public Boolean addWishlistItem( Wishlist wishlist )
    {
        return dao.addWishlistItem( wishlist );
    }

    @Override
    public Boolean addPasswordRecoveryCode( String iCode,
            Customers cust )
    {
        if( !iCode.isEmpty() && null != cust )
        {
            return dao.addPasswordRecoveryCode( iCode,
                                                cust );
        }

        return false;

    }

    @Override
    public Customers checkRecoveryCode( String iCode,
            String userId ) throws NoSuchAlgorithmException, InvalidKeySpecException
    {

        ArrayList<Filter> filters = new ArrayList<Filter>();
        filters.add( new Filter( "passwordRecoveryCode",
                                 "equal" ) );

        ArrayList<Object> values = new ArrayList<Object>();
        values.add( iCode );

        ArrayList<Customers> list = (ArrayList<Customers>) dao.findAllData( "Customers",
                                                                            filters,
                                                                            values,
                                                                            "" );
        if( CollectionUtils.isNotEmpty( list ) )
        {

            return list.get( 0 );

        }

        return null;

    }

    @Override
    public Customers getCustByPasswordRecoveryCode( String passwordGuid,
            String userId )
    {
        return dao.getCustByPasswordRecoveryCode( passwordGuid,
                                                  userId );
    }

    @Override
    public Orders generateOrder( AddressBook addressBookEntity,
            Customers cust,
            String paymentMethod )
    {
        return dao.generateOrder( addressBookEntity,
                                  cust,
                                  paymentMethod );
    }

    @Override
    public Boolean addCustomer( Customers cust )
    {
        return dao.addCustomer( cust );
    }

    @Override
    public Customers addSocialCustomer( SocialLoginUtil socLog )
    {
        return dao.addSocialCustomer( socLog );
    }

    @Override
    public UserDetails loadUserByCustomername( Integer id ) throws UsernameNotFoundException
    {
        return null;
    }

    @Override
    public String addItemInCustomerBasket( Integer lCategoriesId,
            Integer lProductId,
            Customers lCust,
            String lColor )
    {
        try
        {
            GenericMinimizedProductsDetailsDto product = dao.getProductDetails( lProductId,
                                                                                lCategoriesId );

            dao.removeCoupon( lCust );
            return dao.addToBasket( lCategoriesId,
                                    product,
                                    lCust,
                                    lColor );

        }
        catch( Exception ex )
        {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public DiscountResponse deleteItemInCustomerBasket( Integer lCategoriesId,
            Integer lProductId,
            Customers lCust,
            String lColor )
    {

        List<CustomersBasket> lItems = null;
        try
        {
            GenericMinimizedProductsDetailsDto product = dao.getProductDetails( lProductId,
                                                                                lCategoriesId );

            String resp = dao.deleteItemFromBasket( lCategoriesId,
                                                    product,
                                                    lCust,
                                                    lColor );
            if( resp.equalsIgnoreCase( "Success" ) )
            {
                lItems = (List<CustomersBasket>) dao.getAllCurrentCartItems( lCust );

                if( !CollectionUtils.isEmpty( lItems ) )
                {
                    return applyCouponOnDelete( lCust,
                                                lItems );
                }
            }

            return null;

        }
        catch( Exception ex )
        {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public CartSyncDto syncCartWithServer( List<CustCartDto> lProductList,
            Customers cust )
    {

        List<ItemDetail> itemDetails = dao.syncCart( lProductList,
                                                     cust );

        List<CustomersBasket> items = (List<CustomersBasket>) dao.getAllCurrentCartItems( cust );

        DiscountResponse discountResponse = null;

        if( !CollectionUtils.isEmpty( items ) )
        {
            discountResponse = applyCouponOnDelete( cust,
                                                    items );
        }

        CartSyncDto cartSync = new CartSyncDto( itemDetails,
                                                discountResponse );

        return cartSync;

    }

    @Override
    public Boolean addReview( ReviewDto lReviewDto )
    {
        Reviews review = new Reviews( lReviewDto );

        if( review != null )
        {
            review.setDateAdded( calObj.getTime() ).setLastModified( calObj.getTime() );
            dao.save( review );
            return true;
        }

        return false;

    }

    @Override
    public Boolean addNotification( ProductAvailabilityNotification ProductAvailabilityNotification )
    {
        if( ProductAvailabilityNotification != null )
        {
            ProductAvailabilityNotification.setDateAdded( calObj.getTime() );
            dao.save( ProductAvailabilityNotification );
            return true;
        }
        return false;
    }

    @Override
    public Integer getCountByEntity( Class<?> lEntity )
    {
        return dao.getCountByEntity( lEntity );
    }

       @Override
    public void updateCustomersBasketStatus( Customers cust,
            String status )
    {
        List<CustomersBasket> lBasketList = (List<CustomersBasket>) dao.getAllCurrentCartItems( cust );

        for( CustomersBasket item : lBasketList )
        {
            item.setStatus( status );
            item.setLastModified( calObj.getTime() );
            dao.update( item );
        }

    }

    @Override
    public DiscountResponse applyCoupon( Customers cust,
            TryKaroCoupon coupon )
    {

        double total = 0.0;
        List<CustomersBasket> items = (List<CustomersBasket>) dao.getAllCurrentCartItems( cust );
        DiscountResponse disResponse = new DiscountResponse();
        disResponse.setDiscountAmount( coupon.getCouponAmount() );

        disResponse.setCouponName( coupon.getCouponName() );
        for( CustomersBasket item : items )
        {
            item.setCoupon( coupon );
            total = total + item.getFinalPrice();
            dao.update( item );

        }
        disResponse.setBeforeDiscountAmount( total );

        double diff = 0.0;
        String percentage = coupon.getPercentage();
        if( null == percentage || StringUtils.isEmpty( percentage ) || percentage.equalsIgnoreCase( "0" ) )
        {
            diff = total - coupon.getCouponAmount();
        }
        else
        {
            double per = Double.parseDouble( percentage );
            disResponse.setDiscountAmount( total * ( per / 100 ) );
            diff = total - ( total * ( per / 100 ) );
        }

        if( diff < 0 )
        {
            disResponse.setAfterDiscountAmount( 0.0 );
            disResponse.setDeliveryAmount( DELIVERY_CHARGES );
        }
        else if( diff < 100 )
        {
            disResponse.setAfterDiscountAmount( diff );
            disResponse.setDeliveryAmount( DELIVERY_CHARGES );
        }
        else
        {
            disResponse.setAfterDiscountAmount( diff );
        }

        return disResponse;
    }

    public DiscountResponse applyCouponOnDelete( Customers cust,
            List<CustomersBasket> lItems )
    {

        double total = 0.0;
        DiscountResponse disResponse = new DiscountResponse();

        if( !CollectionUtils.isEmpty( lItems ) )
        {
            if( null != lItems.get( 0 ).getCoupon() && lItems.get( 0 ).getCoupon().getTryKaroCouponId() == 0 )
            {
                TryKaroCoupon coupon = lItems.get( 0 ).getCoupon();
                disResponse.setCouponName( coupon.getCouponName() );

                for( CustomersBasket item : lItems )
                {
                    item.setCoupon( lItems.get( 0 ).getCoupon() );
                    total = total + item.getFinalPrice();
                    dao.update( item );

                }
                disResponse.setBeforeDiscountAmount( total );
                disResponse.setDiscountAmount( coupon.getCouponAmount() );

                double diff = 0.0;
                double percentage = Double.parseDouble( coupon.getPercentage() );
                if( StringUtils.isEmpty( coupon.getPercentage() ) )
                {
                    diff = total - coupon.getCouponAmount();
                }
                else
                {
                    disResponse.setDiscountAmount( total * ( percentage / 100 ) );
                    diff = total - ( total * ( percentage / 100 ) );
                }

                if( diff < 0 )
                {
                    disResponse.setAfterDiscountAmount( 0.0 );
                    disResponse.setDeliveryAmount( DELIVERY_CHARGES );
                }
                else if( diff < 100 )
                {
                    disResponse.setAfterDiscountAmount( diff );
                    disResponse.setDeliveryAmount( DELIVERY_CHARGES );
                }
                else
                {
                    disResponse.setAfterDiscountAmount( diff );
                }

            }
            else
            {
                for( CustomersBasket item : lItems )
                {
                    total = total + item.getFinalPrice();
                }
                disResponse.setBeforeDiscountAmount( total );

                disResponse.setCouponName( null );
                disResponse.setDiscountAmount( 0.0 );
                if( total < 100 )
                {
                    disResponse.setDeliveryAmount( DELIVERY_CHARGES );
                    disResponse.setAfterDiscountAmount( total + DELIVERY_CHARGES );
                }
                else
                {
                    disResponse.setDeliveryAmount( 0 );
                    disResponse.setAfterDiscountAmount( total );
                }

            }

        }

        return disResponse;
    }

    @Override
    public DiscountResponse removeCoupon( Customers cust )
    {
        ArrayList<CustomersBasket> lList = (ArrayList<CustomersBasket>) dao.removeCoupon( cust );
        DiscountResponse response = new DiscountResponse();
        if( null != cust && CollectionUtils.isNotEmpty( lList ) )
        {
            double total = 0.0;
            for( CustomersBasket item : lList )
            {
                total = total + item.getFinalPrice();
            }
            response.setAfterDiscountAmount( total );
            response.setBeforeDiscountAmount( total );
            if( total < 100 )
            {
                response.setDeliveryAmount( 30 );
            }
            return response;
        }
        return null;
    }

	@Override
	public Orders updatePaytmOrderStatus(String orderNumber, Customers cust,
			String lStatus) {
		// TODO Auto-generated method stub
		return null;
	}
}
