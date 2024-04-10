package com.tech.ibara.shop.vo;

import java.util.Map;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

public class ShopUtil {

	public static Integer parseInt(String str) {
		return str == null || str.equals("") ? null : Integer.parseInt(str);
	}

	public static Map<String, Object> jsonToMap(String json) throws Exception {
		ObjectMapper objectMapper = new ObjectMapper();

		return objectMapper.readValue(json, new TypeReference<Map<String, Object>>(){});
	}

	public static String mapToJson(Map<String, Object> map) throws Exception {
		ObjectMapper mapper = new ObjectMapper();

		return mapper.writeValueAsString(map);
	}

	public static <T> T jsonToObject(String json, Class<T> type) throws Exception {
		ObjectMapper objectMapper = new ObjectMapper();

		return objectMapper.readValue(json, type);
	}
}
