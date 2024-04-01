package com.tech.ibara.modal.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tech.ibara.modal.dao.mapper.ModalDao;
import com.tech.ibara.modal.dto.ModalCheckDto;
import com.tech.ibara.modal.service.ModalCheckService;
import com.tech.ibara.modal.service.ModalService;

@Controller
public class ModalController {
	
	
	private ModalService modalService;
	
	
	
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
		System.out.println("mServiceCheck컨트롤러");
		/*
		 * model.addAttribute("sqlSession",sqlSession);
		 * model.addAttribute("request",request);
		 * 
		 * modalService = new ModalCheckService(sqlSession);
		 * modalService.execute(model);
		 */
		
        
        return "/modal/mServiceCheck";
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
 
}
