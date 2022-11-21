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
<c:set var="orderId" value="${param.id}"/>
<jsp:useBean id="vendorDao" class="com.infinite.can.VendorDAO"/>
<c:set var="vendor" value="${vendorDao.searchOrderId(orderId)}"/>
<div class="container">
 <div class="row">
  <div class="col-sm-6 mx-auto">
  <form action="VendorConfirmOrder.jsp">
   <div class="form-group">
   Order Id:
   <input type="text" name="orderId" value="${orderId}" class="form-control" readonly/>
   </div>
   <div class="form-group">
   Customer Id:
	<input type="text" name="custId" value="${vendor.custId}" class="form-control" readonly/>
   </div>
   <div class="form-group">
    Menu Id:
	<input type="text" name="menuId" value="${vendor.menuId}" class="form-control" readonly/>
   </div>
   <div class="form-group">
   Vendor Id:
	<input type="text" name="vendorId" value="${vendor.vendorId}" class="form-control" readonly/>
   </div>
   <div class="form-group">
   Quantity:
	<input type="text" name="quantity" value="${vendor.quantity}" class="form-control" readonly/>
   </div>
   <div class="form-group">
   Comments:
	<input type="text" name="comments" value="${vendor.comments}" class="form-control" readonly/>
   </div>
   <div class="form-group">
   Status:
	<input type="text" name="oldstatus"  value="${vendor.status}" class="form-control" readonly/>
   </div>
    <input type="submit" value="Next" class="btn btn-primary"/>
    </form>
  </div> 
 </div>

</div>

</body>
</html>