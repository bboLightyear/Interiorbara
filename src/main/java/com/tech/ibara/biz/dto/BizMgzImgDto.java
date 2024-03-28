package com.tech.ibara.biz.dto;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
public class BizMgzImgDto {
	
	private int bmimg_no;
	private String bmimg_ogn;
	private String bmimg_cgn;
	private int bm_no;
	
	public int getBmimg_no() {
		return bmimg_no;
	}
	public void setBmimg_no(int bmimg_no) {
		this.bmimg_no = bmimg_no;
	}
	public String getBmimg_ogn() {
		return bmimg_ogn;
	}
	public void setBmimg_ogn(String bmimg_ogn) {
		this.bmimg_ogn = bmimg_ogn;
	}
	public String getBmimg_cgn() {
		return bmimg_cgn;
	}
	public void setBmimg_cgn(String bmimg_cgn) {
		this.bmimg_cgn = bmimg_cgn;
	}
	public int getBm_no() {
		return bm_no;
	}
	public void setBm_no(int bm_no) {
		this.bm_no = bm_no;
	}
	
	
}
