package com.app.Persistance;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.app.Utils.ApplicationException;


@SuppressWarnings( "unchecked" )
@Service( "dao" )
@Transactional
public class AbstractDao extends CustomDaoSupport
{

    private static int pageSize = 20;
    public final static double DELIVERY_CHARGES = 30.0;
    private static final AtomicLong LAST_TIME_MS = new AtomicLong();

    public static long uniqueCurrentTimeMS()
    {
        long now = System.currentTimeMillis();
        while( true )
        {
            long lastTime = LAST_TIME_MS.get();
            if( lastTime >= now )
                now = lastTime + 1;
            if( LAST_TIME_MS.compareAndSet( lastTime,
                                            now ) )
                return now;
        }
    }

    Calendar calObj = Calendar.getInstance();

    protected Session getSession() throws ApplicationException
    {

        SessionFactory sf = getHibernateTemplate().getSessionFactory();
        if( sf != null )
        {
            Session session = sf.openSession();
            if( session != null )
            {
                return session;
            }
            else
            {
                throw new ApplicationException( "Hibernate Session NOt Created" );
            }
        }
        else
        {
            throw new ApplicationException( "Hibernate Session Factory Not created " );
        }

    }

    protected void closeSession( Session session )
    {
        if( session != null )
        {
            session.close();
        }

    }

    public Object save( Object entity )
    {
        return getHibernateTemplate().save( entity );
    }

    public void update( Object entity )
    {
        getHibernateTemplate().update( entity );
    }

    public void delete( Object entity )
    {
        getHibernateTemplate().delete( entity );
    }

    private List<?> getPaginationData( Session session,
            Query query,
            Integer pageNumber )
    {
        Transaction tx = null;
        List<?> result = null;
        try
        {
            tx = session.getTransaction();
            tx.begin();
            query.setFirstResult( pageSize * ( pageNumber - 1 ) );
            query.setMaxResults( pageSize );
            result = query.list();
            return result;
        }
        catch( Exception ex )
        {
            ex.printStackTrace();
        }
        finally
        {
            tx.commit();
        }
        return null;
    }

    public int count( String className,
            List<Filter> filters,
            List<Object> values )
    {

        Session session = null;
        int count = 0;
        try
        {
            session = getSession();
            String query = PersistanceUtils.createQuery( className,
                                                         filters,
                                                         values );
            query = "select count(*) " + query;
            Query dbQuery = session.createQuery( query );

            if( values != null )
            {
                if( !StringUtils.isEmpty( query ) )
                {

                    for( Object value : values )
                    {
                        if( !StringUtils.isEmpty( value ) )
                        {
                            dbQuery.setParameter( "value" + count,
                                                  value );

                        }
                        count++;
                    }

                }
            }

            int resultCount = ( (Long) dbQuery.uniqueResult() ).intValue();

            return resultCount;

        }
        catch( Exception e )
        {
            e.printStackTrace();
        }
        finally
        {
            closeSession( session );
        }
        return 0;
    }

    public List<String> getProjectionData( String className,
            List<Filter> filters,
            List<Object> values,
            String projection )
    {

        Session session = null;
        int count = 0;
        List<String> result = null;
        try
        {
            session = getSession();
            String query = PersistanceUtils.createQuery( className,
                                                         filters,
                                                         values );
            query = "select " + projection + " " + query;
            Query dbQuery = session.createQuery( query );

            if( values != null )
            {
                if( !StringUtils.isEmpty( query ) )
                {

                    for( Object value : values )
                    {
                        if( !StringUtils.isEmpty( value ) )
                        {
                            dbQuery.setParameter( "value" + count,
                                                  value );

                        }
                        count++;
                    }

                }
            }

            result = dbQuery.list();

            return result;

        }
        catch( Exception e )
        {
            e.printStackTrace();
        }
        finally
        {
            closeSession( session );
        }
        return null;
    }

    public List<?> findAllData( String className,
            List<Filter> filters,
            List<Object> values,
            String pageNumber )
    {

        Session session = null;
        int count = 0;
        List<?> result = null;
        try
        {
            session = getSession();
            String query = PersistanceUtils.createQuery( className,
                                                         filters,
                                                         values );
            Query dbQuery = session.createQuery( query );

            if( values != null )
            {
                if( !StringUtils.isEmpty( query ) )
                {

                    for( Object value : values )
                    {
                        if( !StringUtils.isEmpty( value ) )
                        {
                            dbQuery.setParameter( "value" + count,
                                                  value );

                        }
                        count++;
                    }

                }
            }

            if( !StringUtils.isEmpty( pageNumber ) )
            {

                result = getPaginationData( session,
                                            dbQuery,
                                            Integer.parseInt( pageNumber ) );

            }
            else
            {

                result = dbQuery.list();

            }

            return result;

        }
        catch( Exception e )
        {
            e.printStackTrace();
        }
        finally
        {
            closeSession( session );
        }
        return null;
    }

    public Object findUniqueData( String className,
            List<Filter> filters,
            List<Object> values,
            String pageNumber )
    {

        Session session = null;
        int count = 0;
        try
        {
            session = getSession();
            String query = PersistanceUtils.createQuery( className,
                                                         filters,
                                                         values );
            Query dbQuery = session.createQuery( query );

            if( values != null )
            {
                if( !StringUtils.isEmpty( query ) )
                {

                    for( Object value : values )
                    {
                        if( !StringUtils.isEmpty( value ) )
                        {
                            dbQuery.setParameter( "value" + count,
                                                  value );

                        }
                        count++;
                    }

                }
            }

            Object result = dbQuery.uniqueResult();

            session.update( result );

            return result;

        }
        catch( Exception e )
        {
            e.printStackTrace();
        }
        finally
        {
            closeSession( session );
        }
        return null;
    }

    

    public Integer findCount( String className,
            List<Filter> filters,
            List<Object> values )
    {
        Session session = null;
        int count = 0;
        try
        {
            session = getSession();
            String query = PersistanceUtils.createQuery( className,
                                                         filters,
                                                         values );
            Query dbQuery = session.createQuery( query );

            if( values != null )
            {
                if( !StringUtils.isEmpty( query ) )
                {

                    for( Object value : values )
                    {
                        if( !StringUtils.isEmpty( value ) )
                        {
                            dbQuery.setParameter( "value" + count,
                                                  value );

                        }
                        count++;
                    }

                }
            }

            return 1;

        }
        catch( Exception e )
        {
            e.printStackTrace();
        }
        finally
        {
            closeSession( session );
        }
        return 1;
    }

   
   

}
