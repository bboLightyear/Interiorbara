package com.tech.ibara.shop.dto;

public class BasketDto {

	private int basket_id;
	private int user_id;
	private int product_id;
	private int option_id;
	private int quantity;
	private String option_text;

	public BasketDto() {

	}

	public BasketDto(int user_id, int product_id, int option_id, int quantity, String option_text) {
		this.user_id = user_id;
		this.product_id = product_id;
		this.option_id = option_id;
		this.quantity = quantity;
		this.option_text = option_text;
	}

	public int getBasket_id() {
		return basket_id;
	}

	public void setBasket_id(int basket_id) {
		this.basket_id = basket_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public int getOption_id() {
		return option_id;
	}

	public void setOption_id(int option_id) {
		this.option_id = option_id;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getOption_text() {
		return option_text;
	}

	public void setOption_text(String option_text) {
		this.option_text = option_text;
	}

}
