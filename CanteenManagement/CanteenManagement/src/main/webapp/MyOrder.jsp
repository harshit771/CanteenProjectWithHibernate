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
<jsp:useBean id="dao" class="com.infinite.can.CustomerDAO" />

<form action="MyOrder.jsp" class="m-3">

<h5>SELECT :</h5><br/>
<input type="radio"  name="searchType" value="PENDING"> PENDING  <br/><br/>
<input type="radio" name="searchType" value="ACCEPTED"> ACCEPTED <br/><br/>
<input type="radio" name="searchType" value="CANCELLED"> CANCELLED <br/><br/>
<input type="radio" name="searchType" value="REJECTED"> REJECTED <br/><br/>
<input type="radio" name="searchType" value="DELIVERED"> DELIVERED <br/><br/>

<input type="submit" value="View"><br/>

</form>

<c:if test="${param.searchType!=null}">
<div class="table-responsive-lg">
  <table class="table table-bordered text-center">
	  <thead class="table-dark">
		<tr>
		  <th>VendorId</th>
		  <th>Restaurant Id</th>
		  <th>MenuId</th>
		  <th>Quantity</th>
		  <th>Price</th>
		  <th>Status</th>
		  <th></th>
		</tr>
		</thead>
		<c:forEach var="order" items="${dao.searchCustomerOrder(cid,param.searchType)}">
		<tr>
		<c:set var="status" value="${order.status}"/>
			 <td>${order.vendorId}</td>
			 <td>${order.restId}</td>
			 <td>${order.menuId}</td>
			 <td>${order.quantity}</td>
			 <td>${order.billamt}</td>
			 <td>${status}</td>
			 
			 <c:if test="${status.toString().equals('PENDING')}">
			 <td><a href="CustomerOrderView.jsp?id=${order.orderId}"><button type="button" class="btn btn-danger">Cancel</button></a></td>
			 </c:if>
			 
		</tr>

</c:forEach>
</table>

</div>

</c:if>

</body>
</html>