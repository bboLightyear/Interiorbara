package com.tech.ibara.main.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class BizSearchDto {
	private String searchContent;
	private String biz_name;
	private String biz_addr;
}
