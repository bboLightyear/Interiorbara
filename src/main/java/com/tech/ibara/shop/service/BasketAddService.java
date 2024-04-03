package com.tech.ibara.shop.service;

import java.io.BufferedReader;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.tech.ibara.shop.dao.ShopDao;
import com.tech.ibara.shop.dto.BasketDto;
import com.tech.ibara.shop.dto.OptionDto;
import com.tech.ibara.shop.dto.OptionSetDto;
import com.tech.ibara.shop.dto.ProductDto;

public class BasketAddService extends SqlSessionBase implements ShopService {

	public BasketAddService(SqlSession sqlSession) {
		super(sqlSession);
	}

	@Override
	public void execute(Model model) {
		HttpServletRequest request = (HttpServletRequest) model.asMap().get("request");
		HttpSession session = (HttpSession) model.asMap().get("session");
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		
		int userId =  Integer.parseInt((String) session.getAttribute("userId"));
		
		try {
			BufferedReader reader = request.getReader();
			StringBuilder builder = new StringBuilder();
			String line;
			while ((line = reader.readLine()) != null) {
				builder.append(line);
			}
			
			String json = builder.toString();
			
			ObjectMapper mapper = new ObjectMapper();
			List<BasketDto> basketDtoList = mapper.readValue(json, new TypeReference<List<BasketDto>>() {});
			
			for (BasketDto basketDto : basketDtoList) {
				basketDto.setUser_id(userId);
				String optionText = "";
				
				ProductDto productDto = dao.selectProduct(basketDto.getProduct_id());
				switch (productDto.getOption_type()) {
				case "0":{
					OptionDto optionDto = dao.selectOption(basketDto.getOption_id());
					optionText = optionDto.getName();
					break;
				}
				case "1":{
					OptionDto optionDto = dao.selectOption(basketDto.getOption_id());
					OptionSetDto optionSetDto = dao.selectOptionSet(optionDto.getOption_set_id());
					
					optionText = optionSetDto.getName() + ": " + optionDto.getName();
					break;
				}					
				case "2":{
					OptionDto optionDto = dao.selectOption(basketDto.getOption_id());
					OptionSetDto optionSetDto = dao.selectOptionSet(optionDto.getOption_set_id());
					OptionDto parentOptionDto = dao.selectOption(optionDto.getParent_option_id());
					OptionSetDto parentOptionSetDto = dao.selectOptionSet(parentOptionDto.getOption_set_id());
					
					optionText = parentOptionSetDto.getName() + ": " + parentOptionDto.getName() + " / " +
					optionSetDto.getName() + ": " + optionDto.getName();
					break;
				}
				}
				
				
				basketDto.setOption_text(optionText);
			}
			
			dao.insertBaskets(basketDtoList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
