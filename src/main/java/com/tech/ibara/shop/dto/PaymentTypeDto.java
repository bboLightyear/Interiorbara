package com.tech.ibara.shop.dto;

public class PaymentTypeDto {

	private int payment_type_id;
	private String name;

	public PaymentTypeDto() {

	}

	public int getPayment_type_id() {
		return payment_type_id;
	}

	public void setPayment_type_id(int payment_type_id) {
		this.payment_type_id = payment_type_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
