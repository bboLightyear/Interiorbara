package com.tech.ibara.my.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class InteriorCasesImgDto {
	
	private int bcimg_no;
	private String bcimg_ogn;
	private String bcimg_cgn;
	private int bc_no;
	private int inteno;
	
	private String imgs;
	
	private InteriorCasesDto inteCasesDto;
}
