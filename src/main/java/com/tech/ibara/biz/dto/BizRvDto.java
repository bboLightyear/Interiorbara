package com.tech.ibara.biz.dto;

import java.sql.Timestamp;

public class BizRvDto {
	private int br_no;
	private String br_content;
	private int br_like_cnt;
	private Timestamp br_date;
	private float br_point;
	private int biz_idno;
	private int user_idno;
	
	
	public int getBr_no() {
		return br_no;
	}
	public void setBr_no(int br_no) {
		this.br_no = br_no;
	}
	public String getBr_content() {
		return br_content;
	}
	public void setBr_content(String br_content) {
		this.br_content = br_content;
	}
	public int getBr_like_cnt() {
		return br_like_cnt;
	}
	public void setBr_like_cnt(int br_like_cnt) {
		this.br_like_cnt = br_like_cnt;
	}
	public Timestamp getBr_date() {
		return br_date;
	}
	public void setBr_date(Timestamp br_date) {
		this.br_date = br_date;
	}
	public float getBr_point() {
		return br_point;
	}
	public void setBr_point(float br_point) {
		this.br_point = br_point;
	}
	public int getBiz_idno() {
		return biz_idno;
	}
	public void setBiz_idno(int biz_idno) {
		this.biz_idno = biz_idno;
	}
	public int getUser_idno() {
		return user_idno;
	}
	public void setUser_idno(int user_idno) {
		this.user_idno = user_idno;
	}
}
