package com.tech.ibara.shop.dto;

public class AttributeDto {

	private int attribute_id;
	private int product_id;
	private String type;
	private String value;

	public AttributeDto() {

	}

	public AttributeDto(int product_id, String type, String value) {
		this.product_id = product_id;
		this.type = type;
		this.value = value;
	}

	public int getAttribute_id() {
		return attribute_id;
	}

	public void setAttribute_id(int attribute_id) {
		this.attribute_id = attribute_id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

}
