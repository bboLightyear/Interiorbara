package com.tech.ibara.biz.service.search;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tech.ibara.biz.dao.BizIDao;
import com.tech.ibara.biz.dto.BizHomeDto;
import com.tech.ibara.biz.dto.BizRvDto;
import com.tech.ibara.biz.service.BizServiceInter;

@Service
public class BizAddrSearchFromHomeService implements BizServiceInter {

	private SqlSession sqlSession;
	
	public BizAddrSearchFromHomeService(SqlSession sqlSession) {
		// TODO Auto-generated constructor stub
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		System.out.println("service BizAddrSearchFromHomeService>>>");
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		BizIDao dao=sqlSession.getMapper(BizIDao.class);
		
		String addrToSearch=request.getParameter("addrToSearch");
		String inteno=request.getParameter("inteno");
		model.addAttribute("addrToSearch", addrToSearch);
		model.addAttribute("inteno", inteno);
		
		//시/군/구를 받아옴
		ArrayList<BizHomeDto> findHomeLikeInputAddr = dao.findHomeLikeInputAddr(addrToSearch);
		model.addAttribute("bizHomeSearch", findHomeLikeInputAddr);
		System.out.println("시군구 입력 후 검색 결과 수: "+findHomeLikeInputAddr.size());
		
//		해당업체 시공리뷰 별점의 평균을 세서, for 문을 통해 그 평균들을 arrayList에 담아주는 함수
		ArrayList<Float> bizSearchRvPointAvgList = new ArrayList<Float>();
		try {
			Float bizSearchRvPointAvg=0.0f;
			for (int i = 0; i < findHomeLikeInputAddr.size(); i++) {
				bizSearchRvPointAvg=dao.bizSearchRvPointAvg(findHomeLikeInputAddr.get(i).getInteno());
				if(bizSearchRvPointAvg!=null) {
					bizSearchRvPointAvgList.add(bizSearchRvPointAvg);
				}else {
					bizSearchRvPointAvgList.add(bizSearchRvPointAvg);
					System.out.println(i+"번째 bizSearchRvPointAvg 값이 null입니다.");
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		System.out.println("시군구 입력 후 업체별점 리스트 사이즈: "+bizSearchRvPointAvgList.size());
		model.addAttribute("bizSearchRvPointAvgList", bizSearchRvPointAvgList);
		
//		리뷰첫줄 불러오는 함수
		ArrayList<BizRvDto> bizRvContentListJoinAddr=dao.bizRvContentListJoinAddr(addrToSearch);
		model.addAttribute("bizRvContentListJoinAddr", bizRvContentListJoinAddr);
		
		ArrayList<String> bizRvContentListAddr=new ArrayList<String>();
		
		System.out.println("시군구 입력 후 로딩된 리뷰 첫줄 개수: "+bizRvContentListJoinAddr.size());
	
		for (int j = 0; j < bizRvContentListJoinAddr.size(); j++) {
			bizRvContentListAddr.add(bizRvContentListJoinAddr.get(j).getBr_content());
		}
		model.addAttribute("bizRvContentList", bizRvContentListAddr);
		
		
	}
	
	
	
}
