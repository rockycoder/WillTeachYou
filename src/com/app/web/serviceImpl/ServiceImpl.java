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
import com.app.Utils.PasswordEncryptionService;
import com.app.web.ServiceApi.ICustomerService;


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
	public UserDetails loadUserByCustomername(Integer id)
			throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int count(String className, List<Filter> filters, List<Object> values) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<String> getProjectionData(String lClass, List<Filter> filters,
			List<Object> values, String projection) {
		// TODO Auto-generated method stub
		return null;
	}

    
}
