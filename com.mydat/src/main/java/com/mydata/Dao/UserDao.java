package com.mydata.Dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.mydata.model.Category;
import com.mydata.model.User;

public class UserDao {

	private SessionFactory factory;

	public UserDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	public User getUserByEmailAndPassword(String email,String pass)
	{
		User u=null;
		
		try {
			String query="from User where userEmail=:e and userPassword=:p";
			Session s=this.factory.openSession();
      Query q=s.createQuery(query);
      q.setParameter("e",email);
      q.setParameter("p",pass);
      u=(User) q.uniqueResult();
			
			s.close();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return u;
	}
	
	public List<Category> getCategories()
	{
		Session s=this.factory.openSession();
		Query query=s.createQuery("from Category");
		List<Category>list=query.list();
		return list;
	}
	
}
