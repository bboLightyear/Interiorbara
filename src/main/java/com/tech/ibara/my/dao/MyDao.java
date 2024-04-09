package com.tech.ibara.my.dao;

import java.util.ArrayList;

import com.tech.ibara.my.dto.MyMemberInfoDto;
import com.tech.ibara.my.dto.MyWithdrawalDto;

public interface MyDao {
	public void join(String nickname,String shpwd,String bcpwd,String email);
	
	public int countCheck(String column,String value);
//	public int emailCheck(String email);
//	public int nicknameCheck(String nickname);
		
	public String getMemberEmail(String nickname);
	public String getMemberNickname(String email);
	
	public void setMemberEmailChecked(String nickname);
	
	public MyMemberInfoDto getMemberInfo(String column,String value);
//	public MyMemberInfoDto getMemberFromEmail(String email);
//	public MyMemberInfoDto getMemberFromNickname(String nickname);
	
	public int updateProfileimg(String profileimg,String memno);
	public int modifyMyMemberInfo(String nickname,String phone,
			String birth,String gender,String email);
	public void insertMyWithdrawal(String memno,String reason);
	public int updatePassword(String shpwd,String bcpwd,String nickname);
	public int getmailcheckNum(String nickname);
	public ArrayList<MyWithdrawalDto> getDemandWithdrawalMember();
	public int memnoDuplCheck(String memno);
	public String yesnoCheck (String memno);
	public String getMemtype(String memno);
	public void allowWithdrawal(String yn,String memno);
	public void completedWithdrawal(String memno);
	public void cancelWithdrawal(String memno);
	public ArrayList<MyMemberInfoDto> getMemberInfoList();
	public int insertInterior(String memno,String interiornum);
	public int insertSeller(String memno,String sellernum);
	public int countCheckInterior(String interiorNum);
	public int countCheckSeller(String sellerNum);
	public void completedInterior(String memno);
	public void completedSeller(String memno);
//	public void deleteInterior(String memno);
//	public void deleteSeller(String memno);
	public void deleteDemandWithdrawal(String memno);
	
	
	
}
