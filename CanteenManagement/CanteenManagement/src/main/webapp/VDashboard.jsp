<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dao" class="com.infinite.can.VendorDAO"/>
<c:set var="user" value="${sessionScope.user}"></c:set>
<c:set var="vendor" value="${dao.searchByName(user)}"/>
<c:set var="vid" value="${vendor.vend_id}" scope="session" />
<jsp:include page="Welcome.jsp" />
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" href="VendorHistoryOrder.jsp">My Order</a>
        </li>
       
        <li class="nav-item">
          <a class="nav-link" href="VendorOrder.jsp">New Order</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="VendorPendingOrder.jsp">My Pending Order</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="LogOut">LogOut</a>
        </li>
      </ul>
    </div>
    <b>
 Welcome !  ${user}
</b>
  </div>
 

</nav><br/>
</body>
</html>