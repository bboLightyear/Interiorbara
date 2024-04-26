package com.tech.ibara.shop.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.shop.dao.ShopDao;
import com.tech.ibara.shop.dto.CategoryDto;
import com.tech.ibara.shop.dto.DetailImgDto;
import com.tech.ibara.shop.dto.OptionDto;
import com.tech.ibara.shop.dto.OptionSetDto;
import com.tech.ibara.shop.dto.ProductDto;
import com.tech.ibara.shop.dto.ProductImgDto;
import com.tech.ibara.shop.dto.QnaDto;
import com.tech.ibara.shop.dto.ReviewDto;
import com.tech.ibara.shop.vo.PageVO;

public class ProductViewService extends SqlSessionBase implements ShopService {

	public ProductViewService(SqlSession sqlSession) {
		super(sqlSession);
	}

	@Override
	public void execute(Model model) {
		HttpServletRequest request = (HttpServletRequest) model.asMap().get("request");
		ShopDao dao = sqlSession.getMapper(ShopDao.class);

		int productId = Integer.parseInt(request.getParameter("productId"));

		dao.updateProductIncreaseOne(productId, "hits");
		
		ProductDto productDto = dao.selectProductJoinSeller(productId);

		// category
		ArrayList<CategoryDto> categories = new ArrayList<CategoryDto>();
		CategoryDto categoryDto = dao.selectCategory(productDto.getCategory_id());
		categories.add(categoryDto);
		while (categoryDto.getParent_category_id() != null) {
			categoryDto = dao.selectCategory(categoryDto.getParent_category_id());
			categories.add(0, categoryDto);
		}

		// image
		ArrayList<ProductImgDto> productImgs = dao.selectProductImgsByProduct(productId);

		
		// option
		OptionSetDto optionSetDto = null;
		OptionSetDto parentOptionSetDto = null;
		OptionDto optionDto = null;
		ArrayList<OptionDto> optionDtoList = null;
		ArrayList<OptionDto> parentOptionDtoList = null;
		
		switch (productDto.getOption_type()) {
		case "0": {
			int optionSetId = productDto.getOption1_set_id();
			optionSetDto = dao.selectOptionSet(optionSetId);
			optionDto = dao.selectOptionByOptionSet(optionSetId);
			
			model.addAttribute("optionSet", optionSetDto);
			model.addAttribute("option", optionDto);
			
			break;
		}
		case "1": {
			int optionSetId = productDto.getOption1_set_id();
			optionSetDto = dao.selectOptionSet(optionSetId);
			optionDtoList = dao.selectOptionsByOptionSet(optionSetId);

			model.addAttribute("optionSet", optionSetDto);
			model.addAttribute("optionList", optionDtoList);
			
			break;	
		}
		case "2":{
			int parentOptionSetId = productDto.getOption1_set_id();
			parentOptionSetDto = dao.selectOptionSet(parentOptionSetId);
			parentOptionDtoList = dao.selectOptionsByOptionSet(parentOptionSetId);
			
			int optionSetId = productDto.getOption2_set_id();
			optionSetDto = dao.selectOptionSet(optionSetId);
			optionDtoList = dao.selectOptionsByOptionSet(optionSetId);
			
			model.addAttribute("parentOptionSet", parentOptionSetDto);
			model.addAttribute("parentOptionList", parentOptionDtoList);
			model.addAttribute("optionSet", optionSetDto);
			model.addAttribute("optionList", optionDtoList);
			
			break;
		}
		}
		
		// detail Imgs
		ArrayList<DetailImgDto> detailImgDtoList = dao.selectDetailImgsByProduct(productId);
		
		// reviews
		ArrayList<ReviewDto> reviewDtoList = dao.selectReviewsByProduct(productId);
		
		int reviewTotalCnt = 0, reviewTotalScore = 0;
		float reviewAvgScore = 0f;
		int[] reviewScoreCnt = { 0, 0, 0, 0, 0 };
		String[] reviewRatio = { "", "", "", "", "" };
		
		reviewTotalCnt = reviewDtoList.size();
		for (ReviewDto reviewDto : reviewDtoList) {
			int score = reviewDto.getScore();
			
			reviewTotalScore += score;
			
			++reviewScoreCnt[score - 1];
		}
		
		reviewAvgScore = (float) reviewTotalScore / reviewTotalCnt;
		for (int i = 0; i < 5; ++i) {
			reviewRatio[i] = String.format("%.2f", (float) reviewScoreCnt[i] / reviewTotalCnt * 100);
		}
		
		PageVO reviewPageVO = new PageVO();
		reviewPageVO.pageAndPostCalculate(reviewTotalCnt);
		ArrayList<ReviewDto> reviewPageList = dao.selectReviewsPageByProduct(
				productId, reviewPageVO.getPostStartNum(), reviewPageVO.getPostEndNum());
		
		
		// qnas
		int qnaTotalCnt = dao.selectQnasCount(productId);
		PageVO qnaPageVO = new PageVO();
		qnaPageVO.pageAndPostCalculate(qnaTotalCnt);
		ArrayList<QnaDto> qnaDtoList = dao.selectQnasPageByProduct(
				productId, qnaPageVO.getPostStartNum(), qnaPageVO.getPostEndNum());
		
		

		model.addAttribute("reviewTotalCnt", reviewTotalCnt);
		model.addAttribute("reviewTotalScore", reviewTotalScore);
		model.addAttribute("reviewAvgScore", String.format("%.1f", reviewAvgScore));
		model.addAttribute("reviewScoreCnt", reviewScoreCnt);
		model.addAttribute("reviewRatio", reviewRatio);
		
		model.addAttribute("qnaTotalCnt", qnaTotalCnt);
		
		model.addAttribute("detailImgs", detailImgDtoList);
		
		model.addAttribute("reviewPageVO", reviewPageVO);
		model.addAttribute("qnaPageVO", qnaPageVO);
		
		model.addAttribute("reviews", reviewPageList);
		model.addAttribute("qnas", qnaDtoList);
		
		model.addAttribute("product", productDto);
		model.addAttribute("categories", categories);
		model.addAttribute("images", productImgs);
	}

}
