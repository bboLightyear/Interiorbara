package com.tech.ibara.oh.dto;

import java.util.Date;

public class OHPhotoReplyLike {

	private int prl_no;
	private int memno;
	private String nickname;
	private Date prl_date;
	private int pr_no;
	
	public OHPhotoReplyLike() {
		// TODO Auto-generated constructor stub
	}

	public OHPhotoReplyLike(int prl_no, int memno, String nickname,
							Date prl_date, int pr_no) {
		this.prl_no = prl_no;
		this.memno = memno;
		this.nickname = nickname;
		this.prl_date = prl_date;
		this.pr_no = pr_no;
	}

	public int getPrl_no() {
		return prl_no;
	}

	public void setPrl_no(int prl_no) {
		this.prl_no = prl_no;
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

	public Date getPrl_date() {
		return prl_date;
	}

	public void setPrl_date(Date prl_date) {
		this.prl_date = prl_date;
	}

	public int getPr_no() {
		return pr_no;
	}

	public void setPr_no(int pr_no) {
		this.pr_no = pr_no;
	}
	
}
