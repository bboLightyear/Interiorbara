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
public class PhotoLikeDto {
	private int pl_no;
	private int memno;
	private Date pl_date;
	private int pb_no;
	
	private PhotoBoardDto photoBoardDto;
	private MyMemberInfoDto myMemberInfoDto;

}
