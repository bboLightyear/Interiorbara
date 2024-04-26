package com.tech.ibara.shop.dto;

public class OrderStateDto {

	private int order_state_id;
	private String state;

	public OrderStateDto() {
	}

	public int getOrder_state_id() {
		return order_state_id;
	}

	public void setOrder_state_id(int order_state_id) {
		this.order_state_id = order_state_id;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

}
