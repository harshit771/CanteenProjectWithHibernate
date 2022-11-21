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
<c:set var="oid" value="0"/>
<c:if test="${param.id!=null}">
<c:set var="oid" value="${param.id}"/>
</c:if>
<c:if test="${param.orderId!=null}">
	<c:set var="oid" value="${param.orderId}"/>
</c:if>
<jsp:useBean id="dao" class="com.infinite.can.OrderDeatilsDAO"/>
<c:set var="order" value="${dao.searchById(oid)}"/>
<div class="container">
 <div class="row">
  <div class="col-sm-6 mx-auto">
    <form action="ConfirmOrder.jsp">
      <div class="form-group">
        Order Id:
        <input type="text" name="orderId" value="${oid}" class="form-control" readonly/>
      </div>
      <div class="form-group">
        Customer Id:
		<input type="text" name="custId" value="${order.custId}" class="form-control" readonly/>
      </div>
      <div class="form-group">
        Menu Id:
		<input type="text" name="menuId" value="${order.menuId}" class="form-control" readonly/>
      </div>
      <div class="form-group">
        Vendor Id:
       <input type="text" name="vendorId" value="${order.vendorId}" class="form-control" readonly/>
      </div>
      <div class="form-group">
        Quantity:
		<input type="text" name="quantity" value="${order.quantity}" class="form-control" readonly/>
      </div>
      <div class="form-group">
        Comments:
        <input type="text" name="comments" value="${order.comments}" class="form-control" readonly/>
      </div>
      <div class="form-group">
        Status:
		<input type="text" name="oldstatus"  value="${order.status}" class="form-control" readonly/>
      </div>
      <input type="submit" value="Next" class="btn btn-primary"/>
    </form>
  </div>
 </div>
</div>


</body>
</html>