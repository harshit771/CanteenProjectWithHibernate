package com.infinite.can;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

public class WalletDAO {

	SessionFactory sFactory;
	Session session;

	public String GenerateWalletid() {
		sFactory = SessionHelper.getConnection();
		session = sFactory.openSession();
		Criteria cr = session.createCriteria(Customer.class);
		List<Customer> customerList = cr.list();
		session.close();
		if (customerList.size() == 0) {
			return "W001";

		} else {
			String id = customerList.get(customerList.size() - 1).getCust_id();
			int id1 = Integer.parseInt(id.substring(1));
			id1++;
			String id2 = String.format("W%03d", id1);
			return id2;
		}
	}

	public List<Wallet> searchWallet(String cId) {
		sFactory = SessionHelper.getConnection();
		session = sFactory.openSession();
		Criteria cr = session.createCriteria(Wallet.class);
		cr.add(Restrictions.eq("customerId", cId));
//		Projection projection=Projections.property("");
//		 cr.setProjection(projection);
		List<Wallet> walletList = cr.list();
		return walletList;
	}

	public Wallet search(String custId, Type type) {
		sFactory = SessionHelper.getConnection();
		session = sFactory.openSession();
		Criteria cr = session.createCriteria(Wallet.class);
		Criterion criterion1 = Restrictions.eq("customerId", custId);
		Criterion criterion2 = Restrictions.eq("walletType", type);
		cr.add(Restrictions.and(criterion1, criterion2));
		List<Wallet> wallet = cr.list();
		if (wallet.size() == 0) {
			return null;
		}
		return wallet.get(0);
	}

	public String addWallet(Wallet wallet) {
		sFactory = SessionHelper.getConnection();
		session = sFactory.openSession();
		String custId = wallet.getCustomerId();
		Type type = wallet.getWalletType();
		Wallet wallet1 = search(custId, type);
		if (wallet1 == null) {
			String walletId = GenerateWalletid();
			wallet.setWalletId(walletId);
			session = sFactory.openSession();
			Criteria cr = session.createCriteria(Wallet.class);
			Transaction tr = session.beginTransaction();
			session.save(wallet);
			tr.commit();
			return "Amount add with new wallet type.. ";
		} else {
			wallet1.setAmt(wallet1.getAmt() + wallet.getAmt());
			Transaction tr = session.beginTransaction();
			session.update(wallet1);
			tr.commit();
			session.close();
			return "Amount add in your existing wallet type.. ";
		}

	}
}
