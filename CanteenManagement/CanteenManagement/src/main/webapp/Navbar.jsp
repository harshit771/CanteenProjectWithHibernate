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
<style>
.jumbotron{
background-color: #595959;

color:white;
text-align: center;
}
.nav-item{
font-weight: bold;
font-size: large;

}
.container-fluid{
background-color: #b3b3b3;
}
</style>
<title>Insert title here</title>
</head>
<body>
<div class="jumbotron jumbotron-fluid m-0 p-5">
  <div class="container ">
    <h1>Canteen Management</h1>
    
  </div>
</div>
 <div class="container-fluid">
<nav  class="navbar navbar-expand-lg navbar-light " >
 
    <a class="navbar-brand" href="#"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="Navbar.jsp" class="click">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="Join.jsp" class="click">Join Us</a>
        </li>
        
        <li class="nav-item dropdown">
          <a class="nav-link active dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false" class="click">
            Login
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <li><a class="dropdown-item" href="CustomerLogin.jsp" class="click">Customer</a></li>
            <li><a class="dropdown-item" href="VendorLogin.jsp" class="click">Vendor</a></li>
            <li><a class="dropdown-item" href="RestaurantLogin.jsp" class="click">Restaurant</a></li>
          </ul>
        </li>
      </ul>
    </div>

</nav>  </div><br/>

</body>
</html>