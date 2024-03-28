<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>OH - OHPhotoEditView.jsp</title>
	<link rel="stylesheet" href="../resources/css/oh.css" />	
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
		<tr>
			<td>${pb_dto.pb_no }</td>
			<td>${pb_dto.pb_user }</td>
			<td>${pb_dto.pb_title }</td>
			<td>${pb_dto.pb_content }</td>
			<td>${pb_dto.pb_date }</td>
			<td>${pb_dto.pb_like }</td>
			<td>${pb_dto.pb_scrap }</td>
			<td>${pb_dto.pb_reply }</td>
			<td>${pb_dto.pb_link }</td>
			<td>${pb_dto.pb_hit }</td>
			<td>${pb_dto.pb_category }</td>
			<td>${pb_dto.pb_residence }</td>
			<td>${pb_dto.pb_room }</td>
			<td>${pb_dto.pb_style }</td>
			<td>${pb_dto.pb_skill }</td>
		</tr>		
		<tr>
			<th colspan="15">OHPhotoAttach</th>
		</tr>
		<tr>
			<th>pa_no</th>
			<th>pa_attach</th>
			<th>pb_no</th>
		</tr>
		<c:forEach items="${pa_dto }" var="dto">			
			<tr>
				<td>${dto.pa_no }</td>
				<td>${dto.pa_attach }</td>
				<td>${dto.pb_no }</td>
			</tr>
		</c:forEach>			
	</table>
	
	<!-- 데이터 표시 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

	<!-- 	
		<div class="contents" id="abb" data-abc="111">
		<div class="list" data-abc="111">
		<div class="list" data-abc="654">
		<div class="list" data-abc="56">
		<div class="list" data-abc="1171">
		<div class="list" data-abc="11761">
		<script>
			var list = document.getElementsByClass("list");
			for (list f)
				f.dataset.abc;
			var el = document.getElementById("abb");
			var aa = el.dataset.abc;
			console.log(aa);
		</script>	 
	-->

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
				<h3>OHPhotoEditView.jsp</h3>
				
				<h3>글수정</h3>			
					
			<hr />			
			
			<button>집사진</button> 
			
			<br />
			
			<button>집영상</button>
			
			<form action="OHPhotoEditExecute" method="post" enctype="multipart/form-data">
				<!-- hidden, pb_no, pa_dto 값 전달 -->
				<input type="hidden" name="pb_no" value="${pb_dto.pb_no }" /> 
				
				<input type="submit" value="수정하기" />
				
				&nbsp;&nbsp;&nbsp;
				
				<button><a href="OHPhotoDetailView?pb_no=${pb_dto.pb_no }">취소하기</a></button>				
				
				<hr />
				
				<input type="file" name="pa_attach" multiple />
				
				<hr />
				
				<table>
					<tr>
						<td>제목</td>
						<td>
							<input type="text" name="pb_title" value="${pb_dto.pb_title }" />
						</td>
					</tr>
					<tr>
						<td>내용</td>
						<td>
							<textarea name="pb_content" rows="10" cols="30" >${pb_dto.pb_content }</textarea>
						</td>
					</tr>					
				</table>
				
				<label for="pb_category">#category</label>
				<select name="pb_category" id="pb_category">
					<option value=""  >선택</option>
					<option value="#그냥" <c:if test="${pb_dto.pb_category eq '#그냥'}">selected</c:if>>#그냥</option>
					<option value="#내돈내산" <c:if test="${pb_dto.pb_category eq '#내돈내산'}">selected</c:if>>#내돈내산</option>
				</select>				
				
				<label for="pb_residence">주거형태</label>
				<select name="pb_residence" id="pb_residence">
					<option value="">선택</option>
					<option value="원룸&오피스텔" <c:if test="${pb_dto.pb_residence eq '원룸&오피스텔'}">selected</c:if>>원룸&amp;오피스텔</option>
					<option value="아파트" <c:if test="${pb_dto.pb_residence eq '아파트'}">selected</c:if>>아파트</option>
					<option value="빌라&연립" <c:if test="${pb_dto.pb_residence eq '빌라&연립'}">selected</c:if>>빌라&amp;연립</option>
					<option value="단독주택" <c:if test="${pb_dto.pb_residence eq '단독주택'}">selected</c:if>>단독주택</option>
					<option value="사무공간" <c:if test="${pb_dto.pb_residence eq '사무공간'}">selected</c:if>>사무공간</option>
					<option value="상업공간" <c:if test="${pb_dto.pb_residence eq '상업공간'}">selected</c:if>>상업공간</option>
					<option value="기타" <c:if test="${pb_dto.pb_residence eq '기타'}">selected</c:if>>기타</option>
				</select>					
				
				<label for="pb_room">공간</label>
				<select name="pb_room" id="pb_room">
					<option value="">선택</option>
					<option value="원룸" <c:if test="${pb_dto.pb_room eq '원룸'}">selected</c:if>>원룸</option>
					<option value="거실" <c:if test="${pb_dto.pb_room eq '거실'}">selected</c:if>>거실</option>
					<option value="침실" <c:if test="${pb_dto.pb_room eq '침실'}">selected</c:if>>침실</option>
					<option value="주방" <c:if test="${pb_dto.pb_room eq '주방'}">selected</c:if>>주방</option>
					<option value="욕실" <c:if test="${pb_dto.pb_room eq '욕실'}">selected</c:if>>욕실</option>
					<option value="아이방" <c:if test="${pb_dto.pb_room eq '아이방'}">selected</c:if>>아이방</option>
					<option value="드레스룸" <c:if test="${pb_dto.pb_room eq '드레스룸'}">selected</c:if>>드레스룸</option>
					<option value="서재&작업실" <c:if test="${pb_dto.pb_room eq '서재&작업실'}">selected</c:if>>서재&amp;작업실</option>
					<option value="베란다" <c:if test="${pb_dto.pb_room eq '베란다'}">selected</c:if>>베란다</option>
					<option value="사무공간" <c:if test="${pb_dto.pb_room eq '사무공간'}">selected</c:if>>사무공간</option>
					<option value="상업공간" <c:if test="${pb_dto.pb_room eq '상업공간'}">selected</c:if>>상업공간</option>
					<option value="가구&소품" <c:if test="${pb_dto.pb_room eq '가구&소품'}">selected</c:if>>가구&amp;소품</option>
					<option value="현관" <c:if test="${pb_dto.pb_room eq '현관'}">selected</c:if>>현관</option>
					<option value="외관&기타" <c:if test="${pb_dto.pb_room eq '외관&기타'}">selected</c:if>>외관&amp;기타</option>
				</select>					
				
				<label for="pb_style">스타일</label>
				<select name="pb_style" id="pb_style">
					<option value="">선택</option>
					<option value="모던" <c:if test="${pb_dto.pb_style eq '모던'}">selected</c:if>>모던</option>
					<option value="북유럽" <c:if test="${pb_dto.pb_style eq '북유럽'}">selected</c:if>>북유럽</option>
					<option value="빈티지" <c:if test="${pb_dto.pb_style eq '빈티지'}">selected</c:if>>빈티지</option>
					<option value="내추럴" <c:if test="${pb_dto.pb_style eq '내추럴'}">selected</c:if>>내추럴</option>
					<option value="프로방스&로맨틱" <c:if test="${pb_dto.pb_style eq '프로방스&로맨틱'}">selected</c:if>>프로방스&amp;로맨틱</option>
					<option value="클래식&앤틱" <c:if test="${pb_dto.pb_style eq '클래식&앤틱'}">selected</c:if>>클래식&amp;앤틱</option>
					<option value="한국&아시아" <c:if test="${pb_dto.pb_style eq '한국&아시아'}">selected</c:if>>한국&amp;아시아</option>
					<option value="유니크" <c:if test="${pb_dto.pb_style eq '유니크'}">selected</c:if>>유니크</option>
				</select>					
				
				<label for="pb_skill">셀프/전문가</label>
				<select name="pb_skill" id="pb_skill">
					<option value="">선택</option>
					<option value="셀프" <c:if test="${pb_dto.pb_skill eq '셀프'}">selected</c:if>>셀프</option>
					<option value="전문가" <c:if test="${pb_dto.pb_skill eq '전문가'}">selected</c:if>>전문가</option>
				</select>	
				
			</form>	
			
			
			<hr />				
			
			<!-- 게시물, 이미지 출력 Start -->
			<c:forEach items="${pa_dto }" var="dto">			
				<div>
					<div>pa_no: ${dto.pa_no }</div>
					<div>pa_attach: ${dto.pa_attach }</div>
					<div>pb_no: ${dto.pb_no }</div>
					<img src="../resources/upload/oh/${dto.pa_attach }" alt="해당 게시글 사진" height="300px" width="300px"/>					
				</div>
			</c:forEach>		
			<!-- 게시물, 이미지 출력 End -->							
			
			<hr />			
									
		</div>
		
		<footer>
			<h1>footer</h1>
		</footer>
		
	</div>	
	
</body>
</html>