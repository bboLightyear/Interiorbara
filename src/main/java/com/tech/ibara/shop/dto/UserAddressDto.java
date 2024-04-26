package com.tech.ibara.shop.dto;

public class UserAddressDto {

	private int user_address_id;
	private int user_id;
	private String address_name;
	private String receiver_name;
	private int phone;
	private int zipcode;
	private String big_address;
	private String detail_address;

	public UserAddressDto() {

	}

	public UserAddressDto(int user_id, String address_name, String receiver_name, int phone, int zipcode,
			String big_address, String detail_address) {
		this.user_id = user_id;
		this.address_name = address_name;
		this.receiver_name = receiver_name;
		this.phone = phone;
		this.zipcode = zipcode;
		this.big_address = big_address;
		this.detail_address = detail_address;
	}

	public int getUser_address_id() {
		return user_address_id;
	}

	public void setUser_address_id(int user_address_id) {
		this.user_address_id = user_address_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getAddress_name() {
		return address_name;
	}

	public void setAddress_name(String address_name) {
		this.address_name = address_name;
	}

	public String getReceiver_name() {
		return receiver_name;
	}

	public void setReceiver_name(String receiver_name) {
		this.receiver_name = receiver_name;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	public int getZipcode() {
		return zipcode;
	}

	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}

	public String getBig_address() {
		return big_address;
	}

	public void setBig_address(String big_address) {
		this.big_address = big_address;
	}

	public String getDetail_address() {
		return detail_address;
	}

	public void setDetail_address(String detail_address) {
		this.detail_address = detail_address;
	}

}
