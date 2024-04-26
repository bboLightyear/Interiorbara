package com.tech.ibara.shop.dto;

public class OrdererInfoDto {

	private int orderer_info_id;
	private Integer user_id;
	private int name;
	private int phone;
	private String email;

	public OrdererInfoDto() {

	}

	public OrdererInfoDto(Integer user_id, int name, int phone, String email) {
		this.user_id = user_id;
		this.name = name;
		this.phone = phone;
		this.email = email;
	}

	public int getOrderer_info_id() {
		return orderer_info_id;
	}

	public void setOrderer_info_id(int orderer_info_id) {
		this.orderer_info_id = orderer_info_id;
	}

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

	public int getName() {
		return name;
	}

	public void setName(int name) {
		this.name = name;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
