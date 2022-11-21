<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.css">
<script src="js/jquery-3.5.1.min.js"></script>
<meta charset="ISO-8859-1">
<style type="text/css">


</style>

<title>Insert title here</title>
</head>
<body>
<jsp:include page="Navbar.jsp" /><br/><br/>
<div class="row">
<div class="col-sm-1"></div>
  <div class="col-sm-3 m-3 p-3">
  <a href="AddCustomer.jsp">
  <img src="images/customer.jpeg" alt="customer"/> </a>
  </div>
   <div class="col-sm-3 m-2 p-3">
  <a href="AddRestaurant.jsp">
  <img src="images/rest.jpeg" class="img-rounded" style="width: 50%; alt="restaurant"/> </a>
  </div>
   <div class="col-sm-3 m-3 p-3">
  <a href="AddVendor.jsp">
  <img src="images/vendor.jpeg" class="img-rounded"  alt="vendor"/> </a>
  </div>
   
</div>
<pre>
              For Customer Registration                        For Restaurant Registration                      For Vendor Registration 
                 Click Here                                       Click Here                                        Click Here
</pre>  
  
    
  
 
</body>
</html>