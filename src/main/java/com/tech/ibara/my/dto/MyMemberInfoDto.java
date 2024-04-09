package com.tech.ibara.my.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class MyMemberInfoDto {
	private int memno;
	private String nickname;
	private String shpwd;
	private String bcpwd;
	private String email;
	private int mailcheck;
	private String birth;
	private String gender;
	private String phone;
	private Date joindate;
	private String memtype;
	private String profileimg;
	
}
