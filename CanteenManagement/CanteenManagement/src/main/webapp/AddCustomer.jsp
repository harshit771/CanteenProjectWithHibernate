<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/bootstrap.css">
<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<title>Customer Registration</title>
</head>
<body>
<jsp:include page="Navbar.jsp" /><br/>
<div class="container">
 <div class="row">
    <div class="col-sm-6 mx-auto">
    <h2 style="text-align: center;">Customer Registration</h2><br/>
      <form method="get" action="AddCustomer.jsp" name="frmRegister">
          <div class="form-group">
				<label>Name</label>
				<input type="text" name="cust_name" class="form-control" required>
			</div>
			<div class="form-group">
				<label>City</label>
				<input type="text" name="cust_city" class="form-control" required>
			</div>
			<div class="form-group">
				<label>Gender</label>
				<select name="cust_gender" class="form-control" required>
				  <option value="MALE">MALE</option>
				  <option value="FEMALE">FEMALE</option>
				</select>
			</div>
			<div class="form-group">
				<label>Mobile Number</label>
				<input type="tel" name="cust_phn_no" pattern="[6789][0-9]{9}" title="10 character required" class="form-control" required>
			</div>
			<div class="form-group">
				<label>Mail</label>
				<input type="email" name="cust_email" class="form-control" required >
				<span id="msg"></span>
			</div>
			<div class="form-group">
				<label>User Name</label>
				<input type="text" name="cust_userName" class="form-control" required>
			</div>
			<div class="form-group">
				<label>Password</label>
				<input type="password" name="cust_password" pattern=".{4,8}" title="Min 4 character or max 8 characters" class="form-control" required>
			</div>
			<input type="submit" value="Register" class="btn btn-dark "/>
    </form>
    <c:if test="${param.cust_phn_no!= null}">
		 <jsp:useBean id="dao" class="com.infinite.can.CustomerDAO" />
		<jsp:useBean id="Customer" class="com.infinite.can.Customer" />	
		<jsp:setProperty property="*" name="Customer"/>
		<c:out value="${dao.addcustomer(Customer)}"/>
	</c:if>
    </div>
 </div>

</div>
	
	
</body>
</html>