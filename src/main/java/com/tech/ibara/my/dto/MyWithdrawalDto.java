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
public class MyWithdrawalDto {
	private int wdno;
	private int memno;
	private Date wddate;
	private String reason;
	private String yesno;

}
