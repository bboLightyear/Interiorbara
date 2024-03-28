<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="resources/css/noticelist.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<title>Insert title here</title>
</head>
<body>
	<h3>qnalist</h3>

	<!-- 헤더 -->
	<header>
		<!-- header_top : 헤더 윗부분 -->
		<div class="header_top">
			<!-- 왼쪽 여백 -->
			<div></div>
			<!-- header_logo : 로고 -->
			<div class="header_logo">
				<i class="fas fa-paw"></i>
			</div>
			<!-- header_search_box : 검색창 -->
			<div class="header_search_box">
				<i class="fas fa-search header_search_box_icon"></i> <input
					type="text" class="header_search_box_input" placeholder="검색">
			</div>
			<!-- header_login_box : 회원관리부분 -->
			<div class="header_login_box">
				<div class="header_login">로그인</div>
				<div class="header_join">회원가입</div>
				<div class="header_cs">마이페이지</div>
			</div>
			<!-- 오른쪽 여백 -->
			<div></div>
		</div>
		<!-- header_bottom : 헤더 아랫부분 -->
		<div class="header_bottom">
			<!-- header_category_icon : 카테고리 아이콘 -->
			<div class="header_category_icon">
				<i class="fas fa-bars"></i>
			</div>
			<!-- header_category_list : 카테고리 / list_1~5 : list에 각각 들어갈 내용 -->
			<div class="header_category_list list_1">퀵견적</div>
			<div class="header_category_list list_2">업체 둘러보기</div>
			<div class="header_category_list list_3">소품샵</div>
			<div class="header_category_list list_4">우리 집 자랑하기</div>
			<div class="header_category_list list_5">고객센터</div>
		</div>
	</header>

	<br>
	<form action="qnalist" method="post">
		<div>
			<select name="qnadiv">
				<c:choose>
					<c:when test="${all }">
						<option value="all" selected="selected">전체</option>
					</c:when>
					<c:otherwise>						
						<option value="all">전체</option>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${qq }">
						<option value="qq" selected="selected">퀵견적</option>
					</c:when>
					<c:otherwise>						
						<option value="qq">퀵견적</option>
					</c:otherwise>
				</c:choose>

				<c:choose>
					<c:when test="${oh }">
						<option value="oh" selected="selected">우리집 자랑하기</option>
					</c:when>
					<c:otherwise>						
						<option value="oh">우리집 자랑하기</option>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${biz }">
						<option value="biz" selected="selected">업체 관련</option>
					</c:when>
					<c:otherwise>						
						<option value="biz">업체 관련</option>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${pf }">
						<option value="pf" selected="selected">로그인/회원정보</option>
					</c:when>
					<c:otherwise>						
						<option value="pf">로그인/회원정보</option>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${sh }">
						<option value="sh" selected="selected">소품샵</option>
					</c:when>
					<c:otherwise>						
						<option value="sh">소품샵</option>
					</c:otherwise>
				</c:choose>
			</select> 
			<input type="text" name="sk" value="${searchKeyword }" /> 
			<input type="submit" value="검색" />
		</div>

		<table class="" border="1px">
			<tr class="">
				<td class="">NO</td>
				<td class="">제목</td>
				<td class="">이름</td>
				<td class="">날짜</td>
				<td class="">조회수</td>
			</tr>
			<c:forEach items="${list }" var="dto">
				<tr class="">
					<td class="">${dto.nbno }</td>
					<td class=""><a href="qnacontent?nbno=${dto.nbno }">${dto.nbtitle }</a>
					</td>
					<td class="">${dto.nbwriter }</td>
					<td class="">${dto.nbdate }</td>
					<td class="">${dto.nbhit }</td>
				</tr>
			</c:forEach>
		</table>
		<a href="qnawriteview">글쓰기</a>
		<hr />



		<c:if test="${searchVo.page>1 }">
			<a href="qnalist?page=1&sk=${searchKeyword}&all=${all==true?'all':''}
					&qq=${qq==true?'qq':''}&oh=${oh==true?'oh':''}&biz=${biz==true?'biz':''}&qf=${qf==true?'pf':''}&sh=${sh==true?'sh':''}">
					<i class="fa-solid fa-angles-left"></i></a>
			<a href="qnalist?page=${searchVo.page-1 }&sk=${searchKeyword}&all=${all==true?'all':''}
					&qq=${qq==true?'qq':''}&oh=${oh==true?'oh':''}&biz=${biz==true?'biz':''}&qf=${qf==true?'pf':''}&sh=${sh==true?'sh':''}">
					<i class="fa-solid fa-circle-chevron-left"></i></a>
		</c:if>

		<c:forEach begin="${searchVo.pageStart }" end="${searchVo.pageEnd }"
			var="i">
			<c:choose>
				<c:when test="${i eq searchVo.page }">
					<span style="color: gold; font-weight: bold;">${i } &nbsp;</span>
				</c:when>
				<c:otherwise>
					<a href="qnalist?page=${i }&sk=${searchKeyword}&all=${all==true?'all':''}
					&qq=${qq==true?'qq':''}&oh=${oh==true?'oh':''}&biz=${biz==true?'biz':''}&qf=${qf==true?'pf':''}&sh=${sh==true?'sh':''}"
						style="text-decoration: none;">${i }</a> &nbsp;
			</c:otherwise>
			</c:choose>
		</c:forEach>

		<c:if test="${searchVo.page < searchVo.totPage}">
			<a href="qnalist?page=${searchVo.page+1 }&sk=${searchKeyword}&all=${all==true?'all':''}
					&qq=${qq==true?'qq':''}&oh=${oh==true?'oh':''}&biz=${biz==true?'biz':''}&qf=${qf==true?'pf':''}&sh=${sh==true?'sh':''}">
					<i class="fa-solid fa-circle-chevron-right"></i>
			</a>
			
			<a href="qnalist?page=${searchVo.totPage }&sk=${searchKeyword}&all=${all==true?'all':''}
					&qq=${qq==true?'qq':''}&oh=${oh==true?'oh':''}&biz=${biz==true?'biz':''}&qf=${qf==true?'pf':''}&sh=${sh==true?'sh':''}">
					<i class="fa-solid fa-angles-right"></i>
			</a>
		</c:if>


	</form>
	<!-- 푸터 -->
	<footer>
		<!-- 푸터 로고 -->
		<div class="footer_logo">logo</div>
		<!-- 푸터 내용 -->
		<div class="footer_content">(주) 카피바라 주소 : 대한민국 서울시 양천구 목동 655-19
			대표 : 조보근 전화번호 : 010-3017-5283</div>
		<!-- sns 아이콘 -->
		<div class="footer_sns">
			<i class="fab fa-facebook fa-lg"></i> <i class="fab fa-youtube fa-lg"></i>
			<i class="fab fa-twitter fa-lg"></i> <i class="fab fa-twitch fa-lg"></i>
			<i class="fab fa-instagram fa-lg"></i>
		</div>
	</footer>
</body>
</html>