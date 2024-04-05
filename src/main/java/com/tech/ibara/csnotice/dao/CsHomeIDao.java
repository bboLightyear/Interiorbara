package com.tech.ibara.csnotice.dao;

import java.util.ArrayList;

import com.tech.ibara.csnotice.dto.NoticeDto;
import com.tech.ibara.csnotice.dto.NoticeImgDto;
import com.tech.ibara.csnotice.dto.NoticeReplyDto;
import com.tech.ibara.csnotice.dto.QnaDto;
import com.tech.ibara.csnotice.dto.QnaImgDto;
import com.tech.ibara.csnotice.dto.QnaReplyDto;

public interface CsHomeIDao {

	public ArrayList<NoticeDto> cshomenoticelist();

	public ArrayList<QnaDto> cshomeqnalist(String qnadiv, int i);
	
}
