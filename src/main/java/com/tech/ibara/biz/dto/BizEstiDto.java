package com.tech.ibara.biz.dto;

import java.sql.Timestamp;
import java.util.Date;

public class BizEstiDto {
	private int be_no;
	private Date be_wantdate;
	private Timestamp be_date;
	private String be_content;
	private String be_tel;
	private String be_addr;
	private String be_code;
	private int be_size;
	private String be_type;
	private int be_total_price;
	private int biz_idno;
	private int user_idno;
	private int bp_no;
	
	public int getBe_no() {
		return be_no;
	}
	public void setBe_no(int be_no) {
		this.be_no = be_no;
	}
	public Date getBe_wantdate() {
		return be_wantdate;
	}
	public void setBe_wantdate(Date be_wantdate) {
		this.be_wantdate = be_wantdate;
	}
	public Timestamp getBe_date() {
		return be_date;
	}
	public void setBe_date(Timestamp be_date) {
		this.be_date = be_date;
	}
	public String getBe_content() {
		return be_content;
	}
	public void setBe_content(String be_content) {
		this.be_content = be_content;
	}
	public String getBe_tel() {
		return be_tel;
	}
	public void setBe_tel(String be_tel) {
		this.be_tel = be_tel;
	}
	public String getBe_addr() {
		return be_addr;
	}
	public void setBe_addr(String be_addr) {
		this.be_addr = be_addr;
	}
	public String getBe_code() {
		return be_code;
	}
	public void setBe_code(String be_code) {
		this.be_code = be_code;
	}
	public int getBe_size() {
		return be_size;
	}
	public void setBe_size(int be_size) {
		this.be_size = be_size;
	}
	public String getBe_type() {
		return be_type;
	}
	public void setBe_type(String be_type) {
		this.be_type = be_type;
	}
	public int getBe_total_price() {
		return be_total_price;
	}
	public void setBe_total_price(int be_total_price) {
		this.be_total_price = be_total_price;
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
	public int getBp_no() {
		return bp_no;
	}
	public void setBp_no(int bp_no) {
		this.bp_no = bp_no;
	}
}
