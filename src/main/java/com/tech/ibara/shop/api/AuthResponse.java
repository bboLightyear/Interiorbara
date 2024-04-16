package com.tech.ibara.shop.api;

public class AuthResponse {

	private int code;
	private String message;
	private AuthAnnotation response;

	public AuthResponse() {

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

	public AuthAnnotation getResponse() {
		return response;
	}

	public void setResponse(AuthAnnotation response) {
		this.response = response;
	}

}
