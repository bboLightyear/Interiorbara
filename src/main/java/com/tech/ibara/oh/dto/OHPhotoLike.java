package com.tech.ibara.oh.dto;

import java.util.Date;

public class OHPhotoLike {

	private int pl_no;	
	private int memno;
	private String nickname;	
	private Date pl_date;
	private int pb_no;
	
	public OHPhotoLike() {
		// TODO Auto-generated constructor stub
	}

	public OHPhotoLike(int pl_no, int memno, String nickname, 
					   Date pl_date, int pb_no) {
		this.pl_no = pl_no;
		this.memno = memno;
		this.nickname = nickname;
		this.pl_date = pl_date;
		this.pb_no = pb_no;
	}

	public int getPl_no() {
		return pl_no;
	}

	public void setPl_no(int pl_no) {
		this.pl_no = pl_no;
	}

	public int getMemno() {
		return memno;
	}

	public void setMemno(int memno) {
		this.memno = memno;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Date getPl_date() {
		return pl_date;
	}

	public void setPl_date(Date pl_date) {
		this.pl_date = pl_date;
	}

	public int getPb_no() {
		return pb_no;
	}

	public void setPb_no(int pb_no) {
		this.pb_no = pb_no;
	}

}
