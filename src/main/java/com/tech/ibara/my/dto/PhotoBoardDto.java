package com.tech.ibara.my.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PhotoBoardDto {
	
	private int no;
	private int pb_no;
	private int memno;
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

		
}
