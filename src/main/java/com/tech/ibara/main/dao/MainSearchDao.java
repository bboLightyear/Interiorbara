package com.tech.ibara.main.dao;

import java.util.ArrayList;

import com.tech.ibara.main.dto.BizSearchDto;
import com.tech.ibara.main.dto.NoticeSearchDto;
import com.tech.ibara.main.dto.OHSearchDto;
import com.tech.ibara.main.dto.QnASearchDto;
import com.tech.ibara.main.dto.ShopSearchDto;

public interface MainSearchDao {
	ArrayList<BizSearchDto> bizSearchContent(String searchContent);
	ArrayList<ShopSearchDto> shopSearchContent(String searchContent);
	ArrayList<OHSearchDto> ohSearchContent(String searchContent);
	ArrayList<NoticeSearchDto> noticeSearchContent(String searchContent);
	ArrayList<QnASearchDto> qnaSearchContent(String searchContent);
}
