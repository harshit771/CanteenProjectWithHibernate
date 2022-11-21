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
<c:set var="ordId" value="${param.orderId}" />
<c:set var="cId" value="${param.custId}" />
<c:set var="mId" value="${param.menuId}" />
<c:set var="vId" value="${param.vendorId}" />
<c:set var="status" value="${param.status}" />
<div class="container">
  <div class="row">
    <div class="col-sm-6 mx-auto">
     <form action="ConfirmOrder.jsp">
        <div class="form-group">
          Order Id:
          <input type="text" name="orderId" class="form-control" value="${param.orderId}"/>
        </div>
        <div class="form-group">
          Customer Id:
          <input type="text" name="custId" class="form-control" value="${param.custId}"/>
        </div>
        <div class="form-group" class="form-control">
         Status:
			<select name="status">
			 <option value="ACCEPTED">ACCEPTED</option>
			 <option value="REJECTED">REJECTED</option>
			</select>
        </div>
        <input type="submit" value="Update" class="btn btn-primary"/>
     </form>
     <c:if test="${ordId != null && status != null }">
		<jsp:useBean id="orderDao" class="com.infinite.can.OrderDeatilsDAO"/>
		<c:out value="${orderDao.updateStatus(ordId, status)}"/>
	</c:if>
    </div>
  </div>

</div>


</body>
</html>