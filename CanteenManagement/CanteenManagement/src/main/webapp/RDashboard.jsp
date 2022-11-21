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
<style>

.nav-item{
font-weight: bold;
font-size: medium;

}
.nav-item:hover {
	background-color: #cccccc;
}
</style>
</head>
<body>
<jsp:useBean id="dao" class="com.infinite.can.RestaurantDAO" />
<c:set var="user" value="${sessionScope.user}"></c:set>
<c:set var="rest" value="${dao.searchRestaurant(user)}"/>
<c:set var="rid" value="${rest[0].resturantId}" scope="session" />

<jsp:include page="Welcome.jsp" />

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="RDashboard.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="AddMenu.jsp?id=${id}">Add Menu</a>
        </li>
   
        <li class="nav-item">
          <a class="nav-link active" href="RestaurantOrder.jsp">My Order</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="LogOut">LogOut</a>
        </li>
      </ul>
    </div>
    <b>
</b>
  </div>
 

</nav>

</body>
</html>