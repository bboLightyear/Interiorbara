package com.tech.ibara.biz.dto;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
public class BizRvLikeDto {
	
	private int br_like_no;
	private int user_idno;
	private int br_no;
	
	public int getBr_like_no() {
		return br_like_no;
	}
	public void setBr_like_no(int br_like_no) {
		this.br_like_no = br_like_no;
	}
	public int getUser_idno() {
		return user_idno;
	}
	public void setUser_idno(int user_idno) {
		this.user_idno = user_idno;
	}
	public int getBr_no() {
		return br_no;
	}
	public void setBr_no(int br_no) {
		this.br_no = br_no;
	}
	
}
