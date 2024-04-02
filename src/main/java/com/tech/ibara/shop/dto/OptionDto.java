package com.tech.ibara.shop.dto;

public class OptionDto {

	private int option_id;
	private int option_set_id;
	private Integer parent_option_id;
	private String name;
	private int stock;
	private int price;
	private Integer discounted_price;

	public OptionDto() {

	}

	public OptionDto(int option_set_id, Integer parent_option_id, String name, int stock, int price,
			Integer discounted_price) {
		this.option_set_id = option_set_id;
		this.parent_option_id = parent_option_id;
		this.name = name;
		this.stock = stock;
		this.price = price;
		this.discounted_price = discounted_price;
	}

	public int getOption_id() {
		return option_id;
	}

	public void setOption_id(int option_id) {
		this.option_id = option_id;
	}

	public int getOption_set_id() {
		return option_set_id;
	}

	public void setOption_set_id(int option_set_id) {
		this.option_set_id = option_set_id;
	}

	public Integer getParent_option_id() {
		return parent_option_id;
	}

	public void setParent_option_id(Integer parent_option_id) {
		this.parent_option_id = parent_option_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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
