package com.tech.ibara.oh.dto;

import java.util.Date;

public class OHPhotoBoard {
	
	private int pb_no;
	private String pb_user;
	private String pb_title;
	private String pb_content;
	private Date pb_date;
	private int pb_like;
	private int pb_scrap;
	private int pb_reply;
	private int pb_link;
	private int pb_hit;
	private String pb_category;
	private String pb_residence;
	private String pb_room;
	private String pb_style;
	private String pb_skill;
	
	private OHPhotoAttach ohPhotoAttach;
	
	public OHPhotoAttach getOhPhotoAttach() {
		return ohPhotoAttach;
	}

	public void setOhPhotoAttach(OHPhotoAttach ohPhotoAttach) {
		this.ohPhotoAttach = ohPhotoAttach;
	}

	public OHPhotoBoard() {
		// TODO Auto-generated constructor stub
	}

	public OHPhotoBoard(int pb_no, String pb_user, String pb_title, 
						String pb_content, Date pb_date, int pb_like,		
						int pb_scrap, int pb_reply, int pb_link, 
						int pb_hit, String pb_category, String pb_residence,
						String pb_room, String pb_style, String pb_skill) {
		this.pb_no = pb_no;
		this.pb_user = pb_user;
		this.pb_title = pb_title;
		this.pb_content = pb_content;
		this.pb_date = pb_date;
		this.pb_like = pb_like;
		this.pb_scrap = pb_scrap;
		this.pb_reply = pb_reply;
		this.pb_link = pb_link;
		this.pb_hit = pb_hit;
		this.pb_category = pb_category;
		this.pb_residence = pb_residence;
		this.pb_room = pb_room;
		this.pb_style = pb_style;
		this.pb_skill = pb_skill;
	}

	public int getPb_no() {
		return pb_no;
	}

	public void setPb_no(int pb_no) {
		this.pb_no = pb_no;
	}

	public String getPb_user() {
		return pb_user;
	}

	public void setPb_user(String pb_user) {
		this.pb_user = pb_user;
	}

	public String getPb_title() {
		return pb_title;
	}

	public void setPb_title(String pb_title) {
		this.pb_title = pb_title;
	}

	public String getPb_content() {
		return pb_content;
	}

	public void setPb_content(String pb_content) {
		this.pb_content = pb_content;
	}

	public Date getPb_date() {
		return pb_date;
	}

	public void setPb_date(Date pb_date) {
		this.pb_date = pb_date;
	}

	public int getPb_like() {
		return pb_like;
	}

	public void setPb_like(int pb_like) {
		this.pb_like = pb_like;
	}

	public int getPb_scrap() {
		return pb_scrap;
	}

	public void setPb_scrap(int pb_scrap) {
		this.pb_scrap = pb_scrap;
	}

	public int getPb_reply() {
		return pb_reply;
	}

	public void setPb_reply(int pb_reply) {
		this.pb_reply = pb_reply;
	}

	public int getPb_link() {
		return pb_link;
	}

	public void setPb_link(int pb_link) {
		this.pb_link = pb_link;
	}

	public int getPb_hit() {
		return pb_hit;
	}

	public void setPb_hit(int pb_hit) {
		this.pb_hit = pb_hit;
	}

	public String getPb_category() {
		return pb_category;
	}

	public void setPb_category(String pb_category) {
		this.pb_category = pb_category;
	}

	public String getPb_residence() {
		return pb_residence;
	}

	public void setPb_residence(String pb_residence) {
		this.pb_residence = pb_residence;
	}

	public String getPb_room() {
		return pb_room;
	}

	public void setPb_room(String pb_room) {
		this.pb_room = pb_room;
	}

	public String getPb_style() {
		return pb_style;
	}

	public void setPb_style(String pb_style) {
		this.pb_style = pb_style;
	}

	public String getPb_skill() {
		return pb_skill;
	}

	public void setPb_skill(String pb_skill) {
		this.pb_skill = pb_skill;
	}
	
}
