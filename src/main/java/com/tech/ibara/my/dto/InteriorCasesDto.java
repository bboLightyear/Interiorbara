package com.tech.ibara.my.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class InteriorCasesDto {

	private int bc_no;
	private String	bc_title;
	private String	bc_content;
	private String bc_writer;
	private Timestamp bc_date;
	private int bc_hit;
	private int inteno;
	}
