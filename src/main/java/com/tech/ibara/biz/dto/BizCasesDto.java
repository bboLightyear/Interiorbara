package com.tech.ibara.biz.dto;

import java.sql.Timestamp;

public class BizCasesDto {

	private int bc_no;
	private String	bc_title;
	private String	bc_content;
	private Timestamp bc_date;
	private int bc_hit;
	private int biz_idno;
	private String bc_thumb;
	
	public int getBc_no() {
		return bc_no;
	}
	public void setBc_no(int bc_no) {
		this.bc_no = bc_no;
	}
	public String getBc_title() {
		return bc_title;
	}
	public void setBc_title(String bc_title) {
		this.bc_title = bc_title;
	}
	public String getBc_content() {
		return bc_content;
	}
	public void setBc_content(String bc_content) {
		this.bc_content = bc_content;
	}
	public Timestamp getBc_date() {
		return bc_date;
	}
	public void setBc_date(Timestamp bc_date) {
		this.bc_date = bc_date;
	}
	public int getBc_hit() {
		return bc_hit;
	}
	public void setBc_hit(int bc_hit) {
		this.bc_hit = bc_hit;
	}
	public int getBiz_idno() {
		return biz_idno;
	}
	public void setBiz_idno(int biz_idno) {
		this.biz_idno = biz_idno;
	}
	public String getBc_thumb() {
		return bc_thumb;
	}
	public void setBc_thumb(String bc_thumb) {
		this.bc_thumb = bc_thumb;
	}
	
}
