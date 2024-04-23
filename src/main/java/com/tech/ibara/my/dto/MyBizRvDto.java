package com.tech.ibara.my.dto;

import com.tech.ibara.biz.dto.BizRvLikeDto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class MyBizRvDto {
	private int br_no;
	private String br_content;
	private String br_writer;
	private int inteno;
	
	private BizRvLikeDto bizRvLikeDto; 
	
	private MyBizRvImgDto myBizRvImgDto;

	public MyBizRvDto(int br_no, String br_content, String br_writer, int inteno, BizRvLikeDto bizRvLikeDto) {
		super();
		this.br_no = br_no;
		this.br_content = br_content;
		this.br_writer = br_writer;
		this.inteno = inteno;
		this.bizRvLikeDto = bizRvLikeDto;
	}

	public MyBizRvDto(int br_no, String br_content, String br_writer, int inteno, MyBizRvImgDto myBizRvImgDto) {
		super();
		this.br_no = br_no;
		this.br_content = br_content;
		this.br_writer = br_writer;
		this.inteno = inteno;
		this.myBizRvImgDto = myBizRvImgDto;
	}

		
}
