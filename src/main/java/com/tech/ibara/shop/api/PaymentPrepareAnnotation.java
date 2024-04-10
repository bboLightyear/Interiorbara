package com.tech.ibara.shop.api;

public class PaymentPrepareAnnotation {

	private String merchant_uid;
	private int amount;

	public PaymentPrepareAnnotation() {

	}

	public String getMerchant_uid() {
		return merchant_uid;
	}

	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

}
