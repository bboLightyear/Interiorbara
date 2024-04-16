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
public class QnASearchDto {
	private String qna_title;
	private String qna_writer;
	private Date qna_date;
}
