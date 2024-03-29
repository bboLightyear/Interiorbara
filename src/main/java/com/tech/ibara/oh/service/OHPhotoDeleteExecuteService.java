package com.tech.ibara.oh.service;

import java.io.File;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tech.ibara.oh.dao.OHInterfaceDao;

@Service
public class OHPhotoDeleteExecuteService implements OHInterfaceService {

	private SqlSession sqlSession;	
	
	public OHPhotoDeleteExecuteService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("OHPhotoDeleteExecuteService");
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");				
		
		// OHInterfaceDao, SqlSession 연결
		OHInterfaceDao dao = sqlSession.getMapper(OHInterfaceDao.class);
		
		// 변수 선언, 값 저장		
		String pb_no = request.getParameter("pb_no");
		// 변수 값 출력
		System.out.println("pb_no: " + pb_no);

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

	}
	
}
