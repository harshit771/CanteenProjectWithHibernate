<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="Navbar.jsp" /><br/><br/>
	<jsp:useBean id="beanDao" class="com.infinite.can.VendorDAO"/>
	<div class="container">
	  <div class="row">
	    <div class="col-sm-6 mx-auto">
	    <form method="get" action="AddVendor.jsp">
	       <div class="form-group">
	          Vendor Name:
		      <input type="text" name ="vend_name" class="form-control"/>
	       </div>
	       <div class="form-group">
	          Vendor Email:
			  <input type="text" name ="vend_email" class="form-control"/>
	       </div>
	       <div class="form-group">
	         Vendor Mobile No:
		     <input type="number" name ="vend_mob_no" class="form-control"/>
	       </div>
	       <div class="form-group">
	        Vendor UserName:
		   <input type="text" name ="vend_userName" class="form-control"/>
	       </div>
	       <div class="form-group">
	       Vendor UserName:
		   <input type="text" name ="vend_userName" class="form-control"/>
	       </div>
	       <input type="submit" value ="Register" class="btn btn-dark"/>
	    </form>  
	    <c:if test="${param.vend_name!=null && param.vend_password!=null}">

			<jsp:useBean id="beanVendor" class="com.infinite.can.Vendor" />
			<jsp:setProperty property="*" name="beanVendor"/>
			<c:out value="${beanDao.addVendor(beanVendor)}"/>
		</c:if> 
	    </div>
	  </div>
	
	</div>


</body>
</html>