package com.tech.ibara.biz.dto;

import java.sql.Timestamp;

public class BizMgzDto {
	private int bm_no;
	private String bm_title;
	private String bm_content;
	private String bm_writer;
	private String bm_img;
	private Timestamp bm_date;
	private int bm_hit;
	private int user_idno;
	
	public BizMgzDto() {
		// TODO Auto-generated constructor stub
	}
	
	public int getBm_no() {
		return bm_no;
	}
	public void setBm_no(int bm_no) {
		this.bm_no = bm_no;
	}
	public String getBm_title() {
		return bm_title;
	}
	public void setBm_title(String bm_title) {
		this.bm_title = bm_title;
	}
	public String getBm_content() {
		return bm_content;
	}
	public void setBm_content(String bm_content) {
		this.bm_content = bm_content;
	}
	public String getBm_img() {
		return bm_img;
	}
	public void setBm_img(String bm_img) {
		this.bm_img = bm_img;
	}
	public Timestamp getBm_date() {
		return bm_date;
	}
	public void setBm_date(Timestamp bm_date) {
		this.bm_date = bm_date;
	}
	public int getBm_hit() {
		return bm_hit;
	}
	public void setBm_hit(int bm_hit) {
		this.bm_hit = bm_hit;
	}
	public int getUser_idno() {
		return user_idno;
	}
	public void setUser_idno(int user_idno) {
		this.user_idno = user_idno;
	}

	public String getBm_writer() {
		return bm_writer;
	}

	public void setBm_writer(String bm_writer) {
		this.bm_writer = bm_writer;
	}
}
