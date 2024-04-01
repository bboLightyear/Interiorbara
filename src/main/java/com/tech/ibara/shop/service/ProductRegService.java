package com.tech.ibara.shop.service;

import java.io.File;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tech.ibara.shop.dao.ShopDao;
import com.tech.ibara.shop.dto.OptionDto;
import com.tech.ibara.shop.dto.OptionSetDto;
import com.tech.ibara.shop.dto.ProductDataDto;
import com.tech.ibara.shop.dto.ProductDto;
import com.tech.ibara.shop.dto.ProductImgDto;
import com.tech.ibara.shop.util.ShopUtil;

public class ProductRegService extends SqlSessionBase implements ShopService {

	public ProductRegService(SqlSession sqlSession) {
		super(sqlSession);
	}

	@Override
	public void execute(Model model) {
		MultipartHttpServletRequest mpRequest = (MultipartHttpServletRequest) model.asMap().get("mpRequest");
		ShopDao dao = sqlSession.getMapper(ShopDao.class);

		ProductDto productDto = null;

		String productName = mpRequest.getParameter("productName");
		int sellerId = Integer.parseInt(mpRequest.getParameter("sellerId"));

		// category
		int categoryId = mpRequest.getParameter("lv4Category") == null
				? Integer.parseInt(mpRequest.getParameter("lv3Category"))
				: Integer.parseInt(mpRequest.getParameter("lv4Category"));
				
		// delivery fee
		int deliveryFee = Integer.parseInt(mpRequest.getParameter("deliveryFee"));
		// discount rate
		int discountRate = Integer.parseInt(mpRequest.getParameter("discountRate"));
		// option
		int optionType = Integer.parseInt(mpRequest.getParameter("optionType"));
		
		int repPrice = Integer.parseInt(mpRequest.getParameter("repPrice"));
		Integer repDPrice = ShopUtil.parseInt(mpRequest.getParameter("repDPrice"));

		
		switch (optionType) {
		case 0: {
			OptionSetDto optionSetDto = new OptionSetDto(null);
			dao.insertOptionSet(optionSetDto);

			ProductDataDto productDataDto = new ProductDataDto(Integer.parseInt(mpRequest.getParameter("optionStock")),
					Integer.parseInt(mpRequest.getParameter("optionPrice")),
					ShopUtil.parseInt(mpRequest.getParameter("optionDPrice")));
			dao.insertProductData(productDataDto);

			OptionDto optionDto = new OptionDto(optionSetDto.getOption_set_id(), null,
					productDataDto.getProduct_data_id(), mpRequest.getParameter("optionName"));
			dao.insertOption(optionDto);

			productDto = new ProductDto(
					sellerId,
					categoryId,
					optionSetDto.getOption_set_id(),
					1,
					productName,
					deliveryFee,
					discountRate,
					repPrice,
					repDPrice);
			dao.insertProduct(productDto);

			break;
		}

		case 1: {
			int setNum = 1;
			int optionNum = 1;

			String setKey = String.format("set%d", setNum);
			String setNameKey = setKey + "Name";

			OptionSetDto optionSetDto = new OptionSetDto(mpRequest.getParameter(setNameKey));
			dao.insertOptionSet(optionSetDto);

			while (true) {
				String optionKey = String.format("Option%d", optionNum);

				String optionNameKey = setKey + optionKey + "Name";

				String optionName = mpRequest.getParameter(optionNameKey);
				if (optionName == null) {
					break;
				}

				String optionStockKey = setKey + optionKey + "Stock";
				String optionPriceKey = setKey + optionKey + "Price";
				String optionDPriceKey = setKey + optionKey + "DPrice";

				ProductDataDto productDataDto = new ProductDataDto(
						Integer.parseInt(mpRequest.getParameter(optionStockKey)),
						Integer.parseInt(mpRequest.getParameter(optionPriceKey)),
						ShopUtil.parseInt(mpRequest.getParameter(optionDPriceKey)));
				dao.insertProductData(productDataDto);

				OptionDto optionDto = new OptionDto(optionSetDto.getOption_set_id(), null,
						productDataDto.getProduct_data_id(), optionName);
				dao.insertOption(optionDto);

				++optionNum;
			}

			productDto = new ProductDto(
					sellerId,
					categoryId,
					optionSetDto.getOption_set_id(),
					1,
					productName,
					deliveryFee,
					discountRate,
					repPrice,
					repDPrice);
			dao.insertProduct(productDto);

			break;
		}

		case 2: {
			String upSetName = mpRequest.getParameter("upSetName");

			OptionSetDto upOptionSetDto = new OptionSetDto(upSetName);
			dao.insertOptionSet(upOptionSetDto);

			int setNum = 1;

			while (true) {
				int optionNum = 1;

				String upOptionNameKey = String.format("upOption%dName", setNum);
				String upOptionName = mpRequest.getParameter(upOptionNameKey);

				if (upOptionName == null) {
					break;
				}

				String setKey = String.format("set%d", setNum);
				String setNameKey = setKey + "Name";

				OptionSetDto optionSetDto = new OptionSetDto(mpRequest.getParameter(setNameKey));
				dao.insertOptionSet(optionSetDto);

				OptionDto upOptionDto = new OptionDto(upOptionSetDto.getOption_set_id(),
						optionSetDto.getOption_set_id(), null, upOptionName);
				dao.insertOption(upOptionDto);

				while (true) {
					String optionKey = String.format("Option%d", optionNum);

					String optionNameKey = setKey + optionKey + "Name";

					String optionName = mpRequest.getParameter(optionNameKey);
					if (optionName == null) {
						break;
					}

					String optionStockKey = setKey + optionKey + "Stock";
					String optionPriceKey = setKey + optionKey + "Price";
					String optionDPriceKey = setKey + optionKey + "DPrice";

					ProductDataDto productDataDto = new ProductDataDto(
							Integer.parseInt(mpRequest.getParameter(optionStockKey)),
							Integer.parseInt(mpRequest.getParameter(optionPriceKey)),
							ShopUtil.parseInt(mpRequest.getParameter(optionDPriceKey)));
					dao.insertProductData(productDataDto);

					OptionDto optionDto = new OptionDto(optionSetDto.getOption_set_id(), null,
							productDataDto.getProduct_data_id(), optionName);
					dao.insertOption(optionDto);

					++optionNum;
				}

				++setNum;
			}

			productDto = new ProductDto(
					sellerId,
					categoryId,
					upOptionSetDto.getOption_set_id(),
					1,
					productName,
					deliveryFee,
					discountRate,
					repPrice,
					repDPrice);
			dao.insertProduct(productDto);
			break;
		}
		}

		// product images
		String path = mpRequest.getSession().getServletContext().getRealPath("resources/upload/shop");
//		String path = "C:\\23setspring\\springwork23\\interiorbara\\src\\main\\webapp\\resources\\upload\\shop";

		List<MultipartFile> fileList = mpRequest.getFiles("productImgs");

		for (int i = 0; i < fileList.size(); ++i) {
			MultipartFile file = fileList.get(i);
			String originalName = file.getOriginalFilename();
			long longtime = System.currentTimeMillis();
			String extension = originalName.substring(originalName.lastIndexOf("."));
			String newName = longtime + String.valueOf(i) + extension;
			String filePath = path + "\\" + newName;
			try {
				if (!originalName.equals("")) {
					file.transferTo(new File(filePath));
					dao.insertProductImg(new ProductImgDto(productDto.getProduct_id(), newName));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

}
