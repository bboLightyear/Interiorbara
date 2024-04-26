package com.tech.ibara.shop.api;

public class PaymentPrepareResponse {

	private int code;
	private String message;
	private PaymentPrepareAnnotation response;

	public PaymentPrepareResponse() {

	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public PaymentPrepareAnnotation getResponse() {
		return response;
	}

	public void setResponse(PaymentPrepareAnnotation response) {
		this.response = response;
	}

}
