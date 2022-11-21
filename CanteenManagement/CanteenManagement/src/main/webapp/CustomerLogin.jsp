<%@page import="com.infinite.can.CustomerDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">


</style>

</head> 
<body>
<jsp:include page="Navbar.jsp" /><br/><br/>
<jsp:useBean id="beanDao" class="com.infinite.can.CustomerDAO" />

<div class="container">
  <div class="row">
    <div class="col-sm-6 mx-auto">
       <form method="post" action="CustomerLogin.jsp" >
	
	   
		<div class="form-group">
		Username: 
		 <input type="text" name="cust_userName" class="form-control" />
		
		</div>
		<div class="form-group">
		Password:  <input type="password" name="cust_password" class="form-control"/></div>
		<input type="submit" value="Login" class="btn btn-primary"/>

	</form>
	
	<c:if test="${param.cust_userName != null && param.cust_password != null}">
		<jsp:useBean id="bean1" class="com.infinite.can.Customer"/>
     	<jsp:setProperty property="*" name="bean1" />
     	<c:set var="user" value="${param.cust_userName}"  />
     	<c:set var="pwd" value="${param.cust_password}"  />
     	<c:set var="count" value="${beanDao.loginCheck(user, pwd)}"/>
     	<c:set var="user" value="${user}" scope="session"/>
     	     	<c:if test="${count==1}">
     	   <jsp:forward page="ShowRestaurant.jsp" />
     	</c:if>
     	<c:if test="${count==0}">
     	  <c:out value="Invalid creaditialss..."></c:out>
     	</c:if>
	
	
	</c:if>
    </div>
  </div>
</div>

	
<br><br><br>
	
</body>
</html>