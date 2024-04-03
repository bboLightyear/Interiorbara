package com.tech.ibara.shop.dto;

import java.util.Date;

public class QnaDto {

	private int qna_id;
	private int product_id;
	private int user_id;
	private Date q_reg_time;
	private String q_content;
	private String is_answered;
	private Date a_reg_time;
	private String a_content;

	public QnaDto() {

	}

	public QnaDto(int product_id, int user_id, String q_content) {
		this.product_id = product_id;
		this.user_id = user_id;
		this.q_content = q_content;
	}

	public int getQna_id() {
		return qna_id;
	}

	public void setQna_id(int qna_id) {
		this.qna_id = qna_id;
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

	public Date getQ_reg_time() {
		return q_reg_time;
	}

	public void setQ_reg_time(Date q_reg_time) {
		this.q_reg_time = q_reg_time;
	}

	public String getQ_content() {
		return q_content;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}

	public String getIs_answered() {
		return is_answered;
	}

	public void setIs_answered(String is_answered) {
		this.is_answered = is_answered;
	}

	public Date getA_reg_time() {
		return a_reg_time;
	}

	public void setA_reg_time(Date a_reg_time) {
		this.a_reg_time = a_reg_time;
	}

	public String getA_content() {
		return a_content;
	}

	public void setA_content(String a_content) {
		this.a_content = a_content;
	}

}
