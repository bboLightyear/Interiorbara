package com.tech.ibara.biz.dao;

import java.util.ArrayList;
import java.util.List;

import com.tech.ibara.biz.dto.BizPriceDto;

public interface BizPriceIDao {

	
	
	
//	자재 가격 게시판
	
//	public ArrayList<BizCasesDto> bizCasesList(int rowStart, int rowEnd, String searchKeyword, String string);
//
//	public void bizCasesImgWrite(int bc_no, String originFile, String changeFile);
//
//	public ArrayList<BizCasesImgDto> selectBizCasesImg(String bc_no);
//
//	public void bizCasesMod(String bc_no, String bc_title, String bc_content);

	public ArrayList<BizPriceDto> bizPriceListView(String inteno);

	public Integer bizPriceCnt(String inteno);
	
	public void bizPriceWrite(String bp_name, String bp_content, String bp_price,
			String bp_category, String bp_type, String string, String inteno);

	public int selBp_no();

	public void bizPriceImgWrite(int bp_no, String changeFile);

	public void bizPriceModAll(String bp_no, String bp_name, String bp_content, String bp_price, String bp_category,
			String bp_type, String bp_img, String inteno);

	public BizPriceDto bizPriceModEachView(String inteno, String bp_no);

	public void bizPriceModEach(String bp_no, String bp_name, String bp_content, String bp_price, String bp_category,
			String bp_type, String bpImgNew, String inteno);



	
	
	
	
}
