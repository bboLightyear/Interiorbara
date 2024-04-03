package com.tech.ibara.shop.dto;

import java.util.Date;

public class OrderDto {

	private int order_id;
	private int user_id;
	private int order_state_id;
	private String address_name;
	private String receiver_name;
	private Integer receiver_phone;
	private Integer zipcode;
	private String big_address;
	private String detail_address;
	private String orderer_name;
	private Integer orderer_phone;
	private String orderer_email;
	private Integer payment_type_id;
	private Date order_date;
	private int total_price;
	private int total_delivery_fee;
	private int amount;

	public OrderDto() {

	}

	public OrderDto(int user_id, int order_state_id, String address_name, String receiver_name, Integer receiver_phone,
			Integer zipcode, String big_address, String detail_address, String orderer_name, Integer orderer_phone,
			String orderer_email, int total_price, int total_delivery_fee, int amount) {
		this.user_id = user_id;
		this.order_state_id = order_state_id;
		this.address_name = address_name;
		this.receiver_name = receiver_name;
		this.receiver_phone = receiver_phone;
		this.zipcode = zipcode;
		this.big_address = big_address;
		this.detail_address = detail_address;
		this.orderer_name = orderer_name;
		this.orderer_phone = orderer_phone;
		this.orderer_email = orderer_email;
		this.total_price = total_price;
		this.total_delivery_fee = total_delivery_fee;
		this.amount = amount;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getOrder_state_id() {
		return order_state_id;
	}

	public void setOrder_state_id(int order_state_id) {
		this.order_state_id = order_state_id;
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

	public Integer getReceiver_phone() {
		return receiver_phone;
	}

	public void setReceiver_phone(Integer receiver_phone) {
		this.receiver_phone = receiver_phone;
	}

	public Integer getZipcode() {
		return zipcode;
	}

	public void setZipcode(Integer zipcode) {
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

	public String getOrderer_name() {
		return orderer_name;
	}

	public void setOrderer_name(String orderer_name) {
		this.orderer_name = orderer_name;
	}

	public Integer getOrderer_phone() {
		return orderer_phone;
	}

	public void setOrderer_phone(Integer orderer_phone) {
		this.orderer_phone = orderer_phone;
	}

	public String getOrderer_email() {
		return orderer_email;
	}

	public void setOrderer_email(String orderer_email) {
		this.orderer_email = orderer_email;
	}

	public Integer getPayment_type_id() {
		return payment_type_id;
	}

	public void setPayment_type_id(Integer payment_type_id) {
		this.payment_type_id = payment_type_id;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	public int getTotal_delivery_fee() {
		return total_delivery_fee;
	}

	public void setTotal_delivery_fee(int total_delivery_fee) {
		this.total_delivery_fee = total_delivery_fee;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

}
