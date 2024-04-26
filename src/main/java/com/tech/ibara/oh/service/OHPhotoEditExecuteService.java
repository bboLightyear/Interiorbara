package com.tech.ibara.oh.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tech.ibara.oh.dao.OHInterfaceDao;

@Service
public class OHPhotoEditExecuteService implements OHInterfaceService {

	private SqlSession sqlSession;
	
	public OHPhotoEditExecuteService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	@Override
	public void execute(Model model) {
		System.out.println("OHPhotoEditExecuteService");
		System.out.println("------------------------------");
		
		// Return the current set of model attributes as a Map.
		Map<String, Object> map = model.asMap();		
		
		// mftRequest
		MultipartHttpServletRequest mftRequest = (MultipartHttpServletRequest) map.get("mftRequest");		
		
		// OHInterfaceDao, SqlSession 연결
		OHInterfaceDao dao = sqlSession.getMapper(OHInterfaceDao.class);		
		
		// OPVpb_no 변수 선언, 값 저장		
		String OPVpb_no = mftRequest.getParameter("OPVpb_no");
		// OPVpb_no 변수, 값 출력
		System.out.println("OPVpb_no: " + OPVpb_no);
		System.out.println("------------------------------");		
		
		// 모델, OPVpb_no 저장
		model.addAttribute("pb_no", OPVpb_no);			
		
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
		String pb_no = mftRequest.getParameter("pb_no");
		String pb_title = mftRequest.getParameter("pb_title");
		String pb_content = mftRequest.getParameter("pb_content");
		String pb_residence = mftRequest.getParameter("pb_residence");
		String pb_room = mftRequest.getParameter("pb_room");
		String pb_style = mftRequest.getParameter("pb_style");
		String pb_skill = mftRequest.getParameter("pb_skill");	
		
		// 변수 값 출력
		System.out.println("pb_no: " + pb_no);	
		System.out.println("pb_title: " + pb_title);
		System.out.println("pb_content: " + pb_content);
		System.out.println("pb_residence: " + pb_residence);
		System.out.println("pb_room: " + pb_room);
		System.out.println("pb_style: " + pb_style);
		System.out.println("pb_skill: " + pb_skill);	
		System.out.println("------------------------------");
		
		// DB, OH_PHOTO_BOARD - 변경된 내용으로 업데이트
		// ohPBEditUpdate() 함수 실행
		dao.ohPBEditUpdate(pb_no, pb_title, pb_content,
						   pb_residence, pb_room, pb_style, pb_skill);	
		
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
		// pa_attachList 값 출력
		System.out.println("pa_attachList: " + pa_attachList);
		System.out.println("------------------------------");
		
		// pa_attachList, Null 값 체크
		int checkNum = 1;
		// pa_attachList 반복문
		for(MultipartFile mf : pa_attachList) {
			// pa_attachList, 첨부된 파일이 없다면 실행
			if(mf.isEmpty()) {
				checkNum = 0;
			}
		}
		// pa_attachList, 첨부된 파일이 존재한다면 실행
		if(checkNum == 1) {
			// upload 폴더 - 기존 이미지 파일 삭제
			// getPAFileNames(pb_no) 함수 실행 - 삭제할 이미지 파일 이름 가져오기
			ArrayList<String> paDeleteFileList = dao.getPAFileNames(pb_no);
			// paDeleteFileList 반복문
			for(String f : paDeleteFileList) {
				File file = new File(path + "\\" + f);
				System.out.println("삭제할 이미지 파일 경로: " + path + "\\" + f);
				System.out.println("------------------------------");
				// file 존재한다면 True				
				if(file.exists()) {
					// file 삭제					
					file.delete();
					System.out.println("이미지 삭제완료: " + f);
					System.out.println("------------------------------");
				} else {
					System.out.println("이미지 삭제실패: " + f);
					System.out.println("------------------------------");
				}
			}			
			
			// DB, OH_PHOTO_ATTACH - 기존 내용 삭제
			dao.ohPAEditDelete(pb_no);
			
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
						// upload 폴더 - 변경된 이미지 파일 업로드
						mf.transferTo(new File(pathfile));
						System.out.println("다중 파일 업로드 성공");
						System.out.println("------------------------------");
						// ohPAEditFileUpload() 함수 실행 -> DB, OH_PHOTO_ATTACH - 변경된 내용 입력
						dao.ohPAEditFileUpload(Integer.parseInt(pb_no), changeFile);
					}
				} catch (Exception e) {
					// TODO: handle exception
				}
			}				
		}		
		
	}
	
}
