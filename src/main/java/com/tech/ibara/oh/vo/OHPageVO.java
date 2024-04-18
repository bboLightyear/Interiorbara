package com.tech.ibara.oh.vo;

public class OHPageVO {
	
	// 게시글 - Post
	private Integer outputPostCount = 12; // 출력할 게시글 수	
	private Integer postTotalNum;		  // 전체 게시글 수
	private Integer postStartNum;		  // 시작 게시글 번호
	private Integer postEndNum;			  // 종료 게시글 번호
	// 페이지 - Page
	private Integer groupPageCount = 10;   // 페이지 그룹당 페이지 수
	private Integer pageTotalNum;		  // 전체 페이지 수
	private Integer pageSelectedNum;	  // 현재 페이지 번호 
	private Integer pageStartNum;		  // 시작 페이지 번호
	private Integer pageEndNum;			  // 종료 페이지 번호
	
	// 현재 페이지 번호 - null or 0일 경우 처리
	public Integer getPageSelectedNum() {
		if(pageSelectedNum == null || pageSelectedNum == 0) {
			pageSelectedNum = 1;
		}
		return pageSelectedNum;
	}
	
	// 전체 게시글 수(PTN)를 이용해서 페이지 수를 계산한다.	
	public void pageAndPostCalculate(Integer PTN) {
		// *** 페이지 - Page ***
		// 현재 페이지 번호 - null or 0일 경우 처리
		getPageSelectedNum();
		// 전체 게시글 수
		postTotalNum = PTN;
		// 전체 페이지 수 = (전체 게시글 수 / 출력할 게시글 수)
		pageTotalNum = (int) (PTN / outputPostCount);
		// if 조건문 - (전체 게시글 수 / 출력할 게시글 수)의 나머지 값 > 0
		if(PTN % outputPostCount > 0) {
			// 전체 페이지 수, 1 증가
			pageTotalNum++;
		// 전체 게시글 수(PTN)가 0일 경우, 전체 페이지 수 => 1 
		} else if (PTN == 0) {
			pageTotalNum = 1;
		}
		// 시작 페이지 번호 = (현재 페이지 번호 - (현재 페이지 번호 - 1) % 페이지 그룹당 페이지 수)
		pageStartNum = (pageSelectedNum - (pageSelectedNum - 1) % groupPageCount);
		// 종료 페이지 번호 = (시작 페이지 번호 + (페이지 그룹당 페이지 수 - 1)
		pageEndNum = pageStartNum + (groupPageCount - 1);
		// if 조건문 - 종료 페이지 번호 > 전체 페이지 수
		if(pageEndNum > pageTotalNum) {
			// 종료 페이지 번호 = 전체 페이지 수
			pageEndNum = pageTotalNum;
		}
		// *** 게시글 - Post ***
		// 시작 게시글 번호 = ((현재 페이지 번호  - 1) * 출력할 게시글 수) + 1
		postStartNum = ((pageSelectedNum - 1) * outputPostCount) + 1;
		// 종료 게시글 번호 = 시작 게시글 번호 + 출력할 게시글 수 - 1
		postEndNum = postStartNum + outputPostCount - 1;
	}
		
	public Integer getOutputPostCount() {
		return outputPostCount;
	}
	public void setOutputPostCount(Integer outputPostCount) {
		this.outputPostCount = outputPostCount;
	}
	public Integer getPostTotalNum() {
		return postTotalNum;
	}
	public void setPostTotalNum(Integer postTotalNum) {
		this.postTotalNum = postTotalNum;
	}
	public Integer getPostStartNum() {
		return postStartNum;
	}
	public void setPostStartNum(Integer postStartNum) {
		this.postStartNum = postStartNum;
	}
	public Integer getPostEndNum() {
		return postEndNum;
	}
	public void setPostEndNum(Integer postEndNum) {
		this.postEndNum = postEndNum;
	}
	public Integer getGroupPageCount() {
		return groupPageCount;
	}
	public void setGroupPageCount(Integer groupPageCount) {
		this.groupPageCount = groupPageCount;
	}
	public Integer getPageTotalNum() {
		return pageTotalNum;
	}
	public void setPageTotalNum(Integer pageTotalNum) {
		this.pageTotalNum = pageTotalNum;
	}
	
	// getPageSelectedNum() 함수는 18행에 정의되어 있다.
	
	public void setPageSelectedNum(Integer pageSelectedNum) {
		this.pageSelectedNum = pageSelectedNum;
	}
	public Integer getPageStartNum() {
		return pageStartNum;
	}
	public void setPageStartNum(Integer pageStartNum) {
		this.pageStartNum = pageStartNum;
	}
	public Integer getPageEndNum() {
		return pageEndNum;
	}
	public void setPageEndNum(Integer pageEndNum) {
		this.pageEndNum = pageEndNum;
	}
	
}
