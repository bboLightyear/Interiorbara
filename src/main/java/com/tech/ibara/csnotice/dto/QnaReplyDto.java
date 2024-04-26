package com.tech.ibara.csnotice.dto;

import com.tech.ibara.my.dto.MyMemberInfoDto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class QnaReplyDto {
	private int qbno;
	private int rqbno;
	private String rqbwriter;
	private String rqbcontent;
	private int rqbstep;
	private int rqbgroup;
	private int rqbindent;
	 // 추가된 멤버 정보
    private MyMemberInfoDto memberInfo;  // MY_MEMBER_INFO 테이블 데이터를 저장하기 위한 속성

    // Getters and Setters
    public MyMemberInfoDto getMemberInfo() {
        return memberInfo;
    }

    public void setMemberInfo(MyMemberInfoDto memberInfo) {
        this.memberInfo = memberInfo;
    }
}
