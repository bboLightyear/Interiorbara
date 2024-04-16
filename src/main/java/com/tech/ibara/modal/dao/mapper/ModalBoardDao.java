package com.tech.ibara.modal.dao.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;

import com.tech.ibara.modal.dto.ModalBoardDto;

public interface ModalBoardDao {
	ModalBoardDto selectModalBoardByEmailAndPw(@Param("email") String email, @Param("pw") String pw);
}
