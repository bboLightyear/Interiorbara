package com.tech.ibara.shop.dto;

public class DetailImageDto {

	private int detail_image_id;
	private int product_id;
	private String file_src;

	public DetailImageDto() {

	}

	public DetailImageDto(int product_id, String file_src) {
		this.product_id = product_id;
		this.file_src = file_src;
	}

	public int getDetail_image_id() {
		return detail_image_id;
	}

	public void setDetail_image_id(int detail_image_id) {
		this.detail_image_id = detail_image_id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public String getFile_src() {
		return file_src;
	}

	public void setFile_src(String file_src) {
		this.file_src = file_src;
	}

}
