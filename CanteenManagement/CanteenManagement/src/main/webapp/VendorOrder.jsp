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
<jsp:include page="VDashboard.jsp"/>
<jsp:useBean id="dao" class="com.infinite.can.VendorDAO"/>
<div class="table-responsive-lg">
   <table class="table table-bordered">
   <thead class="table-dark">
	<tr>
	<th>Customer Id</th>
	<th>Menu Id</th>
	<th>Vendor Id</th>
	<th>Quantity</th>
	<th>Comments</th>
	<th>Status</th>
	</tr>
</thead>
<c:forEach var="order" items="${dao.searchVendorId(vid)}">
<tr>
<c:set var="oid" value="${order.orderId}"/>
<td>${order.custId}</td>
<td>${order.menuId}</td>
<td>${order.vendorId}</td>
<td>${order.quantity}</td>
<td>${order.comments}</td>
<td>${order.status}</td>
<td><a href="VendorUpdateOrder.jsp?id=${oid}"><button type="button" class="btn btn-primary">View</button></a></td>
</tr>
</c:forEach>

</table>
</div>

</body>
</html>