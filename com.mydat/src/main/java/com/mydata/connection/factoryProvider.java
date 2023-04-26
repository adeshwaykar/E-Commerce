package com.mydata.connection;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class factoryProvider {
	private static SessionFactory factory;
	public static SessionFactory getfactory()
	{
		try {
			if(factory==null)
			{
			factory=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return factory;
	}

}
