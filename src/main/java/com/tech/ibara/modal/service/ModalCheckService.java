package com.tech.ibara.modal.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tech.ibara.modal.dao.mapper.ModalDao;
import com.tech.ibara.modal.dto.ModalCheckDto;

@Service
public class ModalCheckService implements ModalService{
			
	private ModalDao modalDao;
	
	public ModalCheckService(ModalDao modalDao) {
		this.modalDao = modalDao;
	}

	/*
	 * @Override public void execute(Model model) {
	 * System.out.println("ModalCheckService.execute()");
	 * 
	 * Map<String, Object> map = model.asMap(); HttpServletRequest request =
	 * (HttpServletRequest) map.get("request"); ModalDao dao =
	 * sqlSession.getMapper(ModalDao.class);
	 * 
	 * String m_type = request.getParameter("m_type"); String m_pname =
	 * request.getParameter("m_pname"); String m_pexp =
	 * request.getParameter("m_pexp"); int m_pprice =
	 * Integer.parseInt(request.getParameter("m_pprice"));
	 * 
	 * List<ModalCheckDto> serviceItems = dao.selectServiceItems(m_type, m_pname,
	 * m_pexp, m_pprice); model.addAttribute("serviceItems", serviceItems); }
	 */

	@Override
    public List<ModalCheckDto> getServiceItems(String m_type) {
        return modalDao.selectServiceItems(m_type);
    }


}
