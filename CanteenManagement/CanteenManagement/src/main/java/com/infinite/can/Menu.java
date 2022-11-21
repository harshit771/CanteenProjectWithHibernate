package com.infinite.can;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "menu_details")
public class Menu {

	private String menu_id;
	private String rest_id;
	private String menu_item;
	private String menu_price;
	private String menu_type;

	@Id
	@Column(name = "menu_id")
	public String getMenu_id() {
		return menu_id;
	}

	public void setMenu_id(String menu_id) {
		this.menu_id = menu_id;
	}

	@Column(name = "rest_id")
	public String getRest_id() {
		return rest_id;
	}

	public void setRest_id(String rest_id) {
		this.rest_id = rest_id;
	}

	@Column(name = "menu_item")
	public String getMenu_item() {
		return menu_item;
	}

	public void setMenu_item(String menu_item) {
		this.menu_item = menu_item;
	}

	@Column(name = "menu_price")
	public String getMenu_price() {
		return menu_price;
	}

	public void setMenu_price(String menu_price) {
		this.menu_price = menu_price;
	}

	@Column(name = "menu_type")
	public String getMenu_type() {
		return menu_type;
	}

	public void setMenu_type(String menu_type) {
		this.menu_type = menu_type;
	}

	@Override
	public String toString() {
		return "Menu [menu_id=" + menu_id + ", rest_id=" + rest_id + ", menu_item=" + menu_item + ", menu_price="
				+ menu_price + ", menu_type=" + menu_type + "]";
	}

}