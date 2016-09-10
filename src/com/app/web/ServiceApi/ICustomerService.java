package com.app.web.ServiceApi;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.List;

import com.app.Persistance.Filter;


import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public interface ICustomerService
{

    Object save( Object cust );

    UserDetails loadUserByCustomername( Integer id ) throws UsernameNotFoundException;



    void update( Object obj );

    int count( String className,
            List<Filter> filters,
            List<Object> values );

    List<String> getProjectionData( String lClass,
            List<Filter> filters,
            List<Object> values,
            String projection );


}
