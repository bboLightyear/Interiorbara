package com.tech.ibara.oh.dao;

import java.util.ArrayList;

import com.tech.ibara.oh.dto.OHPhotoAttach;
import com.tech.ibara.oh.dto.OHPhotoBoard;
import com.tech.ibara.oh.dto.OHPhotoLike;
import com.tech.ibara.oh.dto.OHPhotoReply;
import com.tech.ibara.oh.dto.OHPhotoScrap;

public interface OHInterfaceDao {
	
	// ---------- OHMainView.jsp ----------
	public ArrayList<OHPhotoBoard> ohMainPhotoView(int number);
	
	// ---------- OHPhotoView.jsp ---------- 
	public ArrayList<OHPhotoBoard> ohPhotoView(int postStartNum, int postEndNum,
											   String orderingBy, String orderingMethod,	
			  								   String pb_category, String pb_residence, String pb_room, String pb_style, String pb_skill,
			  								   String searchingType, String searchingWord);
	public int getPostTotalCount(String pb_category, String pb_residence, String pb_room, String pb_style, String pb_skill, 
			                     String searchingType, String searchingWord);
	public ArrayList<OHPhotoLike> ohPhotoLikeView(String userId);
	public ArrayList<OHPhotoScrap> ohPhotoScrapView(String userId);
	
	// ---------- OHPhotoLikeExecute ----------
	public int likeCheck(String userId, String pb_no);
	public void likeSave(String userId, String pb_no);
	public void likeIncrease(String pb_no);
	public void likeDelete(String userId, String pb_no);
	public void likeDecrease(String pb_no);
	public int likeGetNumber(String pb_no);
	
	// ---------- OHPhotoScrapExecute ----------
	public int scrapCheck(String userId, String pb_no);
	public void scrapSave(String userId, String pb_no);
	public void scrapIncrease(String pb_no);
	public void scrapDelete(String userId, String pb_no);
	public void scrapDecrease(String pb_no);
	public int scrapGetNumber(String pb_no);
	
	// ---------- OHPhotoWriteExecute ----------
	public void ohPhotoWriteExecute(String pb_user, String pb_title, 
									String pb_content, String pb_category, 
									String pb_residence, String pb_room, 
									String pb_style, String pb_skill);
	public int getRecentPb_no();
	public void setFileUpload(int pb_no, String changeFile);
	
	// ---------- OHPhotoDetailView.jsp ----------
	public void updatePb_hit(String pb_no);
	public OHPhotoBoard getDtoOHPhotoBoard(String pb_no);
	public ArrayList<OHPhotoAttach> getDtoOHPhotoAttach(String pa_no);
	
	// ---------- OHPhotoReplyView ----------
	public ArrayList<OHPhotoReply> ohPhotoReplyView(String pb_no);
	
	// ---------- OHPhotoReplyWriteExecute ----------
	public void ohPhotoReplyWriteExecute(String userId,String pr_content,String pb_no);
	
	// ---------- OHPhotoEditExecute ----------
	public void ohPBEditUpdate(String pb_no, String pb_title, 
							   String pb_content, String pb_category, 
							   String pb_residence, String pb_room, 
							   String pb_style, String pb_skill);	
	public ArrayList<String> getPAFileNames(String pb_no);
	public void ohPAEditDelete(String pb_no);
	public void ohPAEditFileUpload(int pb_no, String changeFile);
	
	// ---------- OHPhotoDeleteExecute ----------
	// 사용한 함수 - public ArrayList<String> getPAFileNames(String pb_no);
	public void ohPBDelete(String pb_no);
}
