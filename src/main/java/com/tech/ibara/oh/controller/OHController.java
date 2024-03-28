package com.tech.ibara.oh.controller;


import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tech.ibara.oh.dao.OHInterfaceDao;
import com.tech.ibara.oh.dto.OHPhotoAttach;
import com.tech.ibara.oh.dto.OHPhotoBoard;
import com.tech.ibara.oh.vo.OHPageVO;

@Controller
public class OHController {
	
	@Autowired
	private SqlSession sqlSession;
	
	// ---------- OHMainView.jsp ---------- 
	@RequestMapping("oh/OHMainView")
	public String OHMainView(HttpServletRequest request, Model model) {
		// Console 출력
		System.out.println("OHMainView Controller");
		return "oh/OHMainView";
	}
	// ---------- OHPhotoView.jsp ---------- 
	@RequestMapping("oh/OHPhotoView")
	public String OHPhotoView(HttpServletRequest request, Model model, OHPageVO ohPageVO) {
		// Console 출력
		System.out.println("OHPhotoView Controller");
		// OHInterfaceDao, SqlSession 연결
		OHInterfaceDao dao = sqlSession.getMapper(OHInterfaceDao.class);
		// --- sorting ---
		// --- sorting 변수 선언, 값 저장 ---
		String orderingBy = request.getParameter("orderingBy");
		String orderingMethod = request.getParameter("orderingMethod");
		// --- sorting 변수 값 출력 ---
		System.out.println("--- sorting 변수 값 출력 ---");
		System.out.println("orderingBy: " + orderingBy);
		System.out.println("orderingMethod: " + orderingMethod);
		// --- filtering ---
		// --- filtering 변수 선언, 값 저장 ---
		String pb_category = request.getParameter("pb_category");
		String pb_residence = request.getParameter("pb_residence");
		String pb_room = request.getParameter("pb_room");
		String pb_style = request.getParameter("pb_style");
		String pb_skill = request.getParameter("pb_skill");
		// --- filtering 변수 값 출력 ---
		System.out.println("--- filtering 변수 값 출력 ---");
		System.out.println("pb_category: " + pb_category);
		System.out.println("pb_residence: " + pb_residence);
		System.out.println("pb_room: " + pb_room);
		System.out.println("pb_style: " + pb_style);
		System.out.println("pb_skill: " + pb_skill);
		// --- searching ---
		// --- searching 변수 값 출력 ---
		String searchingType = request.getParameter("searchingType");
		String searchingWord = request.getParameter("searchingWord");
		// --- searching 변수 값 출력 ---
		System.out.println("--- searching 변수 값 출력 ---");
		System.out.println("searchingType: " + searchingType);
		System.out.println("searchingWord: " + searchingWord);
		
		// 정렬기준 - orderingBy, null Check
		if(orderingBy == null) {
			orderingBy = "pb_date";
			System.out.println("orderingBy is null therefore assigned [pb_date] to it");
		}
		// 정렬기준 - orderingBy, model 저장, attributeName is keepOrderingBy		
		model.addAttribute("keepOrderingBy", orderingBy);
		
		// 정렬기준 - orderingMethod, null Check
		if(orderingMethod == null) {
			orderingMethod = "ascending";
			System.out.println("orderingMethod is null therefore assigned [ascending] to it");
		}
		// 정렬기준 - orderingMethod, model 저장, attributeName is keepOrderingMethod		
		model.addAttribute("keepOrderingMethod", orderingMethod);		
		
		// 정렬기준 - pb_category, null Check
		if(pb_category == null) {
			pb_category = "default";
			System.out.println("pb_category is null therefore assigned [default] to it");
		}
		// 정렬기준 - pb_category, model 저장, attributeName is keepPb_category
		model.addAttribute("keepPb_category", pb_category);				
		
		// 정렬기준 - pb_residence, null Check
		if(pb_residence == null) {
			pb_residence = "default";
			System.out.println("pb_residence is null therefore assigned [default] to it");
		}
		// 정렬기준 - pb_residence, model 저장, attributeName is keepPb_residence
		model.addAttribute("keepPb_residence", pb_residence);			
		
		// 정렬기준 - pb_room, null Check
		if(pb_room == null) {
			pb_room = "default";
			System.out.println("pb_room is null therefore assigned [default] to it");
		}
		// 정렬기준 - pb_room, model 저장, attributeName is keepPb_room
		model.addAttribute("keepPb_room", pb_room);			

		// 정렬기준 - pb_style, null Check
		if(pb_style == null) {
			pb_style = "default";
			System.out.println("pb_style is null therefore assigned [default] to it");
		}
		// 정렬기준 - pb_style, model 저장, attributeName is keepPb_style
		model.addAttribute("keepPb_style", pb_style);	
		
		// 정렬기준 - pb_skill, null Check
		if(pb_skill == null) {
			pb_skill = "default";
			System.out.println("pb_skill is null therefore assigned [default] to it");
		}
		// 정렬기준 - pb_skill, model 저장, attributeName is keepPb_skill
		model.addAttribute("keepPb_skill", pb_skill);			
		
		// 검색기준 - searchingType, null Check
		if(searchingType == null) {
			searchingType = "default";
			System.out.println("searchingType is null therefore assigned [default] to it");
		}
		// 검색기준 - searchingType, model 저장, attributeName is keepSearchingType
		model.addAttribute("keepSearchingType", searchingType);
		
		// 검색어 - searchingWord, null Check
		if(searchingWord == null) {
			searchingWord = "";
			System.out.println("searchingWord is null therefore assigned [\"\"] to it");
		}
		// 검색어 - searchingWord, model 저장, attributeName is keepSearchingWord		
		model.addAttribute("keepSearchingWord", searchingWord);
		
		// --- Paging ---
		// 선택한 현재 페이지 번호 가져오기
		String stringPageSelectedNum = request.getParameter("pageSelectedNum");
		// stringPageSelectedNum, null Check
		if(stringPageSelectedNum == null) {
			stringPageSelectedNum = "1";
		}
		// stringPageSelectedNum 값, int 자료형으로 변환 후 저장
		int pageSelectedNum = Integer.parseInt(stringPageSelectedNum);
		// ohPageVO 객체, 현재 페이지 번호 저장
		ohPageVO.setPageSelectedNum(pageSelectedNum);
		// 전체 게시글 수, 검색에 적용할 변수
		int postTotalNum = 0;
		// getPostTotalCount() 함수 실행, (filtering, searching) 조건에 맞게 전체 게시글 수를 구한다.		
		postTotalNum = dao.getPostTotalCount(pb_category, pb_residence, pb_room, pb_style, pb_skill,
					   						 searchingType, searchingWord);		
		// 전체 게시글 수, 출력
		System.out.println("postTotalNum: " + postTotalNum);
		
			
		
		
		// ohPhotoView() 함수 실행
		ArrayList<OHPhotoBoard> dtoList = dao.ohPhotoView();
		// model 값 전달
		model.addAttribute("ohPhotoView", dtoList);
		return "oh/OHPhotoView";
	}
	// ---------- OHPhotoWriteView.jsp ---------- 
	@RequestMapping("oh/OHPhotoWriteView")
	public String OHPhotoWriteView(HttpServletRequest request, Model model) {
		// Console 출력
		System.out.println("OHPhotoWriteView Controller");
		return "oh/OHPhotoWriteView";
	}
	// ---------- OHPhotoWriteExecute ---------- 
	@RequestMapping("oh/OHPhotoWriteExecute")
	public String OHPhotoWriteExecute(MultipartHttpServletRequest mftRequest, Model model) {
		// Console 출력
		System.out.println("OHPhotoWriteExecute Controller");
		// 변수 선언, 값 저장
		String pb_title = mftRequest.getParameter("pb_title");
		String pb_content = mftRequest.getParameter("pb_content");
		String pb_category = mftRequest.getParameter("pb_category");
		String pb_residence = mftRequest.getParameter("pb_residence");
		String pb_room = mftRequest.getParameter("pb_room");
		String pb_style = mftRequest.getParameter("pb_style");
		String pb_skill = mftRequest.getParameter("pb_skill");		
		// 변수 값 출력
		System.out.println("pb_title: " + pb_title);
		System.out.println("pb_content: " + pb_content);
		System.out.println("pb_category: " + pb_category);
		System.out.println("pb_residence: " + pb_residence);
		System.out.println("pb_room: " + pb_room);
		System.out.println("pb_style: " + pb_style);
		System.out.println("pb_skill: " + pb_skill);
		// OHInterfaceDao, SqlSession 연결
		OHInterfaceDao dao = sqlSession.getMapper(OHInterfaceDao.class);
		// ohPhotoWriteExecute() 함수 실행
		dao.ohPhotoWriteExecute(pb_title, pb_content, pb_category,
								pb_residence, pb_room, pb_style, pb_skill);
		// getRecentPb_no() 함수 실행 -> 가장 최근 작성된 게시글 번호 
		int pb_no = dao.getRecentPb_no();
		System.out.println("가장 최근 작성된 게시글 번호: " + pb_no);
		// 업로드 파일 - 저장할 폴더 경로, path 변수에 저장
		// 스프링 STS - upload 폴더 경로
		// 글쓰기 후 이미지가 바로 출력되지 않는 문제가 있다.
		String path = "C:\\23setspring\\springwork23\\interiorbara\\src\\main\\webapp\\resources\\upload\\oh";
		// 톰캣 server - upload 폴더 경로
		// String path = "C:\\23setspring\\springwork23\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\interiorbara\\resources\\upload\\oh";		
		// 업로드 파일, List 저장
		List<MultipartFile> pa_attachList = mftRequest.getFiles("pa_attach");
		// 파일 저장
		for(MultipartFile mf : pa_attachList) {
			// 원본 파일명
			String originFile = mf.getOriginalFilename();
			System.out.println("원본 파일명: " + originFile);
			// 수정 파일명
			long longtime = System.currentTimeMillis();
			String changeFile = longtime + "_" + mf.getOriginalFilename();
			System.out.println("수정 파일명: " + changeFile);
			// 경로 변수 + 수정 파일명
			String pathfile = path + "\\" + changeFile;
			try {
				if(!originFile.equals("")) {
					mf.transferTo(new File(pathfile));
					System.out.println("다중 파일 업로드 성공");
					// setFileUpload() 함수 실행 -> DB에 파일명 INSERT
					dao.setFileUpload(pb_no, changeFile);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		return "redirect:OHPhotoView";
	}
	// ---------- OHPhotoDetailView.jsp ---------- 
	@RequestMapping("oh/OHPhotoDetailView")
	public String OHPhotoDetailView(HttpServletRequest request, Model model) {
		// Console 출력
		System.out.println("OHPhotoDetailView Controller");
		// 변수 선언, 값 저장		
		String pb_no = request.getParameter("pb_no");
		// 변수 값 출력
		System.out.println("pb_no: " + pb_no);
		// OHInterfaceDao, SqlSession 연결
		OHInterfaceDao dao = sqlSession.getMapper(OHInterfaceDao.class);
		// 게시글 조회수 증가, UpdatePb_hit() 함수 실행
		dao.updatePb_hit(pb_no);
		// getDtoOHPhotoBoard() 함수 실행
		OHPhotoBoard pb_dto = dao.getDtoOHPhotoBoard(pb_no);
		// model 값 전달
		model.addAttribute("pb_dto", pb_dto);
		// getDtoOHPhotoAttach() 함수 실행
		ArrayList<OHPhotoAttach> pa_dto = dao.getDtoOHPhotoAttach(pb_no);
		// model 값 전달
		model.addAttribute("pa_dto", pa_dto);
		return "oh/OHPhotoDetailView";
	}
	// ---------- OHPhotoEditView.jsp ----------
	@RequestMapping("oh/OHPhotoEditView")
	public String OHPhotoEditView(HttpServletRequest request, Model model) {
		// Console 출력
		System.out.println("OHPhotoEditView Controller");
		// 변수 선언, 값 저장		
		String pb_no = request.getParameter("pb_no");
		// 변수 값 출력
		System.out.println("pb_no: " + pb_no);
		// OHInterfaceDao, SqlSession 연결
		OHInterfaceDao dao = sqlSession.getMapper(OHInterfaceDao.class);
		// getDtoOHPhotoBoard() 함수 실행
		OHPhotoBoard pb_dto = dao.getDtoOHPhotoBoard(pb_no);
		// model 값 전달
		model.addAttribute("pb_dto", pb_dto);
		// getDtoOHPhotoAttach() 함수 실행		
		ArrayList<OHPhotoAttach> pa_dto = dao.getDtoOHPhotoAttach(pb_no);
		// model 값 전달
		model.addAttribute("pa_dto", pa_dto);
		return "oh/OHPhotoEditView";
	}
	// ---------- OHPhotoEditExecute ----------
	@RequestMapping("oh/OHPhotoEditExecute")
	public String OHPhotoEditExecute(MultipartHttpServletRequest mftRequest, Model model) {
		// Console 출력
		System.out.println("OHPhotoEditExecute Controller");
		// 변수 선언, 값 저장
		String pb_no = mftRequest.getParameter("pb_no");
		String pb_title = mftRequest.getParameter("pb_title");
		String pb_content = mftRequest.getParameter("pb_content");
		String pb_category = mftRequest.getParameter("pb_category");
		String pb_residence = mftRequest.getParameter("pb_residence");
		String pb_room = mftRequest.getParameter("pb_room");
		String pb_style = mftRequest.getParameter("pb_style");
		String pb_skill = mftRequest.getParameter("pb_skill");	
		// 변수 값 출력
		System.out.println("pb_no: " + pb_no);	
		System.out.println("pb_title: " + pb_title);
		System.out.println("pb_content: " + pb_content);
		System.out.println("pb_category: " + pb_category);
		System.out.println("pb_residence: " + pb_residence);
		System.out.println("pb_room: " + pb_room);
		System.out.println("pb_style: " + pb_style);
		System.out.println("pb_skill: " + pb_skill);		
		// OHInterfaceDao, SqlSession 연결
		OHInterfaceDao dao = sqlSession.getMapper(OHInterfaceDao.class);		
		// DB, OH_PHOTO_BOARD - 변경된 내용으로 업데이트
		// ohPhotoWriteExecute() 함수 실행
		dao.ohPBEditUpdate(pb_no, pb_title, pb_content, pb_category,
								pb_residence, pb_room, pb_style, pb_skill);	
		// 업로드 파일 - 저장할 폴더 경로, path 변수에 저장
		// 스프링 STS - upload 폴더 경로
		// 글쓰기 후 이미지가 바로 출력되지 않는 문제가 있다.
		String path = "C:\\23setspring\\springwork23\\interiorbara\\src\\main\\webapp\\resources\\upload\\oh";
		// 톰캣 server - upload 폴더 경로
		// String path = "C:\\23setspring\\springwork23\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\interiorbara\\resources\\upload\\oh";
		// 업로드 파일, List 저장
		List<MultipartFile> pa_attachList = mftRequest.getFiles("pa_attach");
		// pa_attachList 값 출력
		System.out.println("pa_attachList: " + pa_attachList);
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
				System.out.println(path + "\\" + f);
				if(file.exists()) {
					file.delete();
					System.out.println("이미지 삭제완료: " + f);
				} else {
					System.out.println("이미지 삭제실패: " + f);
				}
			}			
			// DB, OH_PHOTO_ATTACH - 기존 내용 삭제
			dao.ohPAEditDelete(pb_no);	
			// 파일 저장
			for(MultipartFile mf : pa_attachList) {
				// 원본 파일명
				String originFile = mf.getOriginalFilename();
				System.out.println("원본 파일명: " + originFile);
				// 수정 파일명
				long longtime = System.currentTimeMillis();
				String changeFile = longtime + "_" + mf.getOriginalFilename();
				System.out.println("수정 파일명: " + changeFile);
				// 경로 변수 + 수정 파일명
				String pathfile = path + "\\" + changeFile;
				try {
					if(!originFile.equals("")) {
						// upload 폴더 - 변경된 이미지 파일 업로드
						mf.transferTo(new File(pathfile));
						System.out.println("다중 파일 업로드 성공");
						// ohPAEditFileUpload() 함수 실행 -> DB, OH_PHOTO_ATTACH - 변경된 내용 입력
						dao.ohPAEditFileUpload(Integer.parseInt(pb_no), changeFile);
					}
				} catch (Exception e) {
					// TODO: handle exception
				}
			}				
		}
		return "redirect:OHPhotoDetailView?pb_no=" + pb_no;
	}
	// ---------- OHPhotoDeleteExecute ----------
	@RequestMapping("oh/OHPhotoDeleteExecute")
	public String OHPhotoDeleteExecute(HttpServletRequest request, Model model) {
		// Console 출력
		System.out.println("OHPhotoDeleteExecute Controller");
		// 변수 선언, 값 저장		
		String pb_no = request.getParameter("pb_no");
		// 변수 값 출력
		System.out.println("pb_no: " + pb_no);
		// OHInterfaceDao, SqlSession 연결
		OHInterfaceDao dao = sqlSession.getMapper(OHInterfaceDao.class);
		// upload 폴더 - 이미지 삭제		
		// 업로드 파일 - 저장할 폴더 경로, path 변수에 저장
		// 스프링 STS - upload 폴더 경로
		// 글쓰기 후 이미지가 바로 출력되지 않는 문제가 있다.
		String path = "C:\\23setspring\\springwork23\\interiorbara\\src\\main\\webapp\\resources\\upload\\oh";
		// 톰캣 server - upload 폴더 경로
		// String path = "C:\\23setspring\\springwork23\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\interiorbara\\resources\\upload\\oh";	
		// getPAFileNames(pb_no) 함수 실행 - 삭제할 이미지 파일 이름 가져오기
		ArrayList<String> paDeleteFileList = dao.getPAFileNames(pb_no);		
		// paDeleteFileList 반복문
		for(String f : paDeleteFileList) {
			File file = new File(path + "\\" + f);
			System.out.println(path + "\\" + f);
			// file 존재한다면 True
			if(file.exists()) {
				// file 삭제
				file.delete();
				System.out.println("이미지 삭제완료: " + f);
			} else {
				System.out.println("이미지 삭제실패: " + f);
			}
		}					
		// DB - OH_PHOTO_BOARD 삭제
		dao.ohPBDelete(pb_no);
		System.out.println("DB - OH_PHOTO_BOARD, pb_no: " + pb_no + " 삭제완료");
		// DB - OH_PHOTO_ATTACH, pb_no - Foreign Key, ON DELETE CASCADE 
		return "redirect:OHPhotoView";
	}	

	
	
	
}