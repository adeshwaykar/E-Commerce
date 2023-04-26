package com.mydata.servlets;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mydata.Dao.UserDao;
import com.mydata.connection.factoryProvider;
import com.mydata.model.User;

public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		try {
			
			String e=request.getParameter("email");
			String p=request.getParameter("password");
			
			UserDao user=new UserDao(factoryProvider.getfactory());
			User use=user.getUserByEmailAndPassword(e, p);
		//	System.out.println(use);
			
			HttpSession session=request.getSession();
			if(use==null)
			{
				session.setAttribute("massage","Invalid details! pls enter correct details");
				response.sendRedirect("Login.jsp");
				return;
			}
			else {
				out.println("<h1>welcome"+use.getUserName()+"</h1>");
			}
			
			session.setAttribute("current-user",use);
			if(use.getUserType().equals("admin"))
			{
				response.sendRedirect("admin.jsp");
			}else if (use.getUserType().equals("normal")) {
				response.sendRedirect("index.jsp");
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
