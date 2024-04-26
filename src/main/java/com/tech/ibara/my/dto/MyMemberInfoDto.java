package com.tech.ibara.my.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Getter
@Setter
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
	
	private MyInteriorDto myinteriordto;
	private MySellerDto mysellerdto;
	
	public MyMemberInfoDto(int memno, String nickname, String shpwd, String bcpwd, String email, int mailcheck,
			String birth, String gender, String phone, Date joindate, String memtype, String profileimg) {
		super();
		this.memno = memno;
		this.nickname = nickname;
		this.shpwd = shpwd;
		this.bcpwd = bcpwd;
		this.email = email;
		this.mailcheck = mailcheck;
		this.birth = birth;
		this.gender = gender;
		this.phone = phone;
		this.joindate = joindate;
		this.memtype = memtype;
		this.profileimg = profileimg;
	}
	public MyMemberInfoDto(int memno, String nickname, String shpwd, String bcpwd, String email, int mailcheck,
			String birth, String gender, String phone, Date joindate, String memtype, String profileimg,
			MyInteriorDto myinteriordto) {
		super();
		this.memno = memno;
		this.nickname = nickname;
		this.shpwd = shpwd;
		this.bcpwd = bcpwd;
		this.email = email;
		this.mailcheck = mailcheck;
		this.birth = birth;
		this.gender = gender;
		this.phone = phone;
		this.joindate = joindate;
		this.memtype = memtype;
		this.profileimg = profileimg;
		this.myinteriordto = myinteriordto;
	}
	public MyMemberInfoDto(int memno, String nickname, String shpwd, String bcpwd, String email, int mailcheck,
			String birth, String gender, String phone, Date joindate, String memtype, String profileimg,
			MySellerDto mysellerdto) {
		super();
		this.memno = memno;
		this.nickname = nickname;
		this.shpwd = shpwd;
		this.bcpwd = bcpwd;
		this.email = email;
		this.mailcheck = mailcheck;
		this.birth = birth;
		this.gender = gender;
		this.phone = phone;
		this.joindate = joindate;
		this.memtype = memtype;
		this.profileimg = profileimg;
		this.mysellerdto = mysellerdto;
	}
	public MyMemberInfoDto(int memno, String nickname, String email, String memtype, String profileimg) {
		super();
		this.memno = memno;
		this.nickname = nickname;
		this.email = email;
		this.memtype = memtype;
		this.profileimg = profileimg;
	}
		
}
