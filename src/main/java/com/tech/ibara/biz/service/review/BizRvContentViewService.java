package com.tech.ibara.biz.service.review;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tech.ibara.biz.dao.BizIDao;
import com.tech.ibara.biz.dto.BizRvDto;
import com.tech.ibara.biz.dto.BizRvImgDto;
import com.tech.ibara.biz.service.BizServiceInter;
import com.tech.ibara.my.dto.MyMemberInfoDto;

@Service
public class BizRvContentViewService implements BizServiceInter {

	private SqlSession sqlSession;

	private HttpSession session;
	
	public BizRvContentViewService(SqlSession sqlSession, HttpSession session) {
		// TODO Auto-generated constructor stub
		this.sqlSession=sqlSession;
		this.session=session;
	}

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		
		System.out.println("service BizRvContentViewService>>>");
		
		Map<String, Object> map=model.asMap();
		
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		BizIDao dao=sqlSession.getMapper(BizIDao.class);
		
		String br_no=request.getParameter("br_no");
		
		MyMemberInfoDto mdto= (MyMemberInfoDto) session.getAttribute("loginUserDto");

		int total=0;	
		boolean heartIs=false;
		
		if(mdto==null) {
			heartIs=false;
			model.addAttribute("heartIs", false);
			
		}else {
			int imemno=mdto.getMemno();
			String memno = Integer.toString(imemno);
			model.addAttribute("memno", memno);
			
			// 접속유저 기준 해당 리뷰에 좋아요를 찍었는지 안 찍었는지 확인				
			
			total=dao.bizRvLikeCnt(br_no, memno);
			if(total!=0) {
				heartIs=true;
				model.addAttribute("heartIs", true);
			}else {
				heartIs=false;
				model.addAttribute("heartIs", false);
			}
			
			total=dao.bizRvLikeCnt(br_no, memno);
			System.out.println("total : "+total);
			model.addAttribute("bizRvLikeCnt", total);
		}
		
		
		
//		dao.bizRvUpHit(br_no);
		
		BizRvDto dto=dao.bizRvContentView(br_no);
		String inteno=Integer.toString(dto.getInteno());
		
		model.addAttribute("bizRvContentView",dto);
		model.addAttribute("br_no", br_no);		
		model.addAttribute("inteno", inteno);		
		

		
		//접속한 유저뿐 아닌 전체유저의 해당 게시물 좋아요 개수
		int allUserLikeTotal=0;
		allUserLikeTotal=dao.bizRvAllUserLikeCnt(br_no);
		model.addAttribute("allUserLikeTotal", allUserLikeTotal);
		
//		이미지 테이블에서 파일 이름 가져오기
//		그림이 여러 개 있을 수 있으니 어레이리스트에 담는다.
		ArrayList<BizRvImgDto> imglist=dao.selectBizRvImg(br_no);
		model.addAttribute("imglist", imglist);	
		

		
	}

}
