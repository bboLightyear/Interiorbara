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
	private int shop_no;
	private String shop_name;
	private int shop_price;
	private String shop_img;

}
