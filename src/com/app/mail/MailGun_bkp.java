package com.app.mail;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.core.MediaType;

import org.springframework.http.HttpRequest;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.filter.HTTPBasicAuthFilter;
import com.sun.jersey.core.util.MultivaluedMapImpl;

public class MailGun_bkp
{

    public ClientResponse SendSimpleMessage( String toSend,
            String userId,
            String str,
            String from )
    {
        Client client = Client.create();
        client.addFilter( new HTTPBasicAuthFilter( "api",
                                                   "key-21df21291074f8d9e71226d0c44af1d5" ) );
        WebResource webResource = client.resource( "https://api.mailgun.net/v3/sandbox0ae79b2a0be6474d998c13f0105b911e.mailgun.org/messages" );
        MultivaluedMapImpl formData = new MultivaluedMapImpl();
        formData.add( "from",
                      from );
        formData.add( "to",
                      userId + "<" + toSend + ">" );
        formData.add( "subject",
                      "Welcome To TryKaro" );
        formData.add( "html",
                      str );
        return webResource.type( MediaType.APPLICATION_FORM_URLENCODED ).post( ClientResponse.class,
                                                                               formData );
    }
    
    public ClientResponse SendOrderMessage( String toSend,
            String userId,
            String str,
            String from )
    {
        Client client = Client.create();
        client.addFilter( new HTTPBasicAuthFilter( "api",
                                                   "key-21df21291074f8d9e71226d0c44af1d5" ) );
        WebResource webResource = client.resource( "https://api.mailgun.net/v3/sandbox0ae79b2a0be6474d998c13f0105b911e.mailgun.org/messages" );
        MultivaluedMapImpl formData = new MultivaluedMapImpl();
        formData.add( "from",
                      from );
        formData.add( "to",
                      userId + "<" + toSend + ">" );
        formData.add( "subject",
                      "TRYKARO : Your Order Is Confirmed" );
        formData.add( "html",
                      str );
        return webResource.type( MediaType.APPLICATION_FORM_URLENCODED ).post( ClientResponse.class,
                                                                               formData );
    }

    public ClientResponse resetPassword( String toSend,
            String page,
            String userName )
    {
        Client client = Client.create();
        client.addFilter( new HTTPBasicAuthFilter( "api",
                                                   "key-21df21291074f8d9e71226d0c44af1d5" ) );
        WebResource webResource = client.resource( "https://api.mailgun.net/v3/sandbox0ae79b2a0be6474d998c13f0105b911e.mailgun.org/messages" );
        MultivaluedMapImpl formData = new MultivaluedMapImpl();
        formData.add( "from",
                      "TryKaro Reset Password Assistance<admin@trykaro.in>" );
        formData.add( "to",
                      userName + "<" + toSend + ">" );
        if( userName != null && ( !userName.isEmpty() ) )
        {
            formData.add( "subject",
                          "Forgot Your Password?" );
        }
        else
        {
            formData.add( "subject",
                          "Forgot Your Password?" );
        }

        formData.add( "html",
                      page );
        return webResource.type( MediaType.APPLICATION_FORM_URLENCODED ).post( ClientResponse.class,
                                                                               formData );
    }

    public ClientResponse OrderConfirmation( String toSend,
            String userId,
            HttpServletRequest request )
    {
        Client client = Client.create();
        client.addFilter( new HTTPBasicAuthFilter( "api",
                                                   "key-21df21291074f8d9e71226d0c44af1d5" ) );
        WebResource webResource = client.resource( "https://api.mailgun.net/v3/sandbox0ae79b2a0be6474d998c13f0105b911e.mailgun.org/messages" );
        MultivaluedMapImpl formData = new MultivaluedMapImpl();
        formData.add( "from",
                      "TryKaro Order Assistance<admin@trykaro.in>" );
        if( userId != null )
        {
            formData.add( "to",
                          userId + "<" + toSend + ">" );
        }
        else
        {
            formData.add( "to",
                          "User" + "<" + toSend + ">" );
        }

        formData.add( "subject",
                      "Your Order Received" );
        request.getServletContext();
        //	formData.add("text", "Welcome to Trykaro . Your personal Trial Store ");
        return webResource.type( MediaType.APPLICATION_FORM_URLENCODED ).post( ClientResponse.class,
                                                                               formData );
    }

}
