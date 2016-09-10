package com.app.Persistance;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
@Service
public abstract class CustomDaoSupport extends HibernateDaoSupport {
	@Autowired
    public void setSessionFactoryCustom(SessionFactory sessionFactory)
    {
        setSessionFactory(sessionFactory);
    }
}
