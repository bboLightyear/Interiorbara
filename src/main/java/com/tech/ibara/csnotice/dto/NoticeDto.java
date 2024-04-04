package com.tech.ibara.csnotice.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class NoticeDto {
	private int nbno;
	private String nbtitle;
	private String nbcontent;
	private String nbqnadiv;
	private String nbwriter;
	private int nbhit;
	private Date nbdate;
	private int nbgroup;
	private int nbstep;
	private int nbindent;
	private String qbfilecode;
	private NoticeImgDto noticeImgDto;
}
