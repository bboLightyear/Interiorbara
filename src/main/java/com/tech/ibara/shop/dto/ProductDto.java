package com.tech.ibara.shop.dto;

public class ProductDto {

	private int product_id;
	private int seller_id;
	private int category_id;
	private int option_set_id;
	private int detail_info_id;
	private String name;

	public ProductDto() {

	}

	public ProductDto(int seller_id, int category_id, int option_set_id, int detail_info_id, String name) {
		this.seller_id = seller_id;
		this.category_id = category_id;
		this.option_set_id = option_set_id;
		this.detail_info_id = detail_info_id;
		this.name = name;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public int getSeller_id() {
		return seller_id;
	}

	public void setSeller_id(int seller_id) {
		this.seller_id = seller_id;
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

	public int getDetail_info_id() {
		return detail_info_id;
	}

	public void setDetail_info_id(int detail_info_id) {
		this.detail_info_id = detail_info_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
