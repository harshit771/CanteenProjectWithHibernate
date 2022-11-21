package com.infinite.can;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "vendor_details")
public class Vendor {
	@Id
	@Column(name = "vend_id")
	private String vend_id;
	@Column(name = "vend_name")
	private String vend_name;
	@Column(name = "vend_email")
	private String vend_email;
	@Column(name = "vend_mob_no")
	private String vend_mob_no;

	public String getVend_mob_no() {
		return vend_mob_no;
	}

	public void setVend_mob_no(String vend_mob_no) {
		this.vend_mob_no = vend_mob_no;
	}

	@Column(name = "vend_password")
	private String vend_password;
	@Column(name = "vend_userName")
	private String vend_userName;

	public String getVend_id() {
		return vend_id;
	}

	public void setVend_id(String vend_id) {
		this.vend_id = vend_id;
	}

	public String getVend_name() {
		return vend_name;
	}

	public void setVend_name(String vend_name) {
		this.vend_name = vend_name;
	}

	public String getVend_email() {
		return vend_email;
	}

	public void setVend_email(String vend_email) {
		this.vend_email = vend_email;
	}

	public String getVend_password() {
		return vend_password;
	}

	public void setVend_password(String vend_password) {
		this.vend_password = vend_password;
	}

	public String getVend_userName() {
		return vend_userName;
	}

	public void setVend_userName(String vend_userName) {
		this.vend_userName = vend_userName;
	}
}
