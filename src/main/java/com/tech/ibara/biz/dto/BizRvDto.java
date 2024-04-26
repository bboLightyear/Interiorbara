package com.tech.ibara.biz.dto;

import java.sql.Timestamp;

public class BizRvDto {
	private int br_no;
	private String br_content;
	private String br_writer;
	private int br_like_cnt;
	private Timestamp br_date;
	private float br_point;
	private int inteno;
	private int memno;
	
	private BizRvImgDto bizRvImgDto;
	private BizHomeDto bizHomeDto;
	
	
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
	public int getInteno() {
		return inteno;
	}
	public void setInteno(int inteno) {
		this.inteno = inteno;
	}
	public int getMemno() {
		return memno;
	}
	public void setMemno(int memno) {
		this.memno = memno;
	}
	public String getBr_writer() {
		return br_writer;
	}
	public void setBr_writer(String br_writer) {
		this.br_writer = br_writer;
	}
	public BizRvImgDto getBizRvImgDto() {
		return bizRvImgDto;
	}
	public void setBizRvImgDto(BizRvImgDto bizRvImgDto) {
		this.bizRvImgDto = bizRvImgDto;
	}
	public BizHomeDto getBizHomeDto() {
		return bizHomeDto;
	}
	public void setBizHomeDto(BizHomeDto bizHomeDto) {
		this.bizHomeDto = bizHomeDto;
	}
}
