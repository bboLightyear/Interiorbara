package com.tech.ibara.main.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class QnAPreviewDto {
	private int qna_no;
	private String qna_title;
	private String qna_writer;
	private int qna_hit;
	private Date qna_date;
	
}
