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
public class MyReportDto {
	private int reno;
	private int targetno;
	private String targettype;
	private int memno;
	private int targetmemno;
	private String cause;
	private Date redate;
	private String yesno;
	
	private BizRvReportedDto bizRvReportedDto;
	

}
