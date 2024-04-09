package com.tech.ibara.shop.dto;

import java.util.Date;

public class ProductDto {

	private int product_id;
	private int seller_id;
	private int category_id;
	private String name;
	private int rep_price;
	private Integer rep_discounted_price;
	private String is_discounted;
	private int discount_rate;
	private int delivery_fee;
	private String delivery_type;
	private Integer ref_price;
	private String option_type;
	private int option1_set_id;
	private Integer option2_set_id;
	private Date reg_time;
	private int hits;
	private int sales;
	private int scraps;
	private int reviews;

	private SellerDto seller;

	public ProductDto() {

	}

	public ProductDto(int seller_id, int category_id, String name, int rep_price, Integer rep_discounted_price,
			String is_discount, int discount_rate, int delivery_fee, String delivery_type, Integer ref_price,
			String option_type, int option1_set_id, Integer option2_set_id) {
		this.seller_id = seller_id;
		this.category_id = category_id;
		this.name = name;
		this.rep_price = rep_price;
		this.rep_discounted_price = rep_discounted_price;
		this.is_discounted = is_discount;
		this.discount_rate = discount_rate;
		this.delivery_fee = delivery_fee;
		this.delivery_type = delivery_type;
		this.ref_price = ref_price;
		this.option_type = option_type;
		this.option1_set_id = option1_set_id;
		this.option2_set_id = option2_set_id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public int getSeller_id() {
		return seller_id;
	}

	public void setSeller_id(int seller_id) {
		this.seller_id = seller_id;
	}

	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getRep_price() {
		return rep_price;
	}

	public void setRep_price(int rep_price) {
		this.rep_price = rep_price;
	}

	public Integer getRep_discounted_price() {
		return rep_discounted_price;
	}

	public void setRep_discounted_price(Integer rep_discounted_price) {
		this.rep_discounted_price = rep_discounted_price;
	}

	public String getIs_discounted() {
		return is_discounted;
	}

	public void setIs_discounted(String is_discounted) {
		this.is_discounted = is_discounted;
	}

	public int getDiscount_rate() {
		return discount_rate;
	}

	public void setDiscount_rate(int discount_rate) {
		this.discount_rate = discount_rate;
	}

	public int getDelivery_fee() {
		return delivery_fee;
	}

	public void setDelivery_fee(int delivery_fee) {
		this.delivery_fee = delivery_fee;
	}

	public String getDelivery_type() {
		return delivery_type;
	}

	public void setDelivery_type(String delivery_type) {
		this.delivery_type = delivery_type;
	}

	public Integer getRef_price() {
		return ref_price;
	}

	public void setRef_price(Integer ref_price) {
		this.ref_price = ref_price;
	}

	public String getOption_type() {
		return option_type;
	}

	public void setOption_type(String option_type) {
		this.option_type = option_type;
	}

	public int getOption1_set_id() {
		return option1_set_id;
	}

	public void setOption1_set_id(int option1_set_id) {
		this.option1_set_id = option1_set_id;
	}

	public Integer getOption2_set_id() {
		return option2_set_id;
	}

	public void setOption2_set_id(Integer option2_set_id) {
		this.option2_set_id = option2_set_id;
	}

	public Date getReg_time() {
		return reg_time;
	}

	public void setReg_time(Date reg_time) {
		this.reg_time = reg_time;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public int getSales() {
		return sales;
	}

	public void setSales(int sales) {
		this.sales = sales;
	}

	public int getScraps() {
		return scraps;
	}

	public void setScraps(int scraps) {
		this.scraps = scraps;
	}

	public int getReviews() {
		return reviews;
	}

	public void setReviews(int reviews) {
		this.reviews = reviews;
	}

	public SellerDto getSeller() {
		return seller;
	}

	public void setSeller(SellerDto seller) {
		this.seller = seller;
	}

}
