package com.tech.ibara.shop.dto;

public class BasketDto {

	private int basket_id;
	private int user_id;
	private int product_id;
	private int option_id;
	private int quantity;

	private OptionDto option_dto;
	private OptionDto final_option_dto;

	private OptionSetDto option_set_dto;
	private OptionSetDto final_option_set_dto;

	private ProductDataDto product_data_dto;

	public BasketDto() {

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

	public OptionDto getOption_dto() {
		return option_dto;
	}

	public void setOption_dto(OptionDto option_dto) {
		this.option_dto = option_dto;
	}

	public OptionDto getFinal_option_dto() {
		return final_option_dto;
	}

	public void setFinal_option_dto(OptionDto final_option_dto) {
		this.final_option_dto = final_option_dto;
	}

	public OptionSetDto getOption_set_dto() {
		return option_set_dto;
	}

	public void setOption_set_dto(OptionSetDto option_set_dto) {
		this.option_set_dto = option_set_dto;
	}

	public OptionSetDto getFinal_option_set_dto() {
		return final_option_set_dto;
	}

	public void setFinal_option_set_dto(OptionSetDto final_option_set_dto) {
		this.final_option_set_dto = final_option_set_dto;
	}

	public ProductDataDto getProduct_data_dto() {
		return product_data_dto;
	}

	public void setProduct_data_dto(ProductDataDto product_data_dto) {
		this.product_data_dto = product_data_dto;
	}

}
