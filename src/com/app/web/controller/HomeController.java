package com.app.web.controller;

/*Main website controller class 'HomeController */


import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.SessionAttributes;

import com.app.Utils.PasswordEncryptionService;

import com.app.mail.MailGun_bkp;
import com.app.mail.MailMessageBuilder;


import com.app.web.ServiceApi.ICustomerService;

import com.google.gson.Gson;



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

    @RequestMapping( method = RequestMethod.GET, value = "/login" )
    public String login( ModelMap model,
            HttpServletRequest request,
            HttpSession httpSession)
    {
        try
        {
            
            return "login";
        }
        catch( Exception e )
        {
            log.error( e.getMessage() );
            return "errorcode";
        }
    }
    
    


    
}
