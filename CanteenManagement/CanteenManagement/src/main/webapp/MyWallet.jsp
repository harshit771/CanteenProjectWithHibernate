<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
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

</head>

<body>
<jsp:include page="CNavbar.jsp"/><br/>
<div class="container">
 <div class="row">
   <div class="col-sm-4">
   <form>
      <div class="form-group">
         Customer Id:
		<input type="text" name="customerId" value="${cid}" class="form-control" readonly/>
      </div>
      <div class="form-group">
         Wallet Type:
		<select name="walletType" class="form-control">
		<option value="PHONEPAY">PHONEPAY</option>
		<option value="GPAY">GPAY</option>
		<option value="PAYTM">PAYTM</option>
		</select>
      </div>
      <div class="form-group">
        Amount:
		<input type="number" name="amt" class="form-control"/>
      </div>
      <input type="submit" value="Add" class="btn btn-info"/>
</form>
	<c:if test="${param.walletType != null}">
	<jsp:useBean id="wallet" class="com.infinite.can.Wallet"/>
	<jsp:setProperty property="*" name="wallet"/>
	<jsp:useBean id="walletDao" class="com.infinite.can.WalletDAO"/>
	<c:out value="${walletDao.addWallet(wallet)}"/>
	</c:if>
   </div>
   <div class="col-sm-2"></div>
   <div class="col-sm-5">
   <jsp:include page="test.jsp" /> 
   </div>
 </div>

</div>

</body>
</html>