package com.mydata.Dao;

import java.util.List;

import javax.persistence.Lob;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.mydata.model.Product;

public class ProductDaoa {
	private SessionFactory factory;

	public ProductDaoa(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	
	public boolean saveProduct(Product p)
	{
		boolean f=false;
		try {
			Session s=this.factory.openSession();
			Transaction tx=s.beginTransaction();
			s.save(p);
			f=true;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			f=false;
		}
		return f;
	}

	public List<Product>getAllProduct()
	{
		Session s=this.factory.openSession();
	   Query query=s.createQuery("from Product");
	   List<Product>list=query.list();
	return list;
		
	}
	
	public List<Product>getProductById(int cid)
	{
		Session s=this.factory.openSession();
	   Query query=s.createQuery("from Product where category.categoryId=:id");
	   query.setParameter("id",cid );
	   List<Product>list=query.list();
	return list;
		
	}
	
	
	
}
