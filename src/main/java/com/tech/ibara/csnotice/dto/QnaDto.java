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
public class QnaDto {
	private int qbno;
	private String qbtitle;
	private String qbcontent;
	private String qbqnadiv;
	private String qbwriter;
	private int qbhit;
	private Date qbdate;
	private int qbgroup;
	private int qbstep;
	private int qbindent;
	private String qbfilecode;
	private QnaImgDto qnaImgDto;
}
