package com.tech.ibara.shop.dto;

import java.util.Date;

public class OrderDto {

	private int order_id;
	private Integer user_id;
	private int order_state_id;
	private Integer user_addr_id;
	private Integer orderer_info_id;
	private Integer payment_info_id;
	private Date order_date;
	private int amount;

	public OrderDto() {
	}

	public OrderDto(Integer user_id, int order_state_id, Integer user_addr_id, Integer orderer_info_id,
			Integer payment_info_id, Date order_date, int amount) {
		super();
		this.user_id = user_id;
		this.order_state_id = order_state_id;
		this.user_addr_id = user_addr_id;
		this.orderer_info_id = orderer_info_id;
		this.payment_info_id = payment_info_id;
		this.order_date = order_date;
		this.amount = amount;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

	public int getOrder_state_id() {
		return order_state_id;
	}

	public void setOrder_state_id(int order_state_id) {
		this.order_state_id = order_state_id;
	}

	public Integer getUser_addr_id() {
		return user_addr_id;
	}

	public void setUser_addr_id(Integer user_addr_id) {
		this.user_addr_id = user_addr_id;
	}

	public Integer getOrderer_info_id() {
		return orderer_info_id;
	}

	public void setOrderer_info_id(Integer orderer_info_id) {
		this.orderer_info_id = orderer_info_id;
	}

	public Integer getPayment_info_id() {
		return payment_info_id;
	}

	public void setPayment_info_id(Integer payment_info_id) {
		this.payment_info_id = payment_info_id;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

}
