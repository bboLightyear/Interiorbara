package com.tech.ibara.shop.util;

public class ShopUtil {

	
	/**
	 * Parse String to Integer.
	 * If @str is null, return null.
	 */
	public static Integer parseInt(String str) {
		return str == null || str.equals("") ? null : Integer.parseInt(str);
	}
}
