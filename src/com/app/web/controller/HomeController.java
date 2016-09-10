package com.app.web.controller;

/*Main website controller class 'HomeController */
import java.io.File;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.portlet.ModelAndView;

import com.app.Persistance.Filter;
import com.app.Utils.ApplicationException;
import com.app.Utils.DataAndUiUtils;
import com.app.Utils.DataValidation;
import com.app.Utils.GenerateGUID;
import com.app.Utils.PasswordEncryptionService;
import com.app.Utils.ResponseStatus;
import com.app.dto.ChangePassword;
import com.app.dto.CheckoutDto;
import com.app.dto.CustCartDto;
import com.app.dto.DiscountResponse;
import com.app.dto.GenericMinimizedProductsDetailsDto;
import com.app.dto.OperationProperties;
import com.app.dto.ReviewDto;
import com.app.dto.SocialUserDetail;
import com.app.dto.UserSignInDto;
import com.app.dto.UserSignUpDto;
import com.app.dto.WishlistDto;
import com.app.mail.MailGun_bkp;
import com.app.mail.MailMessageBuilder;

import com.app.pojo.AddressBook;
import com.app.pojo.BitIgnitorSubmitQuery;
import com.app.pojo.BitIgnitorSubscriber;
import com.app.pojo.Cosmetics;
import com.app.pojo.Customers;
import com.app.pojo.FragranceSpecificationEntity;
import com.app.pojo.Orders;
import com.app.pojo.PaymentDetails;

import com.app.pojo.TryKaroCoupon;
import com.app.web.ServiceApi.ICustomerService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.app.pojo.ProductAvailabilityNotification;

@Controller
@SessionAttributes( "userDetail" )
public class HomeController
{

    public static String serverError = "";

    @Autowired
    ICustomerService service;

    PasswordEncryptionService lPasswordEncryption = new PasswordEncryptionService();

    @Autowired
    private MailMessageBuilder mailMessageBuilder;

    private Gson gson = new Gson();

    private MailGun_bkp mailClient = new MailGun_bkp();

    volatile Integer flag = 0;

    Calendar calObj = Calendar.getInstance();

    private static final Logger log = Logger.getLogger( HomeController.class );

    @RequestMapping( method = { RequestMethod.GET, RequestMethod.POST }, value = "/*" )
    public String genericRequestMapper( Model model,
            HttpServletRequest request )
    {
        try
        {
            String mapping = request.getServletPath().toString().substring( 1 );
            if( DataAndUiUtils.requestMappings.containsKey( mapping ) )
            {
                return mapping;

            }
            return "pagenotfound";

        }
        catch( Exception ex )
        {

            return "errorcode";
        }
    }

    @RequestMapping( "/index" )
    public String index( Model model,
            HttpServletRequest request )
    {
        if( null == request.getSession().getAttribute( "userCheck" ) )
        {
            request.getSession().setAttribute( "userCheck",
                                               "first" );
            model.addAttribute( "presence",
                                "first" );
            return "index";
        }
        return "index";
    }

    @RequestMapping( "/store" )
    public String store( Model model,
            HttpServletRequest request )
    {
        return "redirect:index";
    }

    @RequestMapping( method = RequestMethod.GET, value = "/Student" )
    public String student( ModelMap model,
            HttpServletRequest request,
            HttpSession httpSession)
    {
        try
        {
            
            return "Student";
        }
        catch( Exception e )
        {
            log.error( e.getMessage() );
            return "errorcode";
        }
    }
    @RequestMapping( method = RequestMethod.GET, value = "/Company" )
    public String company( ModelMap model,
            HttpServletRequest request,
            HttpSession httpSession)
    {
        try
        {
            
            return "Company";
        }
        catch( Exception e )
        {
            log.error( e.getMessage() );
            return "errorcode";
        }
    }
    
    @RequestMapping( method = RequestMethod.GET, value = "/Volunteer" )
    public String volunteer( ModelMap model,
            HttpServletRequest request,
            HttpSession httpSession)
    {
        try
        {
            
            return "Volunteer";
        }
        catch( Exception e )
        {
            log.error( e.getMessage() );
            return "errorcode";
        }
    }


    
}
