package com.infinite.can;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

public class RestaurantDAO {

	SessionFactory sessionFactory;

	public String addResturant(Restaurant resturant) throws Exception   {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Criteria cr = session.createCriteria(Restaurant.class);
		Transaction transaction = session.beginTransaction();
		String restId = idgenerate();
		resturant.setResturantId(restId);
//		File file = new File("C:\\Users\\harshitt\\Downloads");
//       
//        FileInputStream fileInputStream = new FileInputStream(file);
//        byte[] bFile = new byte[fileInputStream.available()];
//        fileInputStream.read(bFile);
//        
//        
//		resturant.setImage(bFile);
		session.save(resturant);
		transaction.commit();
		session.close();
		return "resturant added";
	}

	public String idgenerate() {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Criteria cr = session.createCriteria(Restaurant.class);
		List<Restaurant> resturantList = cr.list();
		if (resturantList.size() == 0) {
			return "R001";
		} else {
			int id = Integer.parseInt(resturantList.get(resturantList.size() - 1).getResturantId().substring(1));
			String rid = String.format("R%03d", ++id);
			return rid;
		}
	}

	public List<Restaurant> searchRestaurant(String userName) {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(Restaurant.class);
		criteria.add(Restrictions.eq("username", userName));
		List<Restaurant> resturantList = criteria.list();
		return resturantList;
	}

	public List<Restaurant> showRest() {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(Restaurant.class);

		List<Restaurant> restList = criteria.list();
		return restList;
	}

	public int validate(String userName, String password) {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Criteria cr = session.createCriteria(Restaurant.class);
		cr.add(Restrictions.eq("username", userName));
		cr.add(Restrictions.eq("password", password));
		List<Restaurant> listres = cr.list();
		return listres.size();
	}

	public List<Restaurant> searchById(String restId) {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(Restaurant.class);
		criteria.add(Restrictions.eq("resturantId", restId));
		List<Restaurant> resturantList = criteria.list();
		return resturantList;
	}

	public List<OrderDetails> searchRestaurantId(String restId) {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from OrderDetails where restId=:restId  " + "AND address is NOT NULL")
				.setParameter("restId", restId);
		List<OrderDetails> orderList = query.list();
		return orderList;
	}

	public List<OrderDetails> searchRestaurantOrder(String restId, String searchType) {
		sessionFactory = SessionHelper.getConnection();
		Session session = sessionFactory.openSession();
		Criteria cr = session.createCriteria(OrderDetails.class);
		Criterion criterion1, criterion2;
		if (searchType.equals("PENDING")) {

			Query query=session.createQuery("from OrderDetails where restId=:restId AND status=:status"
			+ " AND address is NOT NULL").setParameter("restId", restId).setParameter("status", Status.PENDING);
			
			List<OrderDetails> list = query.list();
			return list;	
			
		}
		else {
		if (searchType.equals("ACCEPTED")) {
			criterion1 = Restrictions.eq("restId", restId);
			criterion2 = Restrictions.eq("status", Status.ACCEPTED);
			cr.add(Restrictions.and(criterion1, criterion2));
		}

		if (searchType.equals("CANCELLED")) {
			criterion1 = Restrictions.eq("restId", restId);
			criterion2 = Restrictions.eq("status", Status.CANCELLED);
			cr.add(Restrictions.and(criterion1, criterion2));
		}

		if (searchType.equals("DELIVERED")) {
			criterion1 = Restrictions.eq("restId", restId);
			criterion2 = Restrictions.eq("status", Status.DELIVERED);
			cr.add(Restrictions.and(criterion1, criterion2));
		}

		if (searchType.equals("REJECTED")) {
			criterion1 = Restrictions.eq("restId", restId);
			criterion2 = Restrictions.eq("status", Status.REJECTED);
			cr.add(Restrictions.and(criterion1, criterion2));
		}

		List<OrderDetails> list = cr.list();
		return list;
	}
	}
}