<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.util.*,com.paytm.merchant.CheckSumServiceHelper,com.app.pojo.*,com.app.dto.*"%>
<%
    TreeMap<String, String> parameters = new TreeMap<String, String>();
    String paytmChecksum = "";

    parameters.put( "REQUEST_TYPE",
                    "DEFAULT" );
    parameters.put( "MID",
                    "BITIgn43050484647860" );
    parameters.put( "ORDER_ID",
                    "kjdsfjkfshdjsfdkksddd" );
    parameters.put( "CUST_ID",
                    "12" );
    parameters.put( "TXN_AMOUNT",
                    "50" );
    parameters.put( "CHANNEL_ID",
                    "WEB" );
    parameters.put( "INDUSTRY_TYPE_ID",
                    "Retail" );
    parameters.put( "WEBSITE",
                    "trykaro" );
    parameters.put( "MOBILE_NO",
                    "7777777777" );
    parameters.put( "EMAIL",
                    "gaurav@trykaro.in" );
    parameters.put( "CALLBACK_URL",
                    "http://localhost:8080/Trymeagain/pgResponse" );

    String checkSum = CheckSumServiceHelper.getCheckSumServiceHelper().genrateCheckSum( "DOmr#2nhzXjkm_NC",
                                                                                        parameters );

    StringBuilder outputHtml = new StringBuilder();
    outputHtml.append( "<!DOCTYPE html PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN' 'http://www.w3.org/TR/html4/loose.dtd'>" );
    outputHtml.append( "<html>" );
    outputHtml.append( "<head>" );
    outputHtml.append( "<title>Merchant Check Out Page</title>" );
    outputHtml.append( "</head>" );
    outputHtml.append( "<body>" );
    outputHtml.append( "<center><h1>Please do not refresh this page...</h1></center>" );
    outputHtml.append( "<form method='post' action='"
        + "https://pguat.paytm.com/oltp-web/processTransaction "
        + "' name='f1'>" );
    outputHtml.append( "<table border='1'>" );
    outputHtml.append( "<tbody>" );

    for( Map.Entry<String, String> entry : parameters.entrySet() )
    {
        String key = entry.getKey();
        String value = entry.getValue();
        outputHtml.append( "<input type='hidden' name='" + key + "' value='" + value + "'>" );
    }

    outputHtml.append( "<input type='hidden' name='CHECKSUMHASH' value='" + checkSum + "'>" );
    outputHtml.append( "</tbody>" );
    outputHtml.append( "</table>" );
    outputHtml.append( "<script type='text/javascript'>" );
    outputHtml.append( "document.f1.submit();" );
    outputHtml.append( "</script>" );
    outputHtml.append( "</form>" );
    outputHtml.append( "</body>" );
    outputHtml.append( "</html>" );
    out.println( outputHtml );
%>