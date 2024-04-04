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
public class QnaReplyDto {
	private int qbno;
	private int rqbno;
	private String rqbwriter;
	private String rqbcontent;
	private int rqbstep;
	private int rqbgroup;
	private int rqbindent;
}
