<%@page import="com.infinite.can.Restaurant"%>
<%@page import="java.util.List"%>
<%@page import="com.infinite.can.RestaurantDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.css">
<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="CNavbar.jsp"/>
<jsp:useBean id="beanDao" class="com.infinite.can.RestaurantDAO"/>
    <div class="table-responsive-lg">
     
         <table class="table  text-center">
	       <thead class="table-dark">
			  <tr>
			     <th>Name</th>
			     <th>City</th>
			     <th>Mobile No</th>
			     <th></th>
			  </tr>
			</thead>
			
			<c:forEach var="rest" items="${beanDao.showRest()}">
			    <tbody>
			    <tr>
			        <td>
			      	${rest.name}
			      	</td>
			        <td>${rest.city}</td>
			        <td>${rest.mobileno}</td>
			      	<td><a href="ShowMenu.jsp?id=${rest.resturantId}"><button type="button" class=" btn btn-info">Select</button></a></td>
				</tr>
			    
			    </tbody>
			     
			
			</c:forEach>
			
			</table>
		         
		 </div>
		      
	
	
	
	
</body>
</html>