package com.tech.ibara.shop.dto;

import java.util.Date;

public class ReviewDto {

	private int review_id;
	private int product_id;
	private int user_id;
	private int score;
	private String file_src;
	private String content;
	private Date reg_date;

	public ReviewDto() {

	}

	public ReviewDto(int product_id, int user_id, int score, String file_src, String content, Date reg_date) {
		super();
		this.product_id = product_id;
		this.user_id = user_id;
		this.score = score;
		this.file_src = file_src;
		this.content = content;
		this.reg_date = reg_date;
	}

	public int getReview_id() {
		return review_id;
	}

	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getFile_src() {
		return file_src;
	}

	public void setFile_src(String file_src) {
		this.file_src = file_src;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

}
