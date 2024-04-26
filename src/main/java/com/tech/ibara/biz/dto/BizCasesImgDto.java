package com.tech.ibara.biz.dto;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
public class BizCasesImgDto {
	
	private int bcimg_no;
	private String bcimg_ogn;
	private String bcimg_cgn;
	private int bc_no;
	
	public int getBcimg_no() {
		return bcimg_no;
	}
	public void setBcimg_no(int bcimg_no) {
		this.bcimg_no = bcimg_no;
	}
	public String getBcimg_ogn() {
		return bcimg_ogn;
	}
	public void setBcimg_ogn(String bcimg_ogn) {
		this.bcimg_ogn = bcimg_ogn;
	}
	public String getBcimg_cgn() {
		return bcimg_cgn;
	}
	public void setBcimg_cgn(String bcimg_cgn) {
		this.bcimg_cgn = bcimg_cgn;
	}
	public int getBc_no() {
		return bc_no;
	}
	public void setBc_no(int bc_no) {
		this.bc_no = bc_no;
	}
	
	
}
