package com.infinite.can;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;

import org.hibernate.criterion.Restrictions;

public class OrderDeatilsDAO {

	SessionFactory sFactory;
	Session session;

	public String orderIdGen() {
		sFactory = SessionHelper.getConnection();
		session = sFactory.openSession();
		Criteria cr = session.createCriteria(OrderDetails.class);
		List<OrderDetails> orderList = cr.list();
		if (orderList.size() == 0) {
			return "O001";
		} else {
			int id = Integer.parseInt(orderList.get(orderList.size() - 1).getOrderId().substring(1));
			String orderId = String.format("O%03d", ++id);
			return orderId;
		}
	}

	public String addOrder(OrderDetails order) {
		System.out.println(order);
		String orderId = orderIdGen();
		order.setOrderId(orderId);
		order.setStatus(Status.PENDING);
		sFactory = SessionHelper.getConnection();
		session = sFactory.openSession();
		Transaction tr = session.beginTransaction();
		session.save(order);
		// System.out.println("Data Added to cache...");
		tr.commit();

		return "You ordered successfully";
	}

	public List<OrderDetails> searchItem(String mId, String customerId) {
		sFactory = SessionHelper.getConnection();
		session = sFactory.openSession();
		Query query = session
				.createQuery("from OrderDetails where menuId=:menuId AND " + "custId=:custId AND address is NULL")
				.setParameter("menuId", mId).setParameter("custId", customerId);

		List<OrderDetails> orderlist = query.list();

		return orderlist;
	}

	public List<OrderDetails> searchByID(String customerId) {
		sFactory = SessionHelper.getConnection();
		session = sFactory.openSession();
		Query query = session.createQuery("from OrderDetails where " + "custId=:custId AND address is NULL")
				.setParameter("custId", customerId);

		List<OrderDetails> orderlist = query.list();

		return orderlist;
	}

	public double calcTotal(String customerId) {
		sFactory = SessionHelper.getConnection();
		session = sFactory.openSession();
		Query query = session
				.createQuery("select sum(billamt) from OrderDetails where custId=:custId " + "AND address is NULL")
				.setParameter("custId", customerId);
		List<Double> count = query.list();
		System.out.println("Count is " + count);
		Double b = (Double) count.get(0);
		System.out.println(b);
		if (b == null) {
			return 0;
		}
//		 if (count.get(0).equals("null")) {
//			 return 0;
//		 }

		return count.get(0);
	}

	public OrderDetails searchById(String orderId) {
		System.out.println(orderId);
		sFactory = SessionHelper.getConnection();
		session = sFactory.openSession();
		Criteria cr = session.createCriteria(OrderDetails.class);
		Criterion criterion1 = Restrictions.eq("orderId", orderId);
		Criterion criterion2 = Restrictions.eq("status", Status.PENDING);
		cr.add(Restrictions.and(criterion1, criterion2));
		List<OrderDetails> orderList = cr.list();
		if (orderList.size() == 0) {
			return null;
		}

		return orderList.get(0);
	}

	public String updateOrder(OrderDetails order) {
		sFactory = SessionHelper.getConnection();
		session = sFactory.openSession();

		OrderDetails ord = searchById(order.getOrderId());
		ord.setQuantity(order.getQuantity());
		ord.setBillamt(order.getBillamt());

		Transaction tr = session.beginTransaction();

		session.update(ord);
		tr.commit();

		return "Updated...";
	}

	public List<OrderDetails> showAllOrder(String custId) {
		sFactory = SessionHelper.getConnection();
		session = sFactory.openSession();

		Query query = session.createQuery("from OrderDetails where custId=:custId  " + "AND address is NOT NULL")
				.setParameter("custId", custId);
		List<OrderDetails> orderList = query.list();

		return orderList;
	}

	public List<OrderDetails> showOrderById(String customerId) {
		sFactory = SessionHelper.getConnection();
		session = sFactory.openSession();
		Query query = session
				.createQuery("from OrderDetails where custId=:custId AND status=:status " + "AND address is NULL")
				.setParameter("custId", customerId).setParameter("status", Status.PENDING);
		;
		List<OrderDetails> orderList = query.list();

		return orderList;
	}

	public String deleteOrder(String orderId) {
		sFactory = SessionHelper.getConnection();
		session = sFactory.openSession();

		OrderDetails order = searchById(orderId);
		Transaction tr = session.beginTransaction();
		session.delete(order);
		tr.commit();

		return "Deleted..";
	}

	public Wallet walletAmount(String custId, Type type) {
		sFactory = SessionHelper.getConnection();
		session = sFactory.openSession();
		Criteria cr = session.createCriteria(Wallet.class);
		Criterion criterion1 = Restrictions.eq("customerId", custId);
		Criterion criterion2 = Restrictions.eq("walletType", type);
		cr.add(Restrictions.and(criterion1, criterion2));
		List<Wallet> wallet = cr.list();

		return wallet.get(0);
	}

	public String paymentOrder(OrderDetails order) {

		String cid = order.getCustId();
		double billAmt = order.getBillamt();
		Type type = order.getWalletType();

		Wallet wallet = walletAmount(cid, type);
		double walletAmount = wallet.getAmt();
		if (billAmt > walletAmount) {
			return "Insufficient balance in your wallet add amount....";
		} else {
			sFactory = SessionHelper.getConnection();
			session = sFactory.openSession();
			List<OrderDetails> orderList = searchByID(cid);
			System.out.println(orderList.size());
			for (OrderDetails orders : orderList) {
				System.out.println(order.getAddress());
				System.out.println(order.getWalletType());
				System.out.println(order.getComments());
				Transaction tr = session.beginTransaction();
				orders.setAddress(order.getAddress());
				orders.setWalletType(order.getWalletType());
				orders.setComments(order.getComments());
				session.update(orders);

				tr.commit();
			}
			session.close();
			double remainBal = walletAmount - billAmt;
			wallet.setAmt(remainBal);

			session = sFactory.openSession();
			Transaction tr = session.beginTransaction();
			session.update(wallet);
			tr.commit();

			return "Payment successfully and bill is " + order.getBillamt();
		}

	}

	public OrderDetails seachOrderId(String orderId) {
		System.out.println(orderId);
		sFactory = SessionHelper.getConnection();
		session = sFactory.openSession();
//		 Criteria cr=session.createCriteria(OrderDetails.class);
//		 Criterion criterion1=Restrictions.eq("orderId", orderId);
//		 Criterion criterion2=Restrictions.eq("status", Status.OUTFORPICKUP);
//		 cr.add(Restrictions.and(criterion1, criterion2));
		Query query = session.createQuery(
				"from OrderDetails where orderId=:orderId AND status=:status OR status=:status1 OR status=:status2 "
						+ "AND address is NOT NULL")
				.setParameter("orderId", orderId).setParameter("status", Status.ACCEPTED)
				.setParameter("status1", Status.OUTFORPICKUP).setParameter("status2", Status.OUTFORDELIVERY);
		List<OrderDetails> orderList = query.list();

		if (orderList.size() == 0) {
			return null;
		}

		return orderList.get(0);
	}

	public String updateStatus(String orderId, String status) {
		OrderDetails order = searchById(orderId);
		if (order != null) {
			if (status.toUpperCase().equals("ACCEPTED")) {
				order.setStatus(Status.ACCEPTED);
				sFactory = SessionHelper.getConnection();
				session = sFactory.openSession();
				Transaction trans = session.beginTransaction();
				session.saveOrUpdate(order);
				trans.commit();
				session.close();
				sFactory.close();
				return "Status Updated....";
			} else if (status.toUpperCase().equals("CANCELLED")) {
				order.setStatus(Status.CANCELLED);
				sFactory = SessionHelper.getConnection();
				session = sFactory.openSession();
				Transaction trans = session.beginTransaction();
				session.saveOrUpdate(order);
				trans.commit();

				double billAmt = order.getBillamt();
				double returnAmount = billAmt - (billAmt * 0.2);
				Type type = order.getWalletType();
				String customerId = order.getCustId();
				Wallet wallet = walletAmount(customerId, type);
				wallet.setAmt(wallet.getAmt() + returnAmount);
				trans = session.beginTransaction();
				session.saveOrUpdate(wallet);
				trans.commit();
				session.close();
				sFactory.close();
				return "Status Updated....";
			} else {
				order.setStatus(Status.REJECTED);
				sFactory = SessionHelper.getConnection();
				session = sFactory.openSession();
				Transaction trans = session.beginTransaction();
				session.saveOrUpdate(order);
				trans.commit();
				double billAmt = order.getBillamt();
				Type type = order.getWalletType();
				String customerId = order.getCustId();
				Wallet wallet = walletAmount(customerId, type);
				wallet.setAmt(wallet.getAmt() + billAmt);
				trans = session.beginTransaction();
				session.saveOrUpdate(wallet);
				trans.commit();
				session.close();
				sFactory.close();
				return "Order Rejected and amount refunded....";
			}
		}

		else {
			OrderDetails order1 = seachOrderId(orderId);
			if (status.toUpperCase().equals("OUTFORPICKUP")) {
				// order1=seachOrderId(orderId);
				order1.setStatus(Status.OUTFORPICKUP);
				sFactory = SessionHelper.getConnection();
				session = sFactory.openSession();
				Transaction trans = session.beginTransaction();
				session.saveOrUpdate(order1);
				trans.commit();
				session.close();
				sFactory.close();
				return "Status Updated....";
			} else if (status.toUpperCase().equals("OUTFORDELIVERY")) {

				order1.setStatus(Status.OUTFORDELIVERY);
				sFactory = SessionHelper.getConnection();
				session = sFactory.openSession();
				Transaction trans = session.beginTransaction();
				session.saveOrUpdate(order1);
				trans.commit();
				session.close();
				sFactory.close();
				return "Status Updated....";
			} else {
				order1.setStatus(Status.DELIVERED);
				sFactory = SessionHelper.getConnection();
				session = sFactory.openSession();
				Transaction trans = session.beginTransaction();
				session.saveOrUpdate(order1);
				trans.commit();
				session.close();
				sFactory.close();
				return "Status Updated....";
			}
		}

	}
}
