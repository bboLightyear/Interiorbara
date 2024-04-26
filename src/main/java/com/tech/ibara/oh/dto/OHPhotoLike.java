package com.tech.ibara.oh.dto;

import java.util.Date;

public class OHPhotoLike {

	private int pl_no;	
	private int memno;	
	private Date pl_date;
	private int pb_no;
	
	public OHPhotoLike() {
		// TODO Auto-generated constructor stub
	}

	public OHPhotoLike(int pl_no, int memno, 
					   Date pl_date, int pb_no) {
		this.pl_no = pl_no;
		this.memno = memno;
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
