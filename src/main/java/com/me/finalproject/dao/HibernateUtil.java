package com.me.finalproject.dao;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

@SuppressWarnings("deprecation")
public class HibernateUtil {
	public static final SessionFactory sessionFactory;
	
	static{
		try{
			sessionFactory = new Configuration().configure().buildSessionFactory(); 
		}catch(Throwable ex){
			System.out.println(ex);
			System.out.println("Error in SessionFactory initialization");
			throw new ExceptionInInitializerError();
		}
		
	}
	
	public static SessionFactory getSessionFactory(){
		return sessionFactory;
	}
}
