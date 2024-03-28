package com.tech.ibara.modal.service;

import java.util.List;

import org.springframework.ui.Model;

import com.tech.ibara.modal.dto.ModalCheckDto;

public interface ModalService {

	public List<ModalCheckDto> getServiceItems(String m_type);

}
