<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script >

</script>
</head>
<body>
<jsp:useBean id="dao" class="com.infinite.can.OrderDeatilsDAO"/>
<jsp:include page="CNavbar.jsp" />
<c:set var="ord" value="${dao.showOrderById(cid)}"/>


<c:set var="total" value="${dao.calcTotal(cid)}"/>

<div class="table-responsive-lg">
 <form action="">
<table class="table table-bordered text-center">
<thead class="table-dark">
<tr>
  <th>VendorId</th>
  <th>MenuId</th>
  <th>Quantity</th>
  <th>Sub Total</th>
  <th></th>
</tr>
</thead>
<c:forEach var="order" items="${ord}">

<tr>
 <c:set var="oid" value="${order.orderId}"/>
 
 <td>${order.vendorId}</td>
 <td>${order.menuId}</td>
 <td>${order.quantity}</td>
 <td id="amt">${order.billamt}</td>
 <td><a href="Remove.jsp?orderId=${oid}"><button type="button" class="btn btn-danger">Remove</button></a>
</tr>

</c:forEach>

<tr >
<td colspan="3"><b>Grand Total:  ${total}</b></td>
<c:if test="${total>0 }">
<td colspan="2"><a href="Payment.jsp?total=${total}"><button type="button" class="btn btn-primary">Proceed to Payment</button></a></td>
</c:if>


</tr>
</table>
</form>
</div>




</body>
</html>