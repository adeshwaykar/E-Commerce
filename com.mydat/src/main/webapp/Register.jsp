<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@include file="componenet/common_css_js.jsp" %>
<style>body {
 background-image: url("Image/ba.jpg");
  height:1000px;
   background-attachment: fixed;
  background-size: cover;
 background-repeat: no-repeat, repeat;
 background-color: #cccccc;
}</style>

</head>
<body>
<%@include file="componenet/navBar.jsp" %>
<div class="container-fluid">
  <div class="row">
     <div class="clo-md-15 offset-md-5">
      <div class="card"> 
      <%@include file="componenet/massage.jsp" %>
      <div class="card-body px-5">
              <img src="Image/sign.jpg"></i>
            <!-- <h3 class="text-center my-3">Sign up here</h3> -->  
     <form action="ResgisterServlet" method="post">
         <div class="form-group">
	         <label for="name">User Name</label>
	         <input name="user_name" type="text" class="form-control" id="name" placeholder="enter here" aria-describedby="emailHelp" placeholder="Enter email">
        </div>
        <div class="form-group">
	         <label for="email">User Email</label>
	         <input name="Email" type="email" class="form-control" id="email" placeholder="enter here" aria-describedby="emailHelp" placeholder="Enter email">
        </div>
        <div class="form-group">
	         <label for="password">User Password</label>
	         <input name="pass" type="password" class="form-control" id="password" placeholder="enter here" aria-describedby="emailHelp" placeholder="Enter email">
        </div>
          <div class="form-group">
	         <label for="phone">User Phone</label>
	         <input name="mobile" type="number" class="form-control" id="phone" placeholder="enter here" aria-describedby="emailHelp" placeholder="Enter email">
        </div>
           <div class="form-group">
	         <label for="phone">Address</label>
	         <textarea name="address" style="height: 100px""width=200px" class="form-control" placeholder="enter your Address"></textarea>
          </div>
        
         <div class="container">
         <button class="btn btn-outline-success">Register</button>
          <button class="btn btn-outline-worning">Reset</button>
         
         </div>
     
     </form>
      
      
      </div>
      
      
      </div>
        
     
     
     </div>
  
  
  </div>

</div>
</body>
</html>