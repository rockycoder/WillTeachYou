package com.app.Utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class DataValidation
{

    private static Pattern pattern;
    private static Matcher matcher;
    private static final String EMAIL_PATTERN = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
	    + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";

    public DataValidation()
    {

    }

    public static boolean emailValidation(final String hex)
	    throws ApplicationException {
	/**
	 * Validate hex with regular expression
	 * 
	 * @param hex
	 *            hex for validation
	 * @return true valid hex, false invalid hex
	 */
	pattern = Pattern.compile(EMAIL_PATTERN);
	matcher = pattern.matcher(hex);
	if (matcher.matches())
	{
	    return true;
	} else
	{
	    throw new ApplicationException("Wrong EMAIL format", 101);
	}

    }

    public static boolean userNameValidation(final String lUsername)
	    throws ApplicationException {

	if (lUsername.length() > 2)
	{
	    return true;
	} else
	{
	    throw new ApplicationException("Wrong Username format", 102);
	}

    }

    public static boolean messageValidation(final String lMessage)
	    throws ApplicationException {

	if (lMessage.length() > 2)
	{
	    return true;
	} else
	{
	    throw new ApplicationException("Wrong Message format", 103);
	}

    }

    



}
