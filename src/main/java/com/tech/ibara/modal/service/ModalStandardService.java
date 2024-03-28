package com.tech.ibara.modal.service;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class ModalStandardService implements ModalService{

	@Override
	public void processModalData(String selectedSize, String selectedService) {
		// 필요한 비즈니스 로직 처리
        // 예: 데이터베이스에 선택한 값 저장, 추가 데이터 조회 등
        System.out.println("Selected Size: " + selectedSize);
        System.out.println("Selected Service: " + selectedService);
	}

	
}
