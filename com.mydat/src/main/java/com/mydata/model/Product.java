	package com.mydata.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;

@Entity
public class Product {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int pId;
	private String pName;
	@Column(length=3000)
	private String pDiscription;
	private String pPhoto;
	private int pPrice;
	private int pDiscount;
	private int pQuantity;
	
	@ManyToOne
   private Category category;
	
	
	public Product() {
		// TODO Auto-generated constructor stub
	}


	public Product(int pId, String pName, String pDiscription, String pPhoto, int pPrice, int pDiscount,
			int pQuantity) {
	
		this.pId = pId;
		this.pName = pName;
		this.pDiscription = pDiscription;
		this.pPhoto = pPhoto;
		this.pPrice = pPrice;
		this.pDiscount = pDiscount;
		this.pQuantity = pQuantity;
	}

	public Product(String pName, String pDiscription, String pPhoto, int pPrice, int pDiscount, int pQuantity,
			Category category) {
		super();
		this.pName = pName;
		this.pDiscription = pDiscription;
		this.pPhoto = pPhoto;
		this.pPrice = pPrice;
		this.pDiscount = pDiscount;
		this.pQuantity = pQuantity;
		this.category = category;
	}


	public int getpId() {
		return pId;
	}


	public void setpId(int pId) {
		this.pId = pId;
	}


	public String getpName() {
		return pName;
	}


	public void setpName(String pName) {
		this.pName = pName;
	}


	public String getpDiscription() {
		return pDiscription;
	}


	public void setpDiscription(String pDiscription) {
		this.pDiscription = pDiscription;
	}


	public String getpPhoto() {
		return pPhoto;
	}


	public void setpPhoto(String pPhoto) {
		this.pPhoto = pPhoto;
	}


	public int getpPrice() {
		return pPrice;
	}


	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	
	


	public int getpDiscount() {
		return pDiscount;
	}


	public void setpDiscount(int pDiscount) {
		this.pDiscount = pDiscount;
	}


	public int getpQuantity() {
		return pQuantity;
	}


	public void setpQuantity(int pQuantity) {
		this.pQuantity = pQuantity;
	}


	
	
	public Category getCategory() {
		return category;
	}


	public void setCategory(Category category) {
		this.category = category;
	}


	@Override
	public String toString() {
		return "Product [pId=" + pId + ", pName=" + pName + ", pDiscription=" + pDiscription + ", pPhoto=" + pPhoto
				+ ", pPrice=" + pPrice + ", pDiscount=" + pDiscount + ", pQuantity=" + pQuantity + "]";
	}
	
	
	
	public int getpriseafterDiscount()
	{
		int a=(int)((this.getpDiscount()/100.0)*this.getpPrice());
		return this.getpPrice()-a;
	}
	

}
