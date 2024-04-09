package com.tech.ibara.shop.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tech.ibara.shop.dao.ShopDao;
import com.tech.ibara.shop.dto.ReviewDto;

public class ReviewRegService extends SqlSessionBase implements ShopService {

	public ReviewRegService(SqlSession sqlSession) {
		super(sqlSession);
	}

	@Override
	public void execute(Model model) {
		MultipartHttpServletRequest mpRequest = (MultipartHttpServletRequest) model.asMap().get("mpRequest");
		HttpSession session = (HttpSession) model.asMap().get("session");
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		
		int userId =  Integer.parseInt((String) session.getAttribute("userId"));
		int productId = Integer.parseInt(mpRequest.getParameter("productId"));
		int score = Integer.parseInt(mpRequest.getParameter("reviewScore"));
		String content = mpRequest.getParameter("reviewContent");
		
		// product images
		String path = mpRequest.getSession().getServletContext().getRealPath("resources/upload/shop");
//		String path = "C:\\23setspring\\springwork23\\interiorbara\\src\\main\\webapp\\resources\\upload\\shop";

		String fileSrc = null;
		List<MultipartFile> fileList = mpRequest.getFiles("reviewImage");

		if (fileList.size() > 0) {
			MultipartFile file = fileList.get(0);
			String originalName = file.getOriginalFilename();
			if (originalName != null && !originalName.equals("")) {
				long longtime = System.currentTimeMillis();
				String extension = originalName.substring(originalName.lastIndexOf("."));
				fileSrc = longtime + extension;
				String filePath = path + "\\" + fileSrc;
				try {
					if (!originalName.equals("")) {
						file.transferTo(new File(filePath));
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		ReviewDto reviewDto = new ReviewDto(productId, userId, score, fileSrc, content);
		
		dao.insertReview(reviewDto);
		dao.updateProductIncreaseOne(productId, "reviews");
	}
}
