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
<%@include file ="header.jsp" %>

<body>
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
	

		<table class="cs_list_table">
		    <thead class="cs_list_table_thead">
		        <tr>
		            <th class="cs_list_table_th cs_list_table_th_no">NO</th>
		            <th class="cs_list_table_th cs_list_table_th_title">제목</th>
		            <th class="cs_list_table_th cs_list_table_th_name">이름</th>
		            <th class="cs_list_table_th cs_list_table_th_date">날짜</th>
		            <th class="cs_list_table_th cs_list_table_th_hits">조회수</th>
		        </tr>
		    </thead>
		    <tbody class="cs_list_table_tbody">
		        <c:forEach items="${list }" var="dto">
		            <tr>
		                <td class="cs_list_table_th_no">${dto.qbno}</td>
		                <td class="cs_list_table_th_title"><a href="qnacontent?qbno=${dto.qbno }" class="cs_list_table_title">${dto.qbtitle}</a></td>
		                <td class="cs_list_table_th_name">${dto.qbwriter}</td>
		                <td class="cs_list_table_th_date"><fmt:formatDate value="${dto.qbdate}" pattern="yy/MM/dd" /></td>
		                <td class="cs_list_table_th_hits">${dto.qbhit}</td>
		            </tr>
		        </c:forEach>
		    </tbody>
		</table>

		
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
							<span style="color: #1034a6; font-weight: bold;">&nbsp;${i }&nbsp;</span>
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
	
<%@include file ="footer.jsp" %>
</body>
</html>