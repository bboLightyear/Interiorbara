package com.tech.ibara.shop.dto;

public class ProductDto {

	private int product_id;
	private int category_id;
	private int option_set_id;
	private String name;

	public ProductDto() {

	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}

	public int getOption_set_id() {
		return option_set_id;
	}

	public void setOption_set_id(int option_set_id) {
		this.option_set_id = option_set_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
