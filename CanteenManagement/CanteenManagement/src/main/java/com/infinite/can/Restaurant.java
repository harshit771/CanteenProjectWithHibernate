package com.infinite.can;

import java.util.Arrays;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name = "restaurant")
public class Restaurant {

	@Override
	public String toString() {
		return "Restaurant [resturantId=" + resturantId + ", name=" + name + ", city=" + city + ", state=" + state
				+ ", pincode=" + pincode + ", email=" + email + ", mobileno=" + mobileno + ", username=" + username
				+ ", password=" + password + ", image=" + Arrays.toString(image) + "]";
	}

	@Id
	@Column(name = "rest_id")
	private String resturantId;
	@Column(name = "rest_name")
	private String name;
	@Column(name = "city")
	private String city;
	@Column(name = "state")
	private String state;
	@Column(name = "pincode")
	private int pincode;
	@Column(name = "rest_email")
	private String email;
	@Column(name = "rest_mob_no")
	private String mobileno;
	@Column(name = "rest_userName")
	private String username;
	@Column(name = "rest_password")
	private String password;

	@Lob
	@Column(name = "image")
	private byte[] image;

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	public String getResturantId() {
		return resturantId;
	}

	public void setResturantId(String resturantId) {
		this.resturantId = resturantId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getPincode() {
		return pincode;
	}

	public void setPincode(int pincode) {
		this.pincode = pincode;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobileno() {
		return mobileno;
	}

	public void setMobileno(String mobileno) {
		this.mobileno = mobileno;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}