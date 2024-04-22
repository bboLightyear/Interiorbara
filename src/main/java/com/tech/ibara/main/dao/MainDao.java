package com.tech.ibara.main.dao;

import java.util.ArrayList;

import com.tech.ibara.main.dto.BizPreviewDto;
import com.tech.ibara.main.dto.NoticePreviewDto;
import com.tech.ibara.main.dto.OHPreviewDto;
import com.tech.ibara.main.dto.QnAPreviewDto;
import com.tech.ibara.main.dto.ShopPreviewDto;

public interface MainDao {
	ArrayList<BizPreviewDto> bizPreview();
	ArrayList<ShopPreviewDto> shopPreview();
	ArrayList<OHPreviewDto> ohPreview();
	ArrayList<NoticePreviewDto> noticePreview();
	ArrayList<QnAPreviewDto> qnaPreview();
}
