<%@page import="com.mydata.model.User"%>
<%
User u1=(User)session.getAttribute("current-user");
if(u1==null)
{
	
	session.setAttribute("massage","you are not logged in ! !login first");
	response.sendRedirect("Login.jsp");
	return;
}else
{
	if(u1.getUserType().equals("admin"))
	{
		session.setAttribute("massage","you are not normal userx ! !do not access this page");
		response.sendRedirect("Login.jsp");
		return;
	}
}



%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>k</h1>
</body>
</html>