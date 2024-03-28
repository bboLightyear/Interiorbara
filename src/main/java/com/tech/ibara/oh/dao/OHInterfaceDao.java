package com.tech.ibara.oh.dao;

import java.util.ArrayList;

import com.tech.ibara.oh.dto.OHPhotoAttach;
import com.tech.ibara.oh.dto.OHPhotoBoard;

public interface OHInterfaceDao {
	
	// ---------- OHPhotoView.jsp ---------- 
	public ArrayList<OHPhotoBoard> ohPhotoView();
	public int getPostTotalCount(String pb_category, String pb_residence, String pb_room, String pb_style, String pb_skill, 
			                     String searchingType, String searchingWord);
	// ---------- OHPhotoWriteExecute ----------
	public void ohPhotoWriteExecute(String pb_title, String pb_content, 
									String pb_category, String pb_residence,
									String pb_room, String pb_style, 
									String pb_skill);
	public int getRecentPb_no();
	public void setFileUpload(int pb_no, String changeFile);
	// ---------- OHPhotoDetailView.jsp ----------
	public void updatePb_hit(String pb_no);
	public OHPhotoBoard getDtoOHPhotoBoard(String pb_no);
	public ArrayList<OHPhotoAttach> getDtoOHPhotoAttach(String pa_no);
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