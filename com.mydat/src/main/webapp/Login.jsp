<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User_Login-MyCart</title>
<%@include file="componenet/common_css_js.jsp" %>
<%@include file="componenet/background.jsp" %>
</head>
<body>
<%@include file="componenet/navBar.jsp" %>
<div class="container">
  <div class="row">
   <div class="col-md-3 offset-md-2"></div>
      <div class="card">
        <div class="card-header custom-bg text-white">
           <h3>Login Here</h3>
        
        </div>
        <div class="card-body">
        <%@include file="componenet/massage.jsp" %>
           <form action="loginServlet" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
  <a href="Register.jsp" class="text-center d-block mb-2">if not register click here</a>
  
 <div class="container text-center">
 
  <button type="submit" class="btn btn-primary border-0 custom-bg">Submit</button>
  <button type="reset" class="btn btn-primary custom-bg border-0">Reset</button>
</div>
</form>
        
        </div>
        
      </div>
       
  </div>
</div>
</body>
</html>