
package com.mydata.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.mydata.connection.factoryProvider;
import com.mydata.model.User;

public class ResgisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ResgisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		try {
			String n=request.getParameter("user_name");
			String e=request.getParameter("Email");
			String p=request.getParameter("pass");
			String m=request.getParameter("mobile");
			String a=request.getParameter("address");
			
			
			if(n.isEmpty())
			{
				out.println("Name is Blank");
			}
			
			User u=new User(n, e, p, m, "default.jpg", a,"normal");
			
		Session s=factoryProvider.getfactory().openSession();
		Transaction t=s.beginTransaction();

             int use=(Integer)s.save(u);
		t.commit();
		s.close();
		
		HttpSession httpsession=request.getSession();
		httpsession.setAttribute("massage","Register succesful!! uour id is"+use);
		response.sendRedirect("Login.jsp");
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
	}

}
