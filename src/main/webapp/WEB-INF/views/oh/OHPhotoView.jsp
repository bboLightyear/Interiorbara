<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>OH - OHPhotoView.jsp</title>
	<link rel="stylesheet" href="../resources/css/oh.css" />	
	<script src="https://code.jquery.com/jquery-3.7.1.js" ></script>
</head>
<body>

	<!-- 데이터 표시 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<h3>OHPhotoDetailView.jsp</h3>
	<table border="1">
		<tr>
			<th colspan="15">OHPhotoBoard</th>
		</tr>
		<tr>
			<th>pb_no</th>
			<th>pb_user</th>
			<th>pb_title</th>
			<th>pb_content</th>
			<th>pb_date</th>
			<th>pb_like</th>
			<th>pb_scrap</th>
			<th>pb_reply</th>
			<th>pb_link</th>
			<th>pb_hit</th>
			<th>pb_category</th>
			<th>pb_residence</th>
			<th>pb_room</th>
			<th>pb_style</th>
			<th>pb_skill</th>
		</tr>
		<c:forEach items="${ohPhotoView }" var="dto">				
			<tr>
				<td>${dto.pb_no }</td>
				<td>${dto.pb_user }</td>
				<td>${dto.pb_title }</td>
				<td>${dto.pb_content }</td>
				<td>${dto.pb_date }</td>
				<td>${dto.pb_like }</td>
				<td>${dto.pb_scrap }</td>
				<td>${dto.pb_reply }</td>
				<td>${dto.pb_link }</td>
				<td>${dto.pb_hit }</td>
				<td>${dto.pb_category }</td>
				<td>${dto.pb_residence }</td>
				<td>${dto.pb_room }</td>
				<td>${dto.pb_style }</td>
				<td>${dto.pb_skill }</td>
			</tr>		
		</c:forEach>			
		<tr>
			<th colspan="15">OHPhotoAttach</th>
		</tr>
		<tr>
			<th>pa_no</th>
			<th>pa_attach</th>
			<th>pb_no</th>
		</tr>
		<c:forEach items="${ohPhotoView }" var="dto">			
			<tr>
				<td>${dto.ohPhotoAttach.pa_no }</td>
				<td>${dto.ohPhotoAttach.pa_attach }</td>
				<td>${dto.ohPhotoAttach.pb_no }</td>
			</tr>
		</c:forEach>			
	</table>
	
	<!-- 데이터 표시 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->	

	<div class="container">
		
		<header>
			<h1>header</h1>
		</header>
		
		<div class="contents">
	
			<div class="sideBar">
				<ul >
					<li><a href="OHMainView">우리집 자랑하기</a></li>
					<li><a href="OHPhotoView">집사진</a></li>
					<li><a href="">집영상</a></li>
					<li><a href="">#category</a></li>
				</ul>
			</div>							
						
			<h3>집사진</h3>
				
			<button><a href="OHPhotoWriteView">글쓰기</a></button>
				
			<hr />				
				
			<form action="OHPhotoView" method="post">
				
				<!-- sorting -->
				<label for="orderingBy">정렬기준</label>
				<select name="orderingBy" id="orderingBy">
					<option value="pb_date">날짜</option>
					<option value="pb_like">좋아요</option>
					<option value="pb_hit">조회수</option>
				</select>
				<label for="orderingMethod">정렬방식</label>
				<select name="orderingMethod" id="orderingMethod">
					<option value="ascending">오름차순</option>
					<option value="descending">내림차순</option>
				</select>
				<!-- sorting End -->
				
				<hr />				
				
				<!-- filtering -->
				<label for="pb_category">#category</label>
				<select name="pb_category" id="pb_category">
					<option value="default">전체</option>
					<option value="#그냥">#그냥</option>
					<option value="#내돈내산">#내돈내산</option>
				</select>				
				<label for="pb_residence">주거형태</label>
				<select name="pb_residence" id="pb_residence">
					<option value="default">전체</option>
					<option value="원룸&오피스텔">원룸&amp;오피스텔</option>
					<option value="아파트">아파트</option>
					<option value="빌라&연립">빌라&amp;연립</option>
					<option value="단독주택">단독주택</option>
					<option value="사무공간">사무공간</option>
					<option value="상업공간">상업공간</option>
					<option value="기타">기타</option>
				</select>				
				<label for="pb_room">공간</label>
				<select name="pb_room" id="pb_room">
					<option value="default">전체</option>
					<option value="원룸">원룸</option>
					<option value="거실">거실</option>
					<option value="침실">침실</option>
					<option value="주방">주방</option>
					<option value="욕실">욕실</option>
					<option value="아이방">아이방</option>
					<option value="드레스룸">드레스룸</option>
					<option value="서재&작업실">서재&amp;작업실</option>
					<option value="베란다">베란다</option>
					<option value="사무공간">사무공간</option>
					<option value="상업공간">상업공간</option>
					<option value="가구&소품">가구&amp;소품</option>
					<option value="현관">현관</option>
					<option value="외관&기타">외관&amp;기타</option>
				</select>								
				<label for="pb_style">스타일</label>
				<select name="pb_style" id="pb_style">
					<option value="default">전체</option>
					<option value="모던">모던</option>
					<option value="북유럽">북유럽</option>
					<option value="빈티지">빈티지</option>
					<option value="내추럴">내추럴</option>
					<option value="프로방스&로맨틱">프로방스&amp;로맨틱</option>
					<option value="클래식&앤틱">클래식&amp;앤틱</option>
					<option value="한국&아시아">한국&amp;아시아</option>
					<option value="유니크">유니크</option>
				</select>								
				<label for="pb_skill">셀프/전문가</label>
				<select name="pb_skill" id="pb_skill">
					<option value="default">전체</option>
					<option value="셀프">셀프</option>
					<option value="전문가">전문가</option>
				</select>								
				<!-- filtering End -->
				
				<hr />					
				
				<!-- searching -->					
				<!-- 검색기준 - select element -->
				<label for="searchingType">검색기준</label>
				<select name="searchingType" id="searchingType">
					<option value="default">전체</option>
					<option value="pb_title">제목</option>
					<option value="pb_content">내용</option>
				</select>					
				<!-- 검색어 - input element -->		
				<input type="text" name="searchingWord" value="${keepSearchingWord }" placeholder="검색어를 입력하세요." />
				<!-- searching End -->
				
				<input type="submit" value="검색" />
			
			</form>
			
			<div class="OHPhotoViewflexContainer">				
				<!-- 전체 <div class="box"> 반복문 사용, 게시물 표현 -->
				<c:forEach items="${ohPhotoView }" var="dto" varStatus="status">
					<div class="box">
						<div>pb_no: ${dto.pb_no }</div>
						<div>pb_user: ${dto.pb_user }</div>	
						<div>pb_title: ${dto.pb_title }</div>	
						<div>pb_content: ${dto.pb_content }</div>
						<div>pb_category: ${dto.pb_category }</div>
						<div>pa_no: ${dto.ohPhotoAttach.pa_no }</div>
						<div>pa_attach: ${dto.ohPhotoAttach.pa_attach }</div>
						<div>pb_no: ${dto.ohPhotoAttach.pb_no }</div>
						<a href="OHPhotoDetailView?pb_no=${dto.pb_no }">
							<img src="../resources/upload/oh/${dto.ohPhotoAttach.pa_attach }" alt="해당 게시글 대표사진" height="300px" width="300px"/>
						</a>
					</div>
				</c:forEach>
			</div>
			
			<hr />
			
			<!-- Paging -->
			
			
			
			
		</div>
			
		<footer>
			<h1>footer</h1>
		</footer>
	</div>	
	
</body>
	<!-- HTML Parsing 순서에 따라 body element 아래에 배치 -->
	<script>
		var keepOrderingBy = "${keepOrderingBy}";
		console.log("keepOrderingBy: " + keepOrderingBy);
		$("#orderingBy").val(keepOrderingBy).prop("selected", true);
		
		var keepOrderingMethod = "${keepOrderingMethod}";
		console.log("keepOrderingMethod: " + keepOrderingMethod);
		$("#orderingMethod").val(keepOrderingMethod).prop("selected", true);
		
		var keepPb_category = "${keepPb_category}";
		console.log("keepPb_category: " + keepPb_category);
		$("#pb_category").val(keepPb_category).prop("selected", true);
		
		var keepPb_residence = "${keepPb_residence}";
		console.log("keepPb_residence: " + keepPb_residence);
		$("#pb_residence").val(keepPb_residence).prop("selected", true);
		
		var keepPb_room = "${keepPb_room}";
		console.log("keepPb_room: " + keepPb_room);
		$("#pb_room").val(keepPb_room).prop("selected", true);
		
		var keepPb_style = "${keepPb_style}";
		console.log("keepPb_style: " + keepPb_style);
		$("#pb_style").val(keepPb_style).prop("selected", true);
		
		var keepPb_skill = "${keepPb_skill}";
		console.log("keepPb_skill: " + keepPb_skill);
		$("#pb_skill").val(keepPb_skill).prop("selected", true);
	
		var keepSearchingType = "${keepSearchingType}";
		console.log("keepSearchingType: " + keepSearchingType);
		$("#searchingType").val(keepSearchingType).prop("selected", true);
		
		var keepSearchingWord = "${keepSearchingWord}";
		console.log("keepSearchingWord: " + keepSearchingWord);
		/* keepSearchingWord 값은  searchingWord에 value 값으로 입력 */
	</script>	
</html>























