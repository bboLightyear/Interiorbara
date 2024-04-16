package com.tech.ibara.shop.api;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.springframework.core.io.ClassPathResource;

import com.tech.ibara.shop.vo.ShopUtil;

public class PortOneAPI {

	private static final PortOneAPI instance = new PortOneAPI();
	
	private final Properties PROPERTIES;
	
	private AuthAnnotation authAnnotation = null;
	
	private final int connectTimeout = 5000;
	private final int readTimeout = 10000;
	
	private PortOneAPI() {
		PROPERTIES = new Properties();
		
		try {
			ClassPathResource cpr = new ClassPathResource("portone_api_key.properties");
			
			URL props = cpr.getURL();
        
			PROPERTIES.load(props.openStream());
        } catch (Exception e) {
        	e.printStackTrace();
        }
	}
	
	public static PortOneAPI getInstance() {
		return instance;
	}
	
	private String getProperty(final String name) {
		return PROPERTIES.getProperty(name);
	}
	
	private String getToken() {
		boolean isExpired = true;
		
		if (authAnnotation != null) {
			long expiredAt = authAnnotation.getExpired_at();
			long unixTimestamp = System.currentTimeMillis() / 1000L;
			
			if (expiredAt - unixTimestamp > 5) {
				isExpired = false;
			}
		}
		
		if (isExpired) {
			try {
				URL url = new URL("https://api.iamport.kr/users/getToken");
				HttpURLConnection connection = (HttpURLConnection) url.openConnection();
				
				connection.setRequestMethod("POST");
				connection.setDoOutput(true);
				connection.setRequestProperty("Content-Type", "application/json");
				connection.setConnectTimeout(connectTimeout);
			    connection.setReadTimeout(readTimeout);
				
				Map<String, Object> requestParams = new HashMap<String, Object>();
				requestParams.put("imp_secret", getProperty("PORTONE_API_SECRET"));
				requestParams.put("imp_key", getProperty("PORTONE_API_KEY"));
				
				String jsonRequest = ShopUtil.mapToJson(requestParams);
				
				byte[] requestBody = jsonRequest.getBytes("UTF-8");
				
				OutputStream outputStream = connection.getOutputStream();
				outputStream.write(requestBody, 0, requestBody.length);
				
				int responseCode = connection.getResponseCode();
				System.out.println("getToken Response Code: " + responseCode);
				
				BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
				String inputLine;
				StringBuffer response = new StringBuffer();
				
				while ((inputLine = reader.readLine()) != null) {
					response.append(inputLine);
				}
				
				reader.close();
				
				AuthResponse authResponse = ShopUtil.jsonToObject(response.toString(), AuthResponse.class);
				
				if (authResponse.getCode() != 0) {
					System.out.println("getToken, 토큰 발급 실패");
					System.out.println("code: " + authResponse.getCode() + " / message: " + authResponse.getMessage());
					return null;
				}
				
				System.out.println("getToken, 토큰 발급 성공");
				
				authAnnotation = authResponse.getResponse();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return authAnnotation.getAccess_token();
	}
	
	public void prepare(int orderId, int amount) {
		String accessToken = getToken();
		
		try {
			URL url = new URL("https://api.iamport.kr/payments/prepare");
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			
			connection.setRequestMethod("POST");
			connection.setDoOutput(true);
			connection.setRequestProperty("Content-Type", "application/json");
			connection.setRequestProperty("Authorization", accessToken);
			connection.setConnectTimeout(connectTimeout);
		    connection.setReadTimeout(readTimeout);
		    
			Map<String, Object> requestParams = new HashMap<String, Object>();
			requestParams.put("merchant_uid", String.valueOf(orderId));
			requestParams.put("amount", amount);
			
			String jsonRequest = ShopUtil.mapToJson(requestParams);
			
			byte[] requestBody = jsonRequest.getBytes("UTF-8");
			
			OutputStream outputStream = connection.getOutputStream();
			outputStream.write(requestBody, 0, requestBody.length);
			
			int responseCode = connection.getResponseCode();
			System.out.println("prepare Response Code: " + responseCode);
			
			BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();
			
			while ((inputLine = reader.readLine()) != null) {
				response.append(inputLine);
			}
			
			reader.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public boolean verify(int orderId, int amount) {
		String accessToken = getToken();
		boolean result = false;
		
		try {
			URL url = new URL("https://api.iamport.kr/payments/prepare/" + orderId);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			
			connection.setRequestMethod("GET");
			connection.setDoOutput(true);
			connection.setRequestProperty("Content-Type", "application/json");
			connection.setRequestProperty("Authorization", accessToken);
			connection.setConnectTimeout(connectTimeout);
		    connection.setReadTimeout(readTimeout);
		    
			Map<String, Object> requestParams = new HashMap<String, Object>();
			requestParams.put("merchant_uid", String.valueOf(orderId));
			
			String jsonRequest = ShopUtil.mapToJson(requestParams);
			
			byte[] requestBody = jsonRequest.getBytes("UTF-8");
			
			OutputStream outputStream = connection.getOutputStream();
			outputStream.write(requestBody, 0, requestBody.length);
			
			int responseCode = connection.getResponseCode();
			System.out.println("verify Response Code: " + responseCode);
			
			BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();
			
			while ((inputLine = reader.readLine()) != null) {
				response.append(inputLine);
			}
			
			reader.close();
			
			PaymentPrepareResponse paymentPrepareResponse = ShopUtil.jsonToObject(response.toString(), PaymentPrepareResponse.class);
			
			result = (amount == paymentPrepareResponse.getResponse().getAmount());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
