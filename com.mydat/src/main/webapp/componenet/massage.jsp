<%
String massage=(String)session.getAttribute("massage");
%>
<div class="alert alert-success alert-dismissible fade show" role="alert">
  <strong><%=massage%></strong> 
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>

<%
if(massage!=null)
{
	session.removeAttribute("massage");
}

%>