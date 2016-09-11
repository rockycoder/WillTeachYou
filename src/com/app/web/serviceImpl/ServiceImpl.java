package com.app.web.serviceImpl;

import java.util.List;
import com.app.pojo.RequestType;
import com.app.pojo.Topic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import com.app.persistance.AbstractDao;
import com.app.persistance.Filter;
import com.app.web.ServiceApi.ICustomerService;

@SuppressWarnings( "unchecked" )
@Service
public class ServiceImpl implements ICustomerService {

    @Autowired
    AbstractDao dao;

    @Override
    public Object save(Object cust) {
        return dao.save(cust);
    }

    @Override
    public void update(Object obj) {
        dao.update(obj);
    }

    @Override
    public int count(String className, List<Filter> filters, List<Object> values) {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public UserDetails loadUserByCustomername(Integer id)
            throws UsernameNotFoundException {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List<String> getProjectionData(String lClass, List<Filter> filters,
                                          List<Object> values, String projection) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List<RequestType> getVolunteerRequestList(List<Topic> topics) {
/*        topics.stream().forEach(topic -> {
        	if(topic exists )
        });*/
    	
        return null;
    }
}