package com.tech.ibara.main.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ShopPreviewDto {
	private int product_id;
	private String name;
	private int rep_price;
	private String file_src;

}
