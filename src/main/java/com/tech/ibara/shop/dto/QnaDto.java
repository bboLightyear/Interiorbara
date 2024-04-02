package com.tech.ibara.shop.dto;

import java.sql.Timestamp;

public class QnaDto {

	private int QNA_ID;
	private int PRODUCT_ID;
	private int USER_ID;
	private Timestamp Q_REG_TIME;
	private String Q_CONTENT;
	private String IS_ANSWERED;
	private Timestamp A_REG_TIME;
	private String A_CONTENT;

	public QnaDto() {

	}

	public QnaDto(int pRODUCT_ID, int uSER_ID, Timestamp q_REG_TIME, String q_CONTENT, String iS_ANSWERED) {
		PRODUCT_ID = pRODUCT_ID;
		USER_ID = uSER_ID;
		Q_REG_TIME = q_REG_TIME;
		Q_CONTENT = q_CONTENT;
		IS_ANSWERED = iS_ANSWERED;
	}

	public int getQNA_ID() {
		return QNA_ID;
	}

	public void setQNA_ID(int qNA_ID) {
		QNA_ID = qNA_ID;
	}

	public int getPRODUCT_ID() {
		return PRODUCT_ID;
	}

	public void setPRODUCT_ID(int pRODUCT_ID) {
		PRODUCT_ID = pRODUCT_ID;
	}

	public int getUSER_ID() {
		return USER_ID;
	}

	public void setUSER_ID(int uSER_ID) {
		USER_ID = uSER_ID;
	}

	public Timestamp getQ_REG_TIME() {
		return Q_REG_TIME;
	}

	public void setQ_REG_TIME(Timestamp q_REG_TIME) {
		Q_REG_TIME = q_REG_TIME;
	}

	public String getQ_CONTENT() {
		return Q_CONTENT;
	}

	public void setQ_CONTENT(String q_CONTENT) {
		Q_CONTENT = q_CONTENT;
	}

	public String getIS_ANSWERED() {
		return IS_ANSWERED;
	}

	public void setIS_ANSWERED(String iS_ANSWERED) {
		IS_ANSWERED = iS_ANSWERED;
	}

	public Timestamp getA_REG_TIME() {
		return A_REG_TIME;
	}

	public void setA_REG_TIME(Timestamp a_REG_TIME) {
		A_REG_TIME = a_REG_TIME;
	}

	public String getA_CONTENT() {
		return A_CONTENT;
	}

	public void setA_CONTENT(String a_CONTENT) {
		A_CONTENT = a_CONTENT;
	}

}
