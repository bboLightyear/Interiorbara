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
public class NoticeReplyDto {
	private int nbno;
	private int rnbno;
	private String rnbwriter;
	private String rnbcontent;
	private int rnbstep;
	private int rnbgroup;
	private int rnbindent;
}
