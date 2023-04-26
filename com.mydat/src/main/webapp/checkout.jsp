
<%
User u1=(User)session.getAttribute("current-user");
if(u1==null)
{
	
	session.setAttribute("massage","you are not logged in ! !login first");
	response.sendRedirect("Login.jsp");
	return;
}




%>












<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@include file="componenet/common_css_js.jsp" %>
<%@include file="componenet/background.jsp" %>
</head>
<body>
<%@include file="componenet/navBar.jsp" %>

<div class="container">
  <div class="row mt-5">
     <div class="col-md-6">
        <div class="card">
          <div class="card-body">
            <h3 class="text-center mb-2">Your Selected Product</h3>
            <div class="cart-body">
        
        </div>
          </div>
        
        </div>
      
     </div>
      <div class="col-md-6">
           
           <div class="card">
          <div class="card-body">
            <h3 class="text-center mb-2 ">Your Deatails</h3>
             <form action="#!">
               <div class="form-group">
                   <label for="exampleInputEmail1">Email address</label>
                    <input value="<%=user1.getUserEmail()%>"   type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
             </div>
             <div class="form-group">
                   <label for="exampleInputEmail1">Your Name</label>
                    <input  value="<%=user1.getUserName() %>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter name">
                    
             </div>
             <div class="form-group">
                   <label for="exampleInputEmail1">MObile no</label>
                    <input  value="<%=user1.getUserPhone() %>" type="number" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter phone number">
                    
             </div>
             <div class="form-group">
                 <label for="exampleFormControlTextarea1">Your shipping address</label>
                 <textarea value="<%=user1.getUserAddress() %>" class="form-control" id="exampleFormControlTextarea1" placeholder="Enter address" rows="3"></textarea>
           </div>
            
             <div class="container text-center	">
                 <button class="btn btn-outline-success">Order Now</button>
                 <button class="btn btn-outline-primary">Continue shipping</button>
             </div>
             </form>
          </div>
        
        </div>
     </div>
  
  </div>

</div>
</body>
</html>