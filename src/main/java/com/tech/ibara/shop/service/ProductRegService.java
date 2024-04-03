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
		String deliveryType = mpRequest.getParameter("deliveryType");
		Integer refPrice = ShopUtil.parseInt(mpRequest.getParameter("refPrice"));
		// discount rate
		int discountRate = Integer.parseInt(mpRequest.getParameter("discountRate"));
		String isDiscounted = discountRate == 0 ? "N" : "Y";
		// option
		String optionType = mpRequest.getParameter("optionType");
		
		int repPrice = Integer.parseInt(mpRequest.getParameter("repPrice"));
		Integer repDPrice = ShopUtil.parseInt(mpRequest.getParameter("repDPrice"));

		
		switch (optionType) {
		case "0": {
			OptionSetDto optionSetDto = new OptionSetDto(null);
			dao.insertOptionSet(optionSetDto);
			
			OptionDto optionDto = new OptionDto(
					optionSetDto.getOption_set_id(),
					null,
					mpRequest.getParameter("optionName"),
					Integer.parseInt(mpRequest.getParameter("optionStock")),
					Integer.parseInt(mpRequest.getParameter("optionPrice")),
					ShopUtil.parseInt(mpRequest.getParameter("optionDPrice")));
			dao.insertOption(optionDto);

			productDto = new ProductDto(
					sellerId,
					categoryId,
					productName,
					repPrice,
					repDPrice,
					isDiscounted,
					discountRate,
					deliveryFee,
					deliveryType,
					refPrice,
					optionType,
					optionSetDto.getOption_set_id(),
					null);
			dao.insertProduct(productDto);

			break;
		}

		case "1": {
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

				OptionDto optionDto = new OptionDto(
						optionSetDto.getOption_set_id(),
						null,
						optionName,
						Integer.parseInt(mpRequest.getParameter(optionStockKey)),
						Integer.parseInt(mpRequest.getParameter(optionPriceKey)),
						ShopUtil.parseInt(mpRequest.getParameter(optionDPriceKey)));
				dao.insertOption(optionDto);

				++optionNum;
			}

			productDto = new ProductDto(
					sellerId,
					categoryId,
					productName,
					repPrice,
					repDPrice,
					isDiscounted,
					discountRate,
					deliveryFee,
					deliveryType,
					refPrice,
					optionType,
					optionSetDto.getOption_set_id(),
					null);
			dao.insertProduct(productDto);

			break;
		}

		case "2": {
			OptionSetDto parentOptionSetDto = new OptionSetDto(mpRequest.getParameter("upSetName"));
			dao.insertOptionSet(parentOptionSetDto);

			OptionSetDto optionSetDto = new OptionSetDto(mpRequest.getParameter("set1Name"));
			dao.insertOptionSet(optionSetDto);
			
			int setNum = 1;

			while (true) {
				int optionNum = 1;

				String upOptionNameKey = String.format("upOption%dName", setNum);
				String upOptionName = mpRequest.getParameter(upOptionNameKey);

				if (upOptionName == null) {
					break;
				}

				String setKey = String.format("set%d", setNum);

				OptionDto parentOptionDto = new OptionDto(
						parentOptionSetDto.getOption_set_id(),
						null,
						upOptionName,
						null,
						null,
						null);
				dao.insertOption(parentOptionDto);

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

					OptionDto optionDto = new OptionDto(
							optionSetDto.getOption_set_id(),
							parentOptionDto.getOption_id(),
							optionName,
							Integer.parseInt(mpRequest.getParameter(optionStockKey)),
							Integer.parseInt(mpRequest.getParameter(optionPriceKey)),
							ShopUtil.parseInt(mpRequest.getParameter(optionDPriceKey)));
					dao.insertOption(optionDto);

					++optionNum;
				}

				++setNum;
			}

			productDto = new ProductDto(
					sellerId,
					categoryId,
					productName,
					repPrice,
					repDPrice,
					isDiscounted,
					discountRate,
					deliveryFee,
					deliveryType,
					refPrice,
					optionType,
					parentOptionSetDto.getOption_set_id(),
					optionSetDto.getOption_set_id());
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
