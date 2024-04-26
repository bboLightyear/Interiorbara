package com.tech.ibara.shop.api;

public class AuthAnnotation {

	private String access_token;
	private long expired_at;
	private long now;

	public AuthAnnotation() {

	}

	public String getAccess_token() {
		return access_token;
	}

	public void setAccess_token(String access_token) {
		this.access_token = access_token;
	}

	public long getExpired_at() {
		return expired_at;
	}

	public void setExpired_at(long expired_at) {
		this.expired_at = expired_at;
	}

	public long getNow() {
		return now;
	}

	public void setNow(long now) {
		this.now = now;
	}

}
