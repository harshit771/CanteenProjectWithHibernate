package com.infinite.can;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "customer_details")

public class Customer {

	@Id
	@Column(name = "cust_id")
	private String cust_id;

	@Column(name = "cust_name")
	private String cust_name;

	@Column(name = "cust_city")
	private String cust_city;

	@Column(name = "cust_gender")
	private String cust_gender;

	@Column(name = "cust_phn_no")
	private String cust_phn_no;

	@Column(name = "cust_email")
	private String cust_email;

	@Column(name = "cust_password")
	private String cust_password;

	@Column(name = "cust_userName")
	private String cust_userName;

	public String getCust_id() {
		return cust_id;
	}

	public void setCust_id(String cust_id) {
		this.cust_id = cust_id;
	}

	public String getCust_name() {
		return cust_name;
	}

	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}

	public String getCust_city() {
		return cust_city;
	}

	public void setCust_city(String cust_city) {
		this.cust_city = cust_city;
	}

	public String getCust_gender() {
		return cust_gender;
	}

	public void setCust_gender(String cust_gender) {
		this.cust_gender = cust_gender;
	}

	public String getCust_phn_no() {
		return cust_phn_no;
	}

	public void setCust_phn_no(String cust_phn_no) {
		this.cust_phn_no = cust_phn_no;
	}

	public String getCust_email() {
		return cust_email;
	}

	public void setCust_email(String cust_email) {
		this.cust_email = cust_email;
	}

	public String getCust_password() {
		return cust_password;
	}

	public void setCust_password(String cust_password) {
		this.cust_password = cust_password;
	}

	public String getCust_userName() {
		return cust_userName;
	}

	public void setCust_userName(String cust_userName) {
		this.cust_userName = cust_userName;
	}
}
