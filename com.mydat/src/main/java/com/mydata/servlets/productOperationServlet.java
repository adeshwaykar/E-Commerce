package com.mydata.servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.mydata.Dao.CategoryDao;
import com.mydata.Dao.ProductDaoa;
import com.mydata.connection.factoryProvider;
import com.mydata.model.Category;
import com.mydata.model.Product;
@MultipartConfig
public class productOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public productOperationServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String op=request.getParameter("operation");	
		try{
		if(op.trim().equals("addcategory"))
		{
			
			String t=request.getParameter("catTitle");
			String d=request.getParameter("catDescription");
		
			Category c=new Category();
			c.setCategoryTitle(t);
			c.setCategoryDescription(d);
			
			CategoryDao c1=new CategoryDao(factoryProvider.getfactory());
			int catId=c1.saveCatogory(c);
			//out.println("category save");
			HttpSession http=request.getSession();
			http.setAttribute("massage","category added succrssfully"+catId);
			response.sendRedirect("admin.jsp");
			return;
		}
		else if (op.trim().equals("addproduct")) {
			
			String name=request.getParameter("pname");
			String desc=request.getParameter("pDesc");
			//String pic=request.getParameter("pic");
			
			int  prise=Integer.parseInt(request.getParameter("p_Price"));
			int discount=Integer.parseInt(request.getParameter("p_discount"));
			int quan=Integer.parseInt(request.getParameter("p_Quantity"));
			int c_id=Integer.parseInt(request.getParameter("catId"));
			Part file=request.getPart("pic");
			
			
			Product p=new Product();
			p.setpName(name);
			p.setpDiscription(desc);
			p.setpPrice(prise);
			p.setpDiscount(discount);
			p.setpQuantity(quan);
		   p.setpPhoto(file.getSubmittedFileName());
			System.out.println("ohk");
			
			//p.setCategory(category);
		
			
			CategoryDao cdao=new CategoryDao(factoryProvider.getfactory());
			Category category=cdao.getCategoryById(c_id);
			
			p.setCategory(category);
			
			ProductDaoa pd=new ProductDaoa(factoryProvider.getfactory());
			pd.saveProduct(p);
			
			//pic upload
			/*String path=request.getRealPath("Image")+File.separator+"product"+File.separator+file.getSubmittedFileName();
			System.out.println(path);*/
			String path="C:/Users/HP/OneDrive/Desktop/note taker/com.mydat/src/main/webapp/Image/product/"+file.getSubmittedFileName();
			System.out.println(path);
			//uploading image
			try{
			FileOutputStream fos=new FileOutputStream(path);
			InputStream fis=file.getInputStream();
			
			//reading data
			
			byte[]data=new byte[fis.available()];
			fis.read(data);
			fos.write(data);
			fos.close();
			}catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			}
			out.println("product save successfully");
			HttpSession http=request.getSession();
			http.setAttribute("massage","product added successfully");
			response.sendRedirect("admin.jsp");
			
		}
		
	}catch (Exception e) {
		System.out.println(e);
	}
	}
}
