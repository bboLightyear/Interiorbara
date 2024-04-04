package com.tech.ibara.csnotice;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tech.ibara.csnotice.dao.QnaBoardIDao;
import com.tech.ibara.csnotice.dto.QnaDto;
import com.tech.ibara.csnotice.dto.QnaImgDto;
import com.tech.ibara.csnotice.dto.QnaReplyDto;
import com.tech.ibara.csnotice.service.CsQnaContentEditService;
import com.tech.ibara.csnotice.service.CsQnaContentService;
import com.tech.ibara.csnotice.service.CsQnaDeleteService;
import com.tech.ibara.csnotice.service.CsQnaEditProcService;
import com.tech.ibara.csnotice.service.CsQnaListService;
import com.tech.ibara.csnotice.service.CsQnaReplyService;
import com.tech.ibara.csnotice.service.CsQnaService;
import com.tech.ibara.csnotice.service.CsQnaWriteService;
import com.tech.ibara.csnotice.vo.SearchVO;

@Controller
public class CsHomeController {

	@Autowired
	private SqlSession sqlSession;
	
	// 홈에서 고객센터로 이동하는 컨트롤러
	@RequestMapping("/cshome")
	public String cshome(HttpServletRequest request, SearchVO searchVO, Model model) {
		System.out.println("cshome()controller");

		model.addAttribute("request",request);
		model.addAttribute("searchVo",searchVO);
		
		
		return "csnotice/cshome";
	}//qnalist
}
