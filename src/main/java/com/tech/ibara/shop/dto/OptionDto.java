package com.tech.ibara.shop.dto;

public class OptionDto {

	private int option_id;
	private int option_set_id;
	private Integer sub_option_set_id;
	private Integer product_data_id;
	private String name;

	private ProductDataDto product_data_dto;

	public OptionDto() {

	}

	public ProductDataDto getProduct_data_dto() {
		return product_data_dto;
	}

	public void setProduct_data_dto(ProductDataDto product_data_dto) {
		this.product_data_dto = product_data_dto;
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

	public Integer getSub_option_set_id() {
		return sub_option_set_id;
	}

	public void setSub_option_set_id(Integer sub_option_set_id) {
		this.sub_option_set_id = sub_option_set_id;
	}

	public Integer getProduct_data_id() {
		return product_data_id;
	}

	public void setProduct_data_id(Integer product_data_id) {
		this.product_data_id = product_data_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}