package com.tech.ibara.oh.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tech.ibara.my.dto.MyMemberInfoDto;
import com.tech.ibara.oh.dao.OHInterfaceDao;

@Service
public class OHPhotoWriteExecuteService implements OHInterfaceService {

	private SqlSession sqlSession;	
	
	public OHPhotoWriteExecuteService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("OHPhotoWriteExecuteService");
		System.out.println("------------------------------");
		
		// Return the current set of model attributes as a Map.
		Map<String, Object> map = model.asMap();
		
		// mftRequest
		MultipartHttpServletRequest mftRequest = (MultipartHttpServletRequest) map.get("mftRequest");
		
		// session
		HttpSession session = (HttpSession) map.get("session");
		// session, 로그인 정보 가져오기
		MyMemberInfoDto loginUserDto =  (MyMemberInfoDto) session.getAttribute("loginUserDto");
		// 로그인 정보, 변수 저장
		int memno = loginUserDto.getMemno();
		// 로그인 정보, 출력		
		System.out.println("memno: " + memno);	
		System.out.println("------------------------------");		
		
		// OHInterfaceDao, SqlSession 연결
		OHInterfaceDao dao = sqlSession.getMapper(OHInterfaceDao.class);
		
		// --- sorting ---
		// --- sorting 변수 선언, 값 저장 ---
		String OPVorderingBy = mftRequest.getParameter("OPVorderingBy");
		String OPVorderingMethod = mftRequest.getParameter("OPVorderingMethod");
		// --- sorting 변수 값 출력 ---
		System.out.println("--- sorting 변수 값 출력 ---");
		System.out.println("OPVorderingBy: " + OPVorderingBy);
		System.out.println("OPVorderingMethod: " + OPVorderingMethod);
		System.out.println("------------------------------");			
		
		// 모델, OPVorderingBy 저장
		model.addAttribute("orderingBy", OPVorderingBy);
		// 모델, OPVorderingMethod 저장
		model.addAttribute("orderingMethod", OPVorderingMethod);		
		
		// --- filtering ---
		// --- filtering 변수 선언, 값 저장 ---
		String OPVpb_residence = mftRequest.getParameter("OPVpb_residence");
		String OPVpb_room = mftRequest.getParameter("OPVpb_room");
		String OPVpb_style = mftRequest.getParameter("OPVpb_style");
		String OPVpb_skill = mftRequest.getParameter("OPVpb_skill");
		// --- filtering 변수 값 출력 ---
		System.out.println("--- filtering 변수 값 출력 ---");
		System.out.println("OPVpb_residence: " + OPVpb_residence);
		System.out.println("OPVpb_room: " + OPVpb_room);
		System.out.println("OPVpb_style: " + OPVpb_style);
		System.out.println("OPVpb_skill: " + OPVpb_skill);
		System.out.println("------------------------------");		
		
		// 모델, pb_residence 저장
		model.addAttribute("pb_residence", OPVpb_residence);
		// 모델, pb_room 저장
		model.addAttribute("pb_room", OPVpb_room);
		// 모델, pb_style 저장
		model.addAttribute("pb_style", OPVpb_style);
		// 모델, pb_skill 저장
		model.addAttribute("pb_skill", OPVpb_skill);		
		
		// --- searching ---
		// --- searching 변수 값 출력 ---
		String OPVsearchingType = mftRequest.getParameter("OPVsearchingType");
		String OPVsearchingWord = mftRequest.getParameter("OPVsearchingWord");
		// --- searching 변수 값 출력 ---
		System.out.println("--- searching 변수 값 출력 ---");
		System.out.println("OPVsearchingType: " + OPVsearchingType);
		System.out.println("OPVsearchingWord: " + OPVsearchingWord);
		System.out.println("------------------------------");		
		
		// 모델, searchingType 저장
		model.addAttribute("searchingType", OPVsearchingType);
		// 모델, searchingWord 저장
		model.addAttribute("searchingWord", OPVsearchingWord);			
		
		// --- paging ---
		// --- paging 변수 값 출력 ---
		String stringPageSelectedNum = mftRequest.getParameter("OPVpageSelectedNum");
		// --- paging 변수 값 출력 ---
		System.out.println("--- paging 변수 값 출력 ---");
		System.out.println("stringPageSelectedNum: " + stringPageSelectedNum);
		System.out.println("------------------------------");		
		
		if(stringPageSelectedNum == null || stringPageSelectedNum.equals("/")) {
			stringPageSelectedNum = "0";
		}		
		
		int OPVpageSelectedNum = Integer.parseInt(stringPageSelectedNum);
		
		// 모델, pageSelectedNum 저장
		model.addAttribute("pageSelectedNum", OPVpageSelectedNum);					
		
		// 변수 선언, 값 저장
		String pb_title = mftRequest.getParameter("pb_title");
		String pb_content = mftRequest.getParameter("pb_content");
		String pb_residence = mftRequest.getParameter("pb_residence");
		String pb_room = mftRequest.getParameter("pb_room");
		String pb_style = mftRequest.getParameter("pb_style");
		String pb_skill = mftRequest.getParameter("pb_skill");		
		
		// 변수 값 출력
		System.out.println("pb_title: " + pb_title);
		System.out.println("pb_content: " + pb_content);
		System.out.println("pb_residence: " + pb_residence);
		System.out.println("pb_room: " + pb_room);
		System.out.println("pb_style: " + pb_style);
		System.out.println("pb_skill: " + pb_skill);
		System.out.println("------------------------------");
		
		// ohPhotoWriteExecute() 함수 실행
		dao.ohPhotoWriteExecute(memno, pb_title, pb_content,
								pb_residence, pb_room, pb_style, pb_skill);
		
		// getRecentPb_no() 함수 실행 -> 가장 최근 작성된 게시글 번호 
		int pb_no = dao.getRecentPb_no();
		System.out.println("가장 최근 작성된 게시글 번호: " + pb_no);
		System.out.println("------------------------------");
		
		// 모델, pb_no 저장
		model.addAttribute("pb_no", pb_no);			
		
		// 업로드 파일 - 저장할 폴더 경로, path 변수에 저장
		
		// 메인 컴퓨터 경로
//		String path = "C:\\interiorbara01\\interiorbara01\\src\\main\\webapp\\resources\\upload\\oh\\photo";
//		System.out.println("path: " + path);
//		System.out.println("------------------------------");		
		
		// 스프링 STS - upload 폴더 경로 => *****글쓰기 후 이미지가 바로 출력되지 않는 문제가 있다.*****
		String path = "C:\\23setspring\\springwork23\\interiorbara01\\src\\main\\webapp\\resources\\upload\\oh\\photo";
		System.out.println("path: " + path);
		System.out.println("------------------------------");
		
		// 톰캣 server - upload 폴더 경로
//		String path = "C:\\23setspring\\springwork23\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\interiorbara\\resources\\upload\\oh\\photo";
//		System.out.println("path: " + path);
//		System.out.println("------------------------------");			
		
		// 업로드 파일, List 저장
		List<MultipartFile> pa_attachList = mftRequest.getFiles("pa_attach");
		
		// 파일 저장
		for(MultipartFile mf : pa_attachList) {
			// 원본 파일명
			String originFile = mf.getOriginalFilename();
			System.out.println("원본 파일명: " + originFile);
			System.out.println("------------------------------");
			// 수정 파일명
			long longtime = System.currentTimeMillis();
			String changeFile = longtime + "_" + mf.getOriginalFilename();
			System.out.println("수정 파일명: " + changeFile);
			System.out.println("------------------------------");
			// 경로 변수 + 수정 파일명
			String pathfile = path + "\\" + changeFile;
			try {
				if(!originFile.equals("")) {
					mf.transferTo(new File(pathfile));
					System.out.println("다중 파일 업로드 성공");
					System.out.println("------------------------------");
					// setFileUpload() 함수 실행 -> DB에 파일명 INSERT
					dao.setFileUpload(pb_no, changeFile);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
		}		
		
	}

}
