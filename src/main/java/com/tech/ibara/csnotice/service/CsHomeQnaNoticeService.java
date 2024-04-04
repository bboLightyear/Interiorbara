package com.tech.ibara.csnotice.service;

import java.util.ArrayList;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import com.tech.ibara.csnotice.dao.QnaBoardIDao;
import com.tech.ibara.csnotice.dto.QnaDto;
import com.tech.ibara.csnotice.vo.SearchVO;

public class CsHomeQnaNoticeService implements CsHomeService {

	private SqlSession sqlSession;

	public CsHomeQnaNoticeService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {

		
	}
}
