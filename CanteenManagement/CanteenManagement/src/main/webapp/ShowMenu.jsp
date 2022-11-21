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
<jsp:include page="CNavbar.jsp" />
<jsp:useBean id="dao" class="com.infinite.can.MenuDAO" />
<c:set var="rid" value="${param.id}" scope="session" />
<c:set var="menu" value="${dao.searchMenu(rid)}"/>

<div class="table-responsive-lg">
   <table class="table table-bordered text-center" >
	<thead class="table-dark">
	<tr>
		
		<th>Menu Item</th>
		<th>Menu Price</th>
		<th>Menu Type</th>
		<th></th>
	</tr>
	</thead>
	<c:forEach var="rest" items="${menu}">
	<tbody>
	<tr>
		<c:set var="mid" value="${rest.menu_id}"/>
		<td>${rest.menu_item}</td>
		<td>${rest.menu_price}</td>
		<td>${rest.menu_type}</td>
       <td><a href="AddCart.jsp?id=${mid}"><button type="button" class="btn btn-success">Add to Cart</button></a></td>
		
	</tr>
	</tbody>
	</c:forEach>
	
	
	</table>

</div>



		

	
</body>
</html>