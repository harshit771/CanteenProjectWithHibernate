package com.infinite.can;

public class Dummy {

	public static void main(String[] args) {
//		//OrderDeatilsDAO dao=new OrderDeatilsDAO();
//		//OrderDetails order=new OrderDetails();
//		//WalletDAO dao=new WalletDAO();
//		//VendorDAO dao=new VendorDAO();
////		order.setOrderId("O001");
////		order.setCustId("C002");
////		order.setStatus(Status.CANCELLED);
//		VendorDAO dao=new VendorDAO();
//		System.out.println(dao.searchVendorPendingOrder("V002"));
		RestaurantDAO dao = new RestaurantDAO();
		System.out.println(dao.showRest());
	}

}
