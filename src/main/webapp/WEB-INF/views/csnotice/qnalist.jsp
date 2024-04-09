<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/cs/csboard.css" /> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<style>
.fa-solid {
	color: #333;
}

.fa-solid:hover {
	color: gold;
}
</style>
<title>Insert title here</title>
</head>
<body>
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

	<%
	if (session.getAttribute("userId") == null) {
		 session.setAttribute("userId", "cus");
		/* session.removeAttribute("userId"); */
	}
	%>
	<p style="margin: 0;">userId: <%= session.getAttribute("userId") %></p>
	
	<div class="cs_qnaboard_whitespace"> <!--여백--></div>
	
	<section class="cs_list_section1">
		<div class="cs_list_head">
			<h3 class="cs_list_head_h">QnA</h3>
		</div>
	</section>
	
	<div class="cs_qnaboard_whitespace"> <!--여백--></div>

	
	<section class="cs_list_section2">
	<div class="cs_list_wrap_board">
		<div class="cs_list_serch_bar">
			<form action="qnalist" method="post">
<!-- 				<div> -->
					<select name="qnadiv">
					
						<option value="all" ${all eq 'true' ? 'selected' : ''}>전체</option>
						<option value="qq" ${qq eq 'true' ? 'selected' : ''}>퀵견적</option>
						<option value="oh" ${oh eq 'true' ? 'selected' : ''}>우리집 자랑하기</option>
						<option value="biz" ${biz eq 'true' ? 'selected' : ''}>업체 관련</option>
						<option value="pf" ${pf eq 'true' ? 'selected' : ''}>로그인/회원정보</option>
						<option value="sh" ${sh eq 'true' ? 'selected' : ''}>소품샵</option>
						
					</select> 
					<input type="text" name="sk" value="${searchKeyword }" /> 
					<input type="submit" value="검색" />
<!-- 				</div> -->
			</form>
		</div>
		
		<div class="cs_qnaboard_whitespace"> <!--여백--></div>
	
<!-- 		<div class=""> -->
			<table class="cs_list_table">
			<thead class="cs_list_table_thead">
				<tr class="">
					<th class="cs_list_table_th">NO</th>
					<th class="cs_list_table_th">제목</th>
					<th class="cs_list_table_th">이름</th>
					<th class="cs_list_table_th">날짜</th>
					<th class="cs_list_table_th">조회수</th>
				</tr>
			</thead>
			<tbody class="cs_list_table_tbody">
				<c:forEach items="${list }" var="dto">
					<tr class="">
						<td class="">${dto.qbno }</td>
						<td class=""><a href="qnacontent?qbno=${dto.qbno }" class="cs_list_table_title">${dto.qbtitle }</a></td>
						<td class="">${dto.qbwriter }</td>
						<td class=""><fmt:formatDate value="${dto.qbdate}" pattern="yy/MM/dd" /></td>
						<td class="">${dto.qbhit }</td>
					</tr>
				</c:forEach>
			</tbody>
			</table>
<!-- 		</div> -->
		
<div class="cs_qnaboard_whitespace"> <!--여백--></div>
		<div class="cs_list_wrap_writebtn">
			<div class="cs_list_writebtn_loc">
				<% if(session.getAttribute("userId") == null){ %>
				<% } else {%>
					<!--로그인 안 한 상태로는 글 쓰기 버튼 안 보이게 처리-->
				<div class="cs_list_writebtn" onclick="linkwritebtn()">
					<a href="qnawriteview" class="cs_list_writebtn_a">글쓰기</a>
				</div>
				<% } %>
			</div>
		</div>

	</div>
	</section>
		
		
<script> //글쓰기 div 영역 클릭 시에도 작동 하도록 설정
function linkwritebtn() {
	  var link = document.querySelector('.cs_list_writebtn a').href;
	  window.location.href = link;	
}
</script>
		
		
		<div class="cs_qnaboard_whitespace"> <!--여백--></div>
		
		<section class="cs_list_section3">
			<div class="cs_list_wrap_pagenum">

					<a class="cs_list_writebtn_a" href="qnalist?page=1&sk=${searchKeyword}&all=${all==true?'all':''}&qq=${qq==true?'qq':''}&oh=${oh==true?'oh':''}&biz=${biz==true?'biz':''}&qf=${qf==true?'pf':''}&sh=${sh==true?'sh':''}">
							<!-- <i class="fa-solid fa-angles-left"></i> -->
							 << 처음으로</a>
					<a class="cs_list_writebtn_a" href="qnalist?page=${searchVo.page-1 }&sk=${searchKeyword}&all=${all==true?'all':''}&qq=${qq==true?'qq':''}&oh=${oh==true?'oh':''}&biz=${biz==true?'biz':''}&qf=${qf==true?'pf':''}&sh=${sh==true?'sh':''}">
							<!-- <i class="fa-solid fa-circle-chevron-left"></i> -->
							&nbsp;이전</a>

		
				<c:forEach begin="${searchVo.pageStart }" end="${searchVo.pageEnd }" var="i">
					<c:choose>
					
						<c:when test="${i eq searchVo.page }">
							<span style="color: lightskyblue; font-weight: bold;">&nbsp;${i }&nbsp;</span>
						</c:when>
						
						<c:otherwise>
							<a class="cs_list_writebtn_a" href="qnalist?page=${i }&sk=${searchKeyword}&all=${all==true?'all':''} &qq=${qq==true?'qq':''}&oh=${oh==true?'oh':''}&biz=${biz==true?'biz':''}&qf=${qf==true?'pf':''}&sh=${sh==true?'sh':''}">${i }</a> &nbsp;
						</c:otherwise>
					
					</c:choose>
				</c:forEach>
		
					<a class="cs_list_writebtn_a" href="qnalist?page=${searchVo.page+1 }&sk=${searchKeyword}&all=${all==true?'all':''}&qq=${qq==true?'qq':''}&oh=${oh==true?'oh':''}&biz=${biz==true?'biz':''}&qf=${qf==true?'pf':''}&sh=${sh==true?'sh':''}">
							<!-- <i class="fa-solid fa-circle-chevron-right"></i> -->
							다음&nbsp;</a>
					
					<a class="cs_list_writebtn_a" href="qnalist?page=${searchVo.totPage }&sk=${searchKeyword}&all=${all==true?'all':''}&qq=${qq==true?'qq':''}&oh=${oh==true?'oh':''}&biz=${biz==true?'biz':''}&qf=${qf==true?'pf':''}&sh=${sh==true?'sh':''}">
							<!-- <i class="fa-solid fa-angles-right"></i> -->
							끝으로 >></a>
			</div>
		</section>
	
	
	
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