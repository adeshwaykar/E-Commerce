<%@page import="java.util.Map"%>
<%@page import="com.mydata.connection.get10Words"%>
<%@page import="com.mydata.model.Category"%>
<%@page import="com.mydata.Dao.CategoryDao"%>
<%@page import="com.mydata.model.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.mydata.Dao.ProductDaoa"%>
<%@page import="com.mydata.connection.factoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MY CART</title>
<%@include file="componenet/common_css_js.jsp" %>
<%@include file="componenet/background.jsp" %>
</head>

<body>
<%@include file="componenet/navBar.jsp" %>
  <div class="row mt-3 mx-2">
   <%
   
   
   
      String cat=request.getParameter("category");
      ProductDaoa product=new ProductDaoa(factoryProvider.getfactory());
      List<Product>list=null;
      if(cat==null ||cat.trim().equals("all"))
      {
    	  list=product.getAllProduct();
      }else
      {
    	  int cid=Integer.parseInt(cat.trim());
    	  list=product.getProductById(cid);
      }
      
      CategoryDao categor=new CategoryDao(factoryProvider.getfactory
    		  ());
         List<Category>l=categor.getCatogory();
   
   
   %>
   
   <div class="col-md-2">
    <div class="list-group mt-4">
     <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
   All products
  </a>
   <%
   for(Category c:l)
   {
	   %>
	   <a href="index.jsp?category=<%=c.getCategoryId() %>" class="list-group-item list-group-item-action"><%=c.getCategoryTitle() %></a>
	   <% 
   }
   
   %>
    </div>
   </div>
   <div class="col-md-10">
  
     <div class="row mt-4">
        <div class="col-md-12">
           
           <div class="card-columns">
           <!-- traversing products -->
           <%
           for(Product p:list)
           {
        	   %>
        	   
        	   <div class="card product-card">
        	     <div class="container text-center">
        	        <img class="card-img-top" src="Image/product/<%=p.getpPhoto() %>" style="max-height: 200px;max-width: 100%;width: auto" alt="Card image cap">
        	     </div>
        	     <div class="card-body">
        	      <h5 class="card-title"><%=p.getpName() %></h5>
        	      
        	      <p class="card-text">
        	       <%=get10Words.get10words(p.getpDiscription()) %>
        	       
        	      </p>
        	       
        	     </div>
        	     <div class="card-footer text-center">
        	       <button class="btn custom-bg text-white" onclick="add_to_cart(<%=p.getpId() %>,'<%=p.getpName()%>',<%=p.getpPrice()%>)">Add to cart</button>
        	       <button class="btn btn-outline-success">&#8377; <%=p.getpriseafterDiscount() %>/- <span class="text-secondary discount-label1">&#8377; <%=p.getpPrice()  %></span>,<span class="text-secondary discount-label text" text-decoration:line-through> <%=p.getpDiscount() %>% off</span></button>
        	     </div>
        	   
        	   </div>
        	   
        	   <%
        	   }
           if(list.size()==0)
           {
        	   out.println("<h3> No Item IN This Category</h3>");
           }
           
           
           
           
           %>  
           </div>
        </div>
     </div> 
   </div>
  </div>
  
  <%@include file="componenet/common_models.jsp" %>
  
       <div class="container text-center">
       <% Map<String,Long> m1= get10Words.getCounts(factoryProvider.getfactory()); 
       int value=5;int satrt=0;
        try{
        	int start=(request.getParameter("start")==null)?0:Integer.parseInt(request.getParameter("start"));
        	satrt=start*value;
        }catch(Exception e)
        {
        	e.printStackTrace();
        }
       %>
       <tr>
          <th>
           <% for(int i=0;i<=m1.get("productCount")/value;i++){ %>
           <a href="index.jsp?start=<%=i+1 %>"><%=i+1 %></a>
           <%} %>
           </th>
           </tr>
           
       </div>
</body>
</html>