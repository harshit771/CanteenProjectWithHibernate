package com.infinite.can;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "order_details")
public class OrderDetails {

	@Id
	@Column(name = "order_id")
	private String orderId;

	@Column(name = "cust_id")
	private String custId;

	@Column(name = "vendor_id")
	private String vendorId;

	@Column(name = "menu_id")
	private String menuId;

	@Column(name = "rest_id")
	private String restId;
	@Column(name = "order_qnty")
	private int quantity;

	@Column(name = "order_status")
	@Enumerated(EnumType.STRING)
	private Status status;

	@Column(name = "address")
	private String address;

	@Column(name = "order_cmts")
	private String comments;

	@Column(name = "bill_amt")
	private double billamt;

	@Column(name = "wal_type")
	@Enumerated(EnumType.STRING)
	private Type walletType;

	public String getOrderId() {
		return orderId;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getCustId() {
		return custId;
	}

	public void setCustId(String custId) {
		this.custId = custId;
	}

	public String getVendorId() {
		return vendorId;
	}

	public void setVendorId(String vendorId) {
		this.vendorId = vendorId;
	}

	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public double getBillamt() {
		return billamt;
	}

	public void setBillamt(double billamt) {
		this.billamt = billamt;
	}

	public String getRestId() {
		return restId;
	}

	public void setRestId(String restId) {
		this.restId = restId;
	}

	public Type getWalletType() {
		return walletType;
	}

	public void setWalletType(Type walletType) {
		this.walletType = walletType;
	}

}
