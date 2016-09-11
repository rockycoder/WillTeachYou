package com.app.web.ServiceApi;

import java.util.List;

import com.app.persistance.Filter;
import com.app.pojo.RequestType;
import com.app.pojo.Student;
import com.app.pojo.Topic;

import org.omg.CORBA.Request;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;


public interface ICustomerService {

    Object save(Object cust);

    void update(Object obj);

    int count(String className,
              List<Filter> filters,
              List<Object> values);

    List<String> getProjectionData(String lClass, List<Filter> filters, List<Object> values, String projection);

    UserDetails loadUserByCustomername(Integer id) throws UsernameNotFoundException;

    List<Student> getStudentAttendingList(String s);
    List<RequestType> getVolunteerRequestList(List<Topic> topics);

}