package com.me.finalproject.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;



public abstract class DAO {
	
	private static final ThreadLocal sessionThread = new ThreadLocal();
    private static final SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();

    protected DAO() {
    }

    public static Session getSession()
    {
        Session session = (Session) DAO.sessionThread.get();
        
        if (session == null)
        {
            session = sessionFactory.openSession();
            DAO.sessionThread.set(session);
        }
        return session;
    }
	
	protected void begin(){
		getSession().beginTransaction();
	}
	
	protected void commit(){
		getSession().getTransaction().commit();
	}
	
	protected void rollback(){
		getSession().getTransaction().rollback();
	}
	
	public void close(){
		getSession().close();
	}
	
}
