package com.tech.ibara.oh.dto;

import java.util.Date;

public class OHPhotoReply {

	private int pr_no;
	private String pr_user;
	private String pr_content;
	private Date pr_date;
	private int pr_group;
	private int pr_step;
	private int pr_indent;
	private int pb_no;
	
	public OHPhotoReply() {
		// TODO Auto-generated constructor stub
	}

	public OHPhotoReply(int pr_no, String pr_user, String pr_content, Date pr_date, 
						int pr_group, int pr_step, int pr_indent, int pb_no) {
		this.pr_no = pr_no;
		this.pr_user = pr_user;
		this.pr_content = pr_content;
		this.pr_date = pr_date;
		this.pr_group = pr_group;
		this.pr_step = pr_step;
		this.pr_indent = pr_indent;
		this.pb_no = pb_no;
	}

	public int getPr_no() {
		return pr_no;
	}

	public void setPr_no(int pr_no) {
		this.pr_no = pr_no;
	}

	public String getPr_user() {
		return pr_user;
	}

	public void setPr_user(String pr_user) {
		this.pr_user = pr_user;
	}

	public String getPr_content() {
		return pr_content;
	}

	public void setPr_content(String pr_content) {
		this.pr_content = pr_content;
	}

	public Date getPr_date() {
		return pr_date;
	}

	public void setPr_date(Date pr_date) {
		this.pr_date = pr_date;
	}

	public int getPr_group() {
		return pr_group;
	}

	public void setPr_group(int pr_group) {
		this.pr_group = pr_group;
	}

	public int getPr_step() {
		return pr_step;
	}

	public void setPr_step(int pr_step) {
		this.pr_step = pr_step;
	}

	public int getPr_indent() {
		return pr_indent;
	}

	public void setPr_indent(int pr_indent) {
		this.pr_indent = pr_indent;
	}

	public int getPb_no() {
		return pb_no;
	}

	public void setPb_no(int pb_no) {
		this.pb_no = pb_no;
	}
	
}
