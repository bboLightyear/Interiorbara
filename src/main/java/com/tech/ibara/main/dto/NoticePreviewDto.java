package com.tech.ibara.main.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class NoticePreviewDto {
	private int notice_no;
	private String notice_title;
	private String notice_writer;
	private int notice_hit;
	private Date notice_date;

}
