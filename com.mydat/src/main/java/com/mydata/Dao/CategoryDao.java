package com.mydata.Dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.mydata.model.Category;

public class CategoryDao {
	private SessionFactory factory;

	public CategoryDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	
	public int saveCatogory(Category cat)
	{
		Session se =this.factory.openSession();
		Transaction t=se.beginTransaction();
	Serializable catId=se.save(cat);
		t.commit();
		se.close();
		return (Integer) catId;
		
	}
	
	
	public List<Category> getCatogory()
	{
		Session ses=this.factory.openSession();
		Query q=ses.createQuery("from Category");
		List<Category>list=q.list();
		return list;
	}

	public Category getCategoryById(int cid)
	{
		Category cat=null;
		try {
			
			Session session=this.factory.openSession();
			cat=session.get(Category.class,cid);
			session.close();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		return cat;
	}
}
