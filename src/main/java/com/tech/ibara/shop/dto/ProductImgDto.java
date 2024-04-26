package com.tech.ibara.shop.dto;

public class ProductImgDto {

	private int product_img_id;
	private int product_id;
	private String file_src;

	public ProductImgDto() {

	}

	public ProductImgDto(int product_id, String file_src) {
		this.product_id = product_id;
		this.file_src = file_src;
	}

	public int getProduct_img_id() {
		return product_img_id;
	}

	public void setProduct_img_id(int product_img_id) {
		this.product_img_id = product_img_id;
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
