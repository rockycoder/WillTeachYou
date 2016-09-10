package com.app.Persistance;

public class Filter
{
    private String filterValue;
    private String filterType;

    public Filter()
    {
        super();
        // TODO Auto-generated constructor stub
    }

    public String getFilterValue()
    {
        return filterValue;
    }

    public Filter setFilterValue( String filterValue )
    {
        this.filterValue = filterValue;
        return this;
    }

    public String getFilterType()
    {
        return filterType;
    }

    public Filter setFilterType( String filterType )
    {
        this.filterType = filterType;
        return this;
    }

    public Filter( String filterValue,
        String filterType )
    {
        super();
        this.filterValue = filterValue;
        this.filterType = filterType;
    }

}
