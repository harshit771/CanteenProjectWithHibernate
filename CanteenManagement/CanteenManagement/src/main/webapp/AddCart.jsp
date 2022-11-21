<%@page import="com.infinite.can.VendorDAO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script>
function calc(){
  var qty=document.getElementById("qty").value;
  var price=document.getElementById("price").value;
  result=price*qty;
   frmCart.total.value=result
}

</script>
</head>
<body>
<jsp:include page="CNavbar.jsp" />
<jsp:useBean id="vendorDao" class="com.infinite.can.VendorDAO" />

<jsp:useBean id="dao" class="com.infinite.can.MenuDAO"/>
<c:set var="mid" value="${param.id}"/>
<c:set var="menu" value="${dao.searchById(mid)}" />

<div class="container">
   <div class="row">
      <div class="col-sm-6 mx-auto">
         <form action="AddCart.jsp" method="get" name="frmCart">
           <div class="form-group">
              <label>Choose Vendor</label>
              <select name="vendorId" class="form-control">
		          <c:forEach var="vname" items="${vendorDao.showVendor()}">
			         <option value="${vname}">
			           <c:out value="${vname}" ></c:out>
			         </option>
		          </c:forEach>
	          </select>
           </div>
           <div class="form-group">
            <label>Customer Id</label>
            <input type="text" name="custId" value="${cid}" class="form-control"readonly/>
           </div>
            <div class="form-group">
            <label>Restaurant Id</label>
           <input type="text" name="restId" value="${menu[0].rest_id}" class="form-control"readonly/>
           </div>
            <div class="form-group">
            <label>Item</label>
           <input type="text" name="item" value="${menu[0].menu_item}" class="form-control"readonly/>
           </div>
            <div class="form-group">
            <label>Menu Id</label>
           <input type="text" name="menuId" value="${menu[0].menu_id}" class="form-control"readonly/>
           </div>
            <div class="form-group">
            <label>Price</label>
           <input type="text" name="price" id="price"value="${menu[0].menu_price}" class="form-control"readonly/>
           </div>
            <div class="form-group">
            <label>Quantity</label>
          <input type="number" class="form-control" id="qty" name="quantity" min="1" max="100"  onblur="calc()"/>
           </div>
           <div class="form-group">
            <label>Total</label>
            <input type="number" id="total" name="billamt" class="form-control" >
           </div>
           <input type="submit" value="Add Item" class="btn btn-info text-dark "/>
         </form>
         <c:if test="${param.billamt != null && param.quantity != null && param.orderId==null}">
			<jsp:useBean id="order1" class="com.infinite.can.OrderDetails"/>
			<jsp:setProperty property="*" name="order1"/>
			<jsp:useBean id="beanOrderDao" class="com.infinite.can.OrderDeatilsDAO"/>
			<c:out value="${beanOrderDao.addOrder(order1)}"/>
			<c:redirect url="ShowMenu.jsp?id=${rid}"/>
		</c:if>	
      </div>
   
   </div>
</div>


		
</body>
</html>