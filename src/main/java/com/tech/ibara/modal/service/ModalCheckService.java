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

	@Override
    public List<ModalCheckDto> getServiceItems(String m_type) {
        return modalDao.selectServiceItems(m_type);
    }


}
