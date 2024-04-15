package com.tech.ibara.biz.dto;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
public class BizSearchTempDto {
	
	private int bst_no;
	private float bst_staravg;
	private int bst_rvcnt;
	private int inteno;
	
	public int getBst_no() {
		return bst_no;
	}
	public void setBst_no(int bst_no) {
		this.bst_no = bst_no;
	}
	public float getBst_staravg() {
		return bst_staravg;
	}
	public void setBst_staravg(float bst_staravg) {
		this.bst_staravg = bst_staravg;
	}
	public int getBst_rvcnt() {
		return bst_rvcnt;
	}
	public void setBst_rvcnt(int bst_rvcnt) {
		this.bst_rvcnt = bst_rvcnt;
	}
	public int getInteno() {
		return inteno;
	}
	public void setInteno(int inteno) {
		this.inteno = inteno;
	}
	
	

	
}
