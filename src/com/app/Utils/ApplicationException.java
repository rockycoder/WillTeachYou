package com.app.Utils;

public class ApplicationException extends Exception
{

    /**
	 * 
	 */

    private static final long serialVersionUID = 696918474459394024L;

    private String errorMsg;
    private Integer errorCode;

    public ApplicationException(String errorMsg, Integer errorCode)
    {
	super();
	this.errorMsg = errorMsg;
	this.errorCode = errorCode;
    }

    public String getErrorMsg() {
	return errorMsg;
    }

    public void setErrorMsg(String errorMsg) {
	this.errorMsg = errorMsg;
    }

    public Integer getErrorCode() {
	return errorCode;
    }

    public void setErrorCode(Integer errorCode) {
	this.errorCode = errorCode;
    }

    public ApplicationException()
    {
	super();
	// TODO Auto-generated constructor stub
    }

    public ApplicationException(String arg0, Throwable arg1, boolean arg2,
	    boolean arg3)
    {
	super(arg0, arg1, arg2, arg3);
	// TODO Auto-generated constructor stub
    }

    public ApplicationException(String arg0, Throwable arg1)
    {
	super(arg0, arg1);
	// TODO Auto-generated constructor stub
    }

    public ApplicationException(String arg0)
    {
	super(arg0);

    }

    public ApplicationException(Throwable arg0)
    {
	super(arg0);
	// TODO Auto-generated constructor stub
    }

}
