<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
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
.container-fluid{
background-color: dark;
}
</style>
</head>
<body>
<jsp:useBean id="dao" class="com.infinite.can.CustomerDAO"/>
<c:set var="user" value="${sessionScope.user}"/>
<c:set var="cust" value="${dao.searchCustomer(user)}"/>
<c:set var="cid" value="${cust.cust_id}" scope="session"/>
<jsp:include page="Welcome.jsp" />
 <div class="container-fluid">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
 
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="ShowRestaurant.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="MyOrder.jsp">My Order</a>
        </li>
         <li class="nav-item">
          <a class="nav-link active" href="MyCart.jsp">My cart</a>
        </li>
         <li class="nav-item">
          <a class="nav-link active" href="MyWallet.jsp">My Wallet</a>
        </li>   
        <li class="nav-item">
          <a class="nav-link active" href="LogOut">LogOut</a>
        </li>
      </ul>
    </div>
    <b>
 Welcome !  ${cust.cust_name}
</b>

 

</nav>  </div><br/>
</body>
</html>