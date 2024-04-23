package com.tech.ibara.my.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PhotoScrapDto {
	private int ps_no;
	private int memno;
	private Date ps_date;
	private int pb_no;
	
	private PhotoBoardDto photoBoardDto; 
	private MyMemberInfoDto myMemberInfoDto;
}
