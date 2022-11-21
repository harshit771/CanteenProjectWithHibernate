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
<jsp:include page="RDashboard.jsp"/><br/><br/>
<jsp:useBean id="dao" class="com.infinite.can.RestaurantDAO" />
<form action="RestaurantOrder.jsp">
Select :<br/><br/>
<input type="radio" name="searchType" value="PENDING">PENDING  <br/><br/>
<input type="radio" name="searchType" value="ACCEPTED">ACCEPTED <br/><br/>
<input type="radio" name="searchType" value="CANCELLED">CANCELLED <br/><br/>
<input type="radio" name="searchType" value="REJECTED">REJECTED <br/><br/>
<input type="radio" name="searchType" value="DELIVERED">DELIVERED <br/><br/>

<input type="submit" value="View"><br/><br/>
</form>
<c:if test="${param.searchType!=null}">
<div class="table-responsive-lg">
 <table class="table table-bordered text-center">
 <thead class="table-dark">
<tr>
<th>Customer Id</th>
<th>Menu Id</th>
<th>Vendor Id</th>
<th>Quantity</th>
<th>Comments</th>
<th>Status</th>
<th></th>
</tr>
</thead>
<c:forEach var="order" items="${dao.searchRestaurantOrder(rid,param.searchType)}">
<tr>
<c:set var="oid" value="${order.orderId}"/>
<c:set var="status" value="${order.status}"/>
<td>${order.custId}</td>
<td>${order.menuId}</td>
<td>${order.vendorId}</td>
<td>${order.quantity}</td>
<td>${order.comments}</td>
<td>${order.status}</td>
<c:if test="${status.toString().equals('PENDING')}">

<td><a href="ViewAndUpdate.jsp?id=${oid}"><button type="button" class="btn btn-primary">View</button></a></td>
</c:if>

</tr>
</c:forEach>

</table>

 
</div>
</c:if>
</body>
</html>