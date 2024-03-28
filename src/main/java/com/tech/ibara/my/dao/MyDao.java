package com.tech.ibara.my.dao;

import com.tech.ibara.my.dto.MyMemberInfoDto;

public interface MyDao {
	public void join(String nickname,String shpwd,String bcpwd,String email);
	public int emailCheck(String email);
	public int nicknameCheck(String nickname);
	public String getMemberEmail(String nickname);
	public void setMemberEmailChecked(String nickname);
	public MyMemberInfoDto getMemberFromEmail(String email);
	public MyMemberInfoDto getMemberFromNickname(String nickname);
	public int updateProfileimg(String profileimg,String nickname);
	

}
