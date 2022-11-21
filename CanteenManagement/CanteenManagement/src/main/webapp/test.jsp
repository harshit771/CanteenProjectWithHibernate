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
</head>
<body>
<jsp:useBean id="dao" class="com.infinite.can.WalletDAO"></jsp:useBean>
<div class="table-responsive-lg">
<table class="table table-bordered text-center">
     <tr>
      <th>Wallet Type</th>
      <th>Amount</th>
      </tr>  
      <c:forEach var="type" items="${dao.searchWallet(cid)}">
			<tr>
		<td><c:out value="${type.walletType}" /></td>
		<td><c:out value="${type.amt}" /></td>
			</tr>
		</c:forEach>
   
     </table>

</div>

</body>
</html>