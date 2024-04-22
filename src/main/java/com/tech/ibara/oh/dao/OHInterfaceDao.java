package com.tech.ibara.oh.dao;

import java.util.ArrayList;

import com.tech.ibara.oh.dto.OHPhotoAttach;
import com.tech.ibara.oh.dto.OHPhotoBoard;
import com.tech.ibara.oh.dto.OHPhotoLike;
import com.tech.ibara.oh.dto.OHPhotoReply;
import com.tech.ibara.oh.dto.OHPhotoReplyLike;
import com.tech.ibara.oh.dto.OHPhotoScrap;

public interface OHInterfaceDao {
	
	// ---------- 선경님 ----------
	public ArrayList<OHPhotoBoard> getPhotoBoardLikeList(int memno);
	public ArrayList<OHPhotoBoard> getPhotoBoardScrapList(int memno);
	
	// ---------- OHMainView.jsp ----------
	public ArrayList<OHPhotoBoard> ohMainPhotoViewOrderDate(int number);
	public ArrayList<OHPhotoBoard> ohMainPhotoViewOrderLike(int number);
	public ArrayList<OHPhotoBoard> ohMainPhotoViewOrderHit(int number);		
	
	// ---------- OHPhotoView.jsp ---------- 
	public ArrayList<OHPhotoBoard> ohPhotoView(int postStartNum, int postEndNum,
											   String orderingBy, String orderingMethod,	
			  								   String pb_residence, String pb_room, String pb_style, String pb_skill,
			  								   String searchingType, String searchingWord);
	public int getPostTotalCount(String pb_residence, String pb_room, String pb_style, String pb_skill, 
			                     String searchingType, String searchingWord);
	public ArrayList<OHPhotoLike> ohPhotoLikeView(int memno);
	public ArrayList<OHPhotoScrap> ohPhotoScrapView(int memno);
	
	// ---------- OHPhotoLikeExecute ----------
	public int likeCheck(String memno, String pb_no);
	public void likeSave(String memno, String pb_no);
	public void likeIncrease(String pb_no);
	public void likeDelete(String memno, String pb_no);
	public void likeDecrease(String pb_no);
	public int likeGetNumber(String pb_no);
	
	// ---------- OHPhotoScrapExecute ----------
	public int scrapCheck(String memno, String pb_no);
	public void scrapSave(String memno, String pb_no);
	public void scrapIncrease(String pb_no);
	public void scrapDelete(String memno, String pb_no);
	public void scrapDecrease(String pb_no);
	public int scrapGetNumber(String pb_no);
	
	// ---------- OHPhotoWriteExecute ----------
	public void ohPhotoWriteExecute(int memno, String pb_title, String pb_content, 
									String pb_residence, String pb_room, 
									String pb_style, String pb_skill);
	public int getRecentPb_no();
	public void setFileUpload(int pb_no, String changeFile);
	
	// ---------- OHPhotoDetailView.jsp ----------
	public void updatePb_hit(String pb_no);
	public OHPhotoBoard getDtoOHPhotoBoard(String pb_no);
	public ArrayList<OHPhotoAttach> getDtoOHPhotoAttach(String pa_no);
	public OHPhotoLike ohPhotoDetailLikeView(int memno, String pb_no);
	public OHPhotoScrap ohPhotoDetailScrapView(int memno, String pb_no); 	
	public int getOHPhotoReplyNumber(String pb_no);
	
	// ---------- OHPhotoDetailView.jsp ----------
	// ---------- OHPhotoReplyView.jsp ----------	
	public ArrayList<OHPhotoReply> ohPhotoReplyView(String pb_no);
	public ArrayList<OHPhotoReplyLike> ohPhotoReplyLikeView(int memno);
	
	// ---------- OHPhotoReplyLikeExecute ----------
	public int replyLikeCheck(String memno, String pr_no);
	public void replyLikeSave(String memno, String pr_no);
	public void replyLikeIncrease(String pr_no);
	public void replyLikeDelete(String memno, String pr_no);
	public void replyLikeDecrease(String pr_no);
	public int replyLikeGetNumber(String pr_no);
	
	// ---------- OHPhotoReplyWriteExecute ----------
	public void ohPhotoReplyWriteExecute(String memno,String pr_content,String pb_no);
	public void ohPhotoReplyIncrease(String pb_no);
	public int ohPhotoReplyGetNumber(String pb_no);
	
	// ---------- OHPhotoEditExecute ----------
	public void ohPBEditUpdate(String pb_no, String pb_title, 
							   String pb_content, 
							   String pb_residence, String pb_room, 
							   String pb_style, String pb_skill);	
	public ArrayList<String> getPAFileNames(String pb_no);
	public void ohPAEditDelete(String pb_no);
	public void ohPAEditFileUpload(int pb_no, String changeFile);
	
	// ---------- OHPhotoDeleteExecute ----------
	// 사용한 함수 - public ArrayList<String> getPAFileNames(String pb_no);
	public void ohPBDelete(String pb_no);
}
