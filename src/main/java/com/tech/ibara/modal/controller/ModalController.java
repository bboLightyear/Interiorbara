package com.tech.ibara.modal.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tech.ibara.modal.dto.CompleteInfoDto;
import com.tech.ibara.modal.dto.ModalBoardDto;
import com.tech.ibara.modal.dto.ModalCheckDto;
import com.tech.ibara.modal.dto.ModalCompleteDto;
import com.tech.ibara.modal.dto.NonMemberDto;
import com.tech.ibara.modal.service.ModalBoardService;
import com.tech.ibara.modal.service.ModalService;

@Controller
public class ModalController {

	private ModalService modalService;
	@Autowired
	private SqlSession sqlSession;

	private ModalBoardService modalBoardService;

	@RequestMapping("/modal/mMain")
	public String mMain(Model model) {

		return "/modal/mMain";
	}

	@RequestMapping("/modal/mSize")
	public String mSize(Model model) {

		return "/modal/mSize";
	}

	@RequestMapping("/modal/mServiceCheck")
	public String mServiceCheck(HttpServletRequest request, Model model) {

		return "/modal/mServiceCheck";
	}

	@RequestMapping("/modal/mAsk")
	public String mAsk(HttpServletRequest request, Model model) {

		return "/modal/mAsk";
	}

	@RequestMapping("/modal/mInfo")
	public String mInfo(HttpServletRequest request, Model model) {

		return "/modal/mInfo";
	}

	@Autowired
	public ModalController(ModalService modalService) {
		this.modalService = modalService;
	}

	@GetMapping("/modal/getServiceItems")
	@ResponseBody
	public List<ModalCheckDto> getServiceItems(@RequestParam("m_type") String m_type) {
		System.out.println("getServiceItems");
		return modalService.getServiceItems(m_type);
	}

	@PostMapping("/modal/insertNonMember")
	@ResponseBody
	public void insertNonMember(NonMemberDto nonMemberDto) {

		System.out.println("insertNonMember컨트롤러");

		modalService.insertNonMember(nonMemberDto);

		// 리다이렉트 또는 다른 처리 로직 추가
	}

	@PostMapping("/modal/updateModalComplete")
	@ResponseBody
	public void updateModalComplete(@RequestBody ModalCompleteDto modalCompleteDto) {
		System.out.println("updateModalComplete컨트롤러");

		// System.out.println("컨트롤러m_addr: " + modalCompleteDto.getM_addr());
		// System.out.println("컨트롤러m_tel: " + modalCompleteDto.getM_tel());
		try {
			modalService.updateModalComplete(modalCompleteDto);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("modalCompleteDto컨트롤러 오류");
		}
	}

	@GetMapping("/modal/complete")
	@ResponseBody
	public CompleteInfoDto showCompleteModal(@RequestParam("phone") String phone) {
		CompleteInfoDto completeInfo = modalService.getCompleteInfo(phone);
		System.out.println("completeInfo컨트롤러");
		return completeInfo;
	}


	@PostMapping("/modal/mBoard")
	    public String mBoard(HttpServletRequest request, Model model) {
	        System.out.println("mBoard컨트롤러");
	        model.addAttribute("request", request);
	        modalBoardService = new ModalBoardService(sqlSession);

	        String email = request.getParameter("email");
	        String pw = request.getParameter("pw");

	        ModalBoardDto modalBoardDto = modalBoardService.getModalBoardByEmailAndPw(email, pw);
	        if (modalBoardDto != null) {
	            model.addAttribute("modalBoard", modalBoardDto);
	            return "/modal/mBoard";
	        } else {
	            model.addAttribute("error", "견적 정보를 찾을 수 없습니다.");
	            return "my/nonmember";
	        }
	    }

}
