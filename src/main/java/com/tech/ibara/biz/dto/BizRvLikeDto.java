package com.tech.ibara.biz.dto;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
public class BizRvLikeDto {
	
	private int br_like_no;
	private int memno;
	private int br_no;
	
	public int getBr_like_no() {
		return br_like_no;
	}
	public void setBr_like_no(int br_like_no) {
		this.br_like_no = br_like_no;
	}
	public int getMemno() {
		return memno;
	}
	public void setMemno(int memno) {
		this.memno = memno;
	}
	public int getBr_no() {
		return br_no;
	}
	public void setBr_no(int br_no) {
		this.br_no = br_no;
	}
	
}
