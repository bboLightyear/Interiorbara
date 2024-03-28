package com.tech.ibara.biz.dto;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
public class BizRvImgDto {
	
	private int brimg_no;
	private String brimg_ogn;
	private String brimg_cgn;
	private int Br_no;
	
	
	public int getBrimg_no() {
		return brimg_no;
	}
	public void setBrimg_no(int brimg_no) {
		this.brimg_no = brimg_no;
	}
	public String getBrimg_ogn() {
		return brimg_ogn;
	}
	public void setBrimg_ogn(String brimg_ogn) {
		this.brimg_ogn = brimg_ogn;
	}
	public String getBrimg_cgn() {
		return brimg_cgn;
	}
	public void setBrimg_cgn(String brimg_cgn) {
		this.brimg_cgn = brimg_cgn;
	}
	public int getBr_no() {
		return Br_no;
	}
	public void setBr_no(int Br_no) {
		this.Br_no = Br_no;
	}
	
	
}
