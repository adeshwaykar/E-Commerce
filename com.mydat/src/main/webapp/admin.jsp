<%@page import="java.util.Map"%>
<%@page import="com.mydata.connection.get10Words"%>
<%@page import="java.util.List"%>
<%@page import="com.mydata.connection.factoryProvider"%>
<%@page import="com.mydata.Dao.CategoryDao"%>
<%@page import="com.mydata.model.Category"%>
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
	if(u1.getUserType().equals("normal"))
	{
		session.setAttribute("massage","you are not admin ! !do not access this page");
		response.sendRedirect("Login.jsp");
		return;
	}
}



%>
  <%
         
  
           CategoryDao cd=new CategoryDao(factoryProvider.getfactory());
           List<Category>list=cd.getCatogory();
           
           
           //geting count
            
          Map<String,Long> m1= get10Words.getCounts(factoryProvider.getfactory());
           %>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Page</title>
<%@include file="componenet/common_css_js.jsp" %>
</head>	
<body>
<%@include file="componenet/navBar.jsp" %>
  <div class="container admin">
    <div class="container-fluid">
    <%@include file="componenet/massage.jsp" %>
    </div>
    
    <div class="row mt-4">
       <div class="col-md-4">
         <div class="card">
           <div class="card-body text-center">
             <div class="container">
               <img style="max-width:125px"  class="img-fluid"   alt="user_icon" src="Image/team.png">
             
             </div>
              <h1><%=m1.get("userCount") %></h1>
              <h1 class="text-uppercase text-muted">Users</h1>
           </div>
         </div>
       
       </div>
       
       <div class="col-md-4">
       
        <div class="card">
           <div class="card-body text-center">
            <img style="max-width:125px"  class="img-fluid rounded-circle rounded-circle"   alt="user_icon" src="Image/category.png">
           <h1><%=list.size() %></h1>
           <h1 class="text-uppercase text-muted">Catagory</h1>
           </div>
         </div>
       
       </div>
        
        <div class="col-md-4">
        <div class="card">
           <div class="card-body text-center">
            <img style="max-width:125px"  class="img-fluid rounded-circle"   alt="user_icon" src="Image/dairy-products.png">
           <h1><%=m1.get("productCount") %></h1>
           <h1 class="text-uppercase text-muted">Product</h1>
           
           </div>
         </div>
       
       </div>
    
    </div>
      <div class="row mt-4">
           <div class="col-md-6">
        <div class="card" data-toggle="modal" data-target="#add-category-model">
           <div class="card-body text-center">
            <img style="max-width:125px"  class="img-fluid rounded-circle"   alt="user_icon" src="Image/list.png">
          <p class="mt-3">click here to add new catogory</p>
           <h1 class="text-uppercase text-muted">Add-catogory</h1>
           
           </div>
         </div>
       
       </div>
        <div class="col-md-6">
        <div class="card" data-toggle="modal" data-target="#add-product-modal" >
           <div class="card-body text-center">
            <img style="max-width:125px"  class="img-fluid rounded-circle"   alt="user_icon" src="Image/box.png">
           <p class="mt-3">click here to add new product</p>
           <h1 class="text-uppercase text-muted">add-Product</h1>
           
           </div>
         </div>
       
       </div>
         
      
      </div>
  
  </div>

<!-- Modal -->
<div class="modal fade" id="add-category-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Fill category Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
        <form action="productOperationServlet" method="post">
           
           <div class="form-group">
             <input type="hidden" name="operation" value="addcategory">
             <input type="text" class="form-control" name="catTitle" placeholder="enter category title" required/>
           
           
           </div>
        
            <div class="form-group">
            
            <textarea placeholder="enter category Description" name="catDescription" rows="10" cols="100" required></textarea>
            
            </div>
            <div class="container text-center">
              <button class="btn btn-outline-success">Add Category</button>
              <button type="button" class="btn btn-outline-danger" data-dismiss="modal">Close</button>
            </div>
        
        </form>
       
      </div>
      
      
       
       
     
    </div>
  </div>
</div>


<!-- Modal --> <!-- product model -->
<div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Fill Product Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
        <form action="productOperationServlet" method="post" enctype="multipart/form-data">
        <input type="hidden" name="operation" value="addproduct">
           <div class="form-group">
             Product_Name: <input type="text" class="form-control" name="pname" placeholder="enter product name title" required/>
           </div>
           <div class="form-group">
             Product_Description:
              <textarea style="height:100px" class="form-control" name="pDesc" placeholder="enter product Description" required/></textarea>
              
            </div>
           <div class="form-group">
             Product_Price: <input type="number" class="form-control" name="p_Price" placeholder="enter product Price" required/>
            </div>
        
            <div class="form-group">
             Product_discount: <input type="number" class="form-control" name="p_discount" placeholder="enter product Discount" required/>
            </div>
             <div class="form-group">
             Product_Quantity: <input type="number" class="form-control" name="p_Quantity" placeholder="enter product Quantity" required/>
            </div>
                
        
            <div class="form-group">
               Select_catogory:
               <select name="catId" class="form-control" id="">
                <%
                for(Category c:list)
                {
                	 %>
                	<option value="<%=c.getCategoryId() %>"><%=c.getCategoryTitle() %></option>	
               <%} %>
                
 </select>
              
            </div>
             <div class="form-group">
             <label for="pic">Select picture of product</label>
             </br>
             <input type="file"  name="pic"  required/>
            </div>
                
            <div class="container text-center">
              <button class="btn btn-outline-success">Add Product</button>
              <button type="button" class="btn btn-outline-danger" data-dismiss="modal">Close</button>
            </div>
        </form>
       
      </div>
      
       <!-- product model -->
       
       
     
    </div>
  </div>
</div>
       
</body>
</html>