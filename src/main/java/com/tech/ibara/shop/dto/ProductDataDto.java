package com.tech.ibara.shop.dto;

public class ProductDataDto {

	private int product_data_id;
	private int stock;
	private int price;
	private Integer discounted_price;

	public ProductDataDto() {

	}

	public int getProduct_data_id() {
		return product_data_id;
	}

	public void setProduct_data_id(int product_data_id) {
		this.product_data_id = product_data_id;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Integer getDiscounted_price() {
		return discounted_price;
	}

	public void setDiscounted_price(Integer discounted_price) {
		this.discounted_price = discounted_price;
	}

}
