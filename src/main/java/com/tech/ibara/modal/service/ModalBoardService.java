package com.tech.ibara.modal.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.tech.ibara.modal.dao.mapper.ModalBoardDao;
import com.tech.ibara.modal.dto.ModalBoardDto;
import com.tech.ibara.my.dao.MyDao;
import com.tech.ibara.my.dto.MyNonMemberDto;

public class ModalBoardService{

	private SqlSession sqlSession;
	
	public ModalBoardService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	 public ModalBoardDto getModalBoardByEmailAndPw(String email, String pw) {
	        ModalBoardDao modalBoardDao = sqlSession.getMapper(ModalBoardDao.class);
	        return modalBoardDao.selectModalBoardByEmailAndPw(email, pw);
	    }
	
}
