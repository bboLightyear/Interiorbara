package com.tech.ibara.shop.dto;

public class CategoryDto {

	private int category_id;
	private Integer up_category_id;
	private String name;

	public CategoryDto() {

	}

	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}

	public Integer getUp_category_id() {
		return up_category_id;
	}

	public void setUp_category_id(Integer up_category_id) {
		this.up_category_id = up_category_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}