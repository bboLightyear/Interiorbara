package com.tech.ibara.oh.dto;

import com.tech.ibara.my.dto.MyMemberInfoDto;

public class OHPhotoReply {

	private int pr_no;
	private int memno;
	private String pr_content;
	private int pr_like;
	private String pr_date;
	private int pr_group;
	private int pr_step;
	private int pr_indent;
	private int pb_no;
	
	private MyMemberInfoDto myMemberInfoDto;
	
	public MyMemberInfoDto getMyMemberInfoDto() {
		return myMemberInfoDto;
	}

	public void setMyMemberInfoDto(MyMemberInfoDto myMemberInfoDto) {
		this.myMemberInfoDto = myMemberInfoDto;
	}	
	
	public OHPhotoReply() {
		// TODO Auto-generated constructor stub
	}

	public OHPhotoReply(int pr_no, int memno, String pr_content, int pr_like, String pr_date, int pr_group, int pr_step,
			int pr_indent, int pb_no, MyMemberInfoDto myMemberInfoDto) {
		super();
		this.pr_no = pr_no;
		this.memno = memno;
		this.pr_content = pr_content;
		this.pr_like = pr_like;
		this.pr_date = pr_date;
		this.pr_group = pr_group;
		this.pr_step = pr_step;
		this.pr_indent = pr_indent;
		this.pb_no = pb_no;
		this.myMemberInfoDto = myMemberInfoDto;
	}

	public int getPr_no() {
		return pr_no;
	}

	public void setPr_no(int pr_no) {
		this.pr_no = pr_no;
	}

	public int getMemno() {
		return memno;
	}

	public void setMemno(int memno) {
		this.memno = memno;
	}

	public String getPr_content() {
		return pr_content;
	}

	public void setPr_content(String pr_content) {
		this.pr_content = pr_content;
	}

	public int getPr_like() {
		return pr_like;
	}

	public void setPr_like(int pr_like) {
		this.pr_like = pr_like;
	}

	public String getPr_date() {
		return pr_date;
	}

	public void setPr_date(String pr_date) {
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
