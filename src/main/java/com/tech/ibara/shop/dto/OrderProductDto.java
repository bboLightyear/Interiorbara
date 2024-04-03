package com.tech.ibara.shop.dto;

public class OrderProductDto {

	private int order_product_id;
	private int order_id;
	private int product_id;
	private int option_id;
	private String name;
	private int total_price;
	private int total_delivery_fee;
	private int quantity;
	private String option_text;

	public OrderProductDto() {

	}

	public OrderProductDto(int order_id, int product_id, int option_id, String name, int total_price,
			int total_delivery_fee, int quantity, String option_text) {
		this.order_id = order_id;
		this.product_id = product_id;
		this.option_id = option_id;
		this.name = name;
		this.total_price = total_price;
		this.total_delivery_fee = total_delivery_fee;
		this.quantity = quantity;
		this.option_text = option_text;
	}

	public int getOrder_product_id() {
		return order_product_id;
	}

	public void setOrder_product_id(int order_product_id) {
		this.order_product_id = order_product_id;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	public int getTotal_delivery_fee() {
		return total_delivery_fee;
	}

	public void setTotal_delivery_fee(int total_delivery_fee) {
		this.total_delivery_fee = total_delivery_fee;
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
