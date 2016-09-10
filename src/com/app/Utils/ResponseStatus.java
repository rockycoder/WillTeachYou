package com.app.Utils;

import java.io.Serializable;

public class ResponseStatus implements Serializable
{

    /**
     * 
     */
    private static final long serialVersionUID = 8236431760003713910L;
    private String message;
    private Integer code;

    public ResponseStatus()
    {
        super();
        // TODO Auto-generated constructor stub
    }

    public ResponseStatus( Integer code,
        String message )
    {
        super();
        this.message = message;
        this.code = code;
    }

    @Override
    public int hashCode()
    {
        final int prime = 31;
        int result = 1;
        result = prime * result + ( ( code == null ) ? 0
            : code.hashCode() );
        result = prime * result + ( ( message == null ) ? 0
            : message.hashCode() );
        return result;
    }

    @Override
    public String toString()
    {
        return "ResponseStatus [message=" + message + ", code=" + code + "]";
    }

    @Override
    public boolean equals( Object obj )
    {
        if( this == obj )
            return true;
        if( obj == null )
            return false;
        if( getClass() != obj.getClass() )
            return false;
        ResponseStatus other = (ResponseStatus) obj;
        if( code == null )
        {
            if( other.code != null )
                return false;
        }
        else if( !code.equals( other.code ) )
            return false;
        if( message == null )
        {
            if( other.message != null )
                return false;
        }
        else if( !message.equals( other.message ) )
            return false;
        return true;
    }

    public String getMessage()
    {
        return message;
    }

    public ResponseStatus setMessage( String message )
    {
        this.message = message;
        return this;
    }

    public Integer getCode()
    {
        return code;
    }

    public ResponseStatus setCode( Integer code )
    {
        this.code = code;
        return this;
    }

}
