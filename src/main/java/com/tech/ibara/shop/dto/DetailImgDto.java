package com.tech.ibara.shop.dto;

public class DetailImgDto {

	private int detail_img_id;
	private int product_id;
	private String file_src;

	public DetailImgDto() {

	}

	public DetailImgDto(int product_id, String file_src) {
		this.product_id = product_id;
		this.file_src = file_src;
	}

	public int getDetail_img_id() {
		return detail_img_id;
	}

	public void setDetail_img_id(int detail_img_id) {
		this.detail_img_id = detail_img_id;
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
