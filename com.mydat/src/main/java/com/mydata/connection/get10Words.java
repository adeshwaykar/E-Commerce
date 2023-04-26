package com.mydata.connection;

import java.util.HashMap;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.mydata.model.Product;

public class get10Words {
	public static String get10words(String desc)
	{
		String[]str=desc.split(" ");
		
		if(str.length>10)
		{
			String res="";
			for(int i=0;i<10;i++)
			{
				
				res=res+str[i]+" ";
				
			}
			return (res+"....");
			
		}else
		{
			return desc+"..";
		}
	}

	
	
	public static Map<String, Long> getCounts(SessionFactory factory)
	{
		Session session=factory.openSession();
		String s1="select count(*) from User";
		String s2="select count(*) from Product";
		Query query1=session.createQuery(s1);
		Query query2=session.createQuery(s2);
		Query query3=session.createQuery("from Product",Product.class);
		
		
		Long userCount=(Long)query1.list().get(0);
		Long productCount=(Long)query2.list().get(0);
		
		Map<String,Long> map=new HashMap<String, Long>();
		map.put("userCount",userCount);
		map.put("productCount",productCount);
		
		session.close();
		return map;
	}
}
