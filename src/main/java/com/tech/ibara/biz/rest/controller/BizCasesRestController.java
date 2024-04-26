package com.tech.ibara.biz.rest.controller;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tech.ibara.biz.dto.SimDto;

@RestController
public class BizCasesRestController {
	
	@RequestMapping("/biz/cases/simcases")
	public List<SimDto> simcases(HttpServletRequest request) throws Exception {
		System.out.println("simcases @RestController");
		String bt=request.getParameter("bt");
		System.out.println("simcases() : "+bt);
		
 
		 System.out.println("pythonbuilder ");
	        String arg1;
	        ProcessBuilder builder;
	        BufferedReader br;
	        List<SimDto> simlist=new ArrayList<SimDto>();

	        arg1 = "C:\\interiorbara01\\interiorbara01\\src\\main\\webapp\\resources\\pycode\\bizDbcon.py";

	        builder = new ProcessBuilder("python",arg1,bt); //python3 error
	        

	        builder.redirectErrorStream(true);
	        Process process = builder.start();

	        // 자식 프로세스가 종료될 때까지 기다림
	        int exitval = process.waitFor();

	        //// 서브 프로세스가 출력하는 내용을 받기 위해. 파이썬에서 읽어오기(다른 프로그램이니까...)
	        br = new BufferedReader(new InputStreamReader(process.getInputStream(),"euc-kr"));

	        
////	        유사도 분석해서 나온 7개 데이터를 여기서 br로 받는다.
//	        String line;
////		시리즈로 나온 결과를 데이터가 여러줄이니 한 라인, 한 라인 받기	        
//	        while ((line = br.readLine()) != null) {
//	            System.out.println(">>>  " + line); // 표준출력에 쓴다
////	         한 줄씩 읽어올 때마다 SimDto에 넣어줌
//	        	SimDto simDto=new SimDto();
////	            System.out.println(line.indexOf(" ", 1));
////	            int cnt=line.indexOf(" ", 1);
////	            line=line.substring(cnt);
//	            simDto.setSimtitle(line);
//	            simlist.add(simDto);
//	        }
////	        model.addAttribute("simlist",simlist);	        
//	        if(exitval !=0){//비정상종료      
//	            System.out.println("비정상종료");
//	        }
////	        request.getSession().setAttribute("book", "bookkkkkk");
//	        return simlist;
	        
	        String line;
            while ((line = br.readLine()) != null) {
                System.out.println(">>>  " + line); // 표준출력에 쓴다
             SimDto simDto=new SimDto();

             
             line=line.substring(line.indexOf(" ")+1);
             //_위치를 활용 substr
             
                simDto.setSimtitle(line);
                System.out.println("위치 : "+line.indexOf(" "));//위치값 출력해 보기
                simlist.add(simDto);
            }
//            model.addAttribute("simlist",simlist);         
            if(exitval !=0){//비정상종료      
                System.out.println("비정상종료");
            }
//            request.getSession().setAttribute("book", "bookkkkkk");
            simlist.remove(simlist.size()-1);
            //마지막 요소 제거하기
            return simlist;
	}	
}
