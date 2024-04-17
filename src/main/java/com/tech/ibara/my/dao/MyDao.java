package com.tech.ibara.my.dao;

import java.util.ArrayList;

import com.tech.ibara.biz.dto.BizHomeDto;
import com.tech.ibara.my.dto.InteriorCasesImgDto;
import com.tech.ibara.my.dto.MyMemberInfoDto;
import com.tech.ibara.my.dto.MyNonMemberDto;
import com.tech.ibara.my.dto.MyReportDto;
import com.tech.ibara.my.dto.MyWithdrawalDto;
import com.tech.ibara.my.dto.PhotoAttachDto;

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
	public String yesnoCheck_Withdrawal (String memno);
	public String getMemtype(String memno);
	public void allowWithdrawal(String yn,String memno);
	public void completedWithdrawal(String memno);
	public void cancelWithdrawal(String memno);
	public int insertInterior(String memno,String interiornum);
	public int insertSeller(String memno,String sellernum);
	public int countCheckInterior(String interiorNum);
	public int countCheckSeller(String sellerNum);
	public void completedInterior(String memno);
	public void completedSeller(String memno);
//	public void deleteInterior(String memno);
//	public void deleteSeller(String memno);
	public void deleteDemandWithdrawal(String memno);
	public int countCheckNonmember(String email);
	public MyNonMemberDto getNonmember(String email);
//	public MyInteriorDto getInterior(int memno);
//	public MySellerDto getSeller(int memno);
	public MyMemberInfoDto getInteriorMember(int memno);
	public MyMemberInfoDto getSellerMember(int memno);
	public ArrayList<MyReportDto> getReportList();
//	public String yesnoCheck_Report (String reno);
	public void allowBlind(String yn,String reno);
	public MyReportDto getReportRv(String reno);
	public void blindReview(int br_no);
	public void saveReview(String br_content,String br_writer,int br_no);
	public int countLikePhotoBoard(int memno);
//	public int countLikePhotoReply(int memno);
	public int countScrapPhotoBoard(int memno);
	public int countBizBmark(int memno);
	public ArrayList<PhotoAttachDto> getMyPhoto(int memno);
	public ArrayList<PhotoAttachDto> getMyPhotoBoardList(int memno);
	public ArrayList<InteriorCasesImgDto> getMyCasesList(int inteno);
	public ArrayList<BizHomeDto> getBmarkedHomesByUserMy(int memno);
	public int getInteno(String memno);
	public void bizHomeCreate(String nickname, int inteno);
	public int countMemberList(String mlSelNum,String searchKeyword);
	public ArrayList<MyMemberInfoDto> getMemberInfoList(String selNum,String searchKeyword);
	
}
