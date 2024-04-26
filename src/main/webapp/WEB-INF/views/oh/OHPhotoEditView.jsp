<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>

<html>

<head>

	<meta charset="UTF-8">

	<title>우리 집 자랑하기</title>

	<!-- oh.css -->
	<link rel="stylesheet" href="../resources/css/oh/photo.css?after" />
	<!-- OHPhotoEditView.css -->
	<link rel="stylesheet" href="../resources/css/oh/OHPhotoEditView.css?after" />		
	
	<!-- https://fontawesome.com/ -->
	<link  rel="stylesheet"
	  	   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
	  	   
	<!-- https://jquery.com/ -->		
	<script src="https://code.jquery.com/jquery-3.7.1.js" ></script>

	<!-- ----------------------------------------------------- -->
	
	<!-- header, footer -->
	<link rel="stylesheet" 
		  href="${path}/resources/css/header_footer.css" />
	<link rel="stylesheet" 
	      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

</head>

<body>

<!-- 데이터 표시 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
<%-- 	
	<table border="1">
		<tr>
			<th colspan="15">OHPhotoBoard</th>
		</tr>
		<tr>
			<th>pb_no</th>
			<th>memno</th>
			<th>pb_title</th>
			<th>pb_content</th>
			<th>pb_date</th>
			<th>pb_like</th>
			<th>pb_scrap</th>
			<th>pb_reply</th>
			<th>pb_link</th>
			<th>pb_hit</th>
			<th>pb_residence</th>
			<th>pb_room</th>
			<th>pb_style</th>
			<th>pb_skill</th>
		</tr>
		<tr>
			<td>${pb_dto.pb_no }</td>
			<td>${pb_dto.memno }</td>
			<td>${pb_dto.pb_title }</td>
			<td>${pb_dto.pb_content }</td>
			<td>${pb_dto.pb_date }</td>
			<td>${pb_dto.pb_like }</td>
			<td>${pb_dto.pb_scrap }</td>
			<td>${pb_dto.pb_reply }</td>
			<td>${pb_dto.pb_link }</td>
			<td>${pb_dto.pb_hit }</td>
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
--%>
<%-- 	
	<h3>OHPhotoEditView.jsp</h3>

	<!-- 회원, 비회원 구분 후 메세지 출력 -->
	<c:choose>
		<c:when test="${loginUserDto ne null }">
			<h3>${loginUserDto.nickname }님</h3>	
		</c:when>
		<c:otherwise>
			<h3>비회원님</h3>					
		</c:otherwise>
	</c:choose> 
--%>
<!-- 데이터 표시 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->

	<!-- 게시글 번호 -->
	<input type="hidden" id="pb_no" value=${pb_no } />
	<!-- sorting -->
	<input type="hidden" id="orderingBy" value=${orderingBy } />
	<input type="hidden" id="orderingMethod" value=${orderingMethod } />
	<!-- filtering -->
	<input type="hidden" id="pb_residence" value=${pb_residence } />
	<input type="hidden" id="pb_room" value=${pb_room } />
	<input type="hidden" id="pb_style" value=${pb_style } />
	<input type="hidden" id="pb_skill" value=${pb_skill } />
	<!-- searching -->
	<input type="hidden" id="searchingType" value=${searchingType } />
	<input type="hidden" id="searchingWord" value=${searchingWord } />
	<!-- paging -->
	<input type="hidden" id="pageSelectedNum" value=${pageSelectedNum } />	

	<div class="container">
	
		<!-- header -->
		<%@ include file="header.jsp" %>
		
		<div class="contents">
		
			<div class="sideBar">
				<ul >
					<a href="OHMainView"><li class="sideBar-OHMainView">우리 집 자랑하기</li></a>
					<a href="OHPhotoView"><li class="sideBar-OHPhotoView">집사진</li></a>
					<!-- 집영상 -->
					<!-- <li><a href="">집영상</a></li> -->
					<!-- <li><a href="">#category</a></li> -->
				</ul>
			</div>

			<div id="OHPhotoEditView-main">
		
				<div id="OHPhotoEditView-main-1">
				
					<div id="OHPhotoEditView-title">글수정</div>
				
				</div>					
				
				<!-- <div id="OHPhotoEditView-main-2"> -->

					<!-- 집사진 -->
					<!-- <button id="OHPhotoEditView-photoBoardButton">집사진</button> --> 
					
                    <!-- 집영상 -->
					<!-- <button id="OHPhotoEditView-videoBoardButton">집영상</button> -->				    

                <!-- </div> -->				
			
                <div id="OHPhotoEditView-main-3">			
			
					<form action="OHPhotoEditExecute" onsubmit="return validateForm()" 
						  method="post" enctype="multipart/form-data">
					
						<!-- hidden, pb_no, pa_dto 값 전달 -->
						<input type="hidden" name="pb_no" value="${pb_dto.pb_no }" /> 
				
                        <div id="OHPhotoEditView-main-sector1">

						    <input id="OHPhotoEditView-editPostButton" type="submit" value="수정하기" />
                            
						    <button type="button" id="OHPhotoEditView-cancelPostButton">취소하기</button>

                        </div>					
				
						<div id="OHPhotoEditView-main-sector2">
						
							<div id="OHPhotoEditView-main-sector2-1">

                                <div id="sector2-1-layer1">
                                
	                             	<span id="OHPhotoEditView-fileUploadInput-guide">
										사진을 선택하세요. <br />
										파일개수 - 최소 1개 ~ 최대 10개 <br />
										파일명 길이 - 최소 1자 ~ 최대 25자 <br />
										파일형식 - JPG, JPEG, PNG, GIF 
									</span>
                                
								    <input id="OHPhotoEditView-fileUploadInput" type="file" name="pa_attach" multiple />
								    
                                </div>				

                                <!-- 게시물, 이미지 출력 Start -->
                                <div id="sector2-1-layer2">
                                	<!-- 사진 번호, 초기 값 설정 -->
                                	<c:set var="number" value="1" />
                            		<c:forEach items="${pa_dto }" var="dto">    
	                                    <div class="sector2-1-layer2-uploadImage">
	                                        <div id="uploadImage-numberLable">번호</div>
	                                        <div id="uploadImage-number">${number }</div>
	                                       	<!-- 반복할 때마다 변수 값 증가 -->
	                                       	<c:set var="number" value="${number + 1 }" />
	                                        <div id="uploadImage-nameLable">파일명</div>
	                                        <div id="uploadImage-name">${dto.pa_attach }</div>
											<img id="uploadImage-Image" src="../resources/upload/oh/photo/${dto.pa_attach }" alt="해당 게시글 사진" />                                       					
	                                    </div>
                            		</c:forEach>		                                           
                                </div>
                                <!-- 게시물, 이미지 출력 End -->                                

							</div>				
				
                            <div id="OHPhotoEditView-main-sector2-2">

                                <div id="sector2-2-layer1">
                                    <input id="layer1-title" type="text" maxlength="30" name="pb_title" value="${pb_dto.pb_title }" placeholder="제목을 입력하세요. 최대 30자 까지 작성할 수 있습니다." />
                                </div>

                                <div id="sector2-2-layer2">
                                    <textarea id="layer2-content" maxlength="500" name="pb_content" rows="10" cols="30" placeholder="내용을 입력하세요. &#13;&#10;최대 500자 까지 작성할 수 있습니다." >${pb_dto.pb_content }</textarea>
                                </div>	   				
						
                                <div id="sector2-2-layer3">
                                    
                                    <div id="layer3-pb_residence-Lable">
										주거형태
                                    </div>
                                    <select name="pb_residence" id="layer3-pb_residence">
                                        <option value="">선택</option>
                                        <option value="원룸&오피스텔" <c:if test="${pb_dto.pb_residence eq '원룸&오피스텔'}">selected</c:if>>원룸&amp;오피스텔</option>
                                        <option value="아파트" <c:if test="${pb_dto.pb_residence eq '아파트'}">selected</c:if>>아파트</option>
                                        <option value="빌라&연립" <c:if test="${pb_dto.pb_residence eq '빌라&연립'}">selected</c:if>>빌라&amp;연립</option>
                                        <option value="단독주택" <c:if test="${pb_dto.pb_residence eq '단독주택'}">selected</c:if>>단독주택</option>
                                        <option value="사무공간" <c:if test="${pb_dto.pb_residence eq '사무공간'}">selected</c:if>>사무공간</option>
                                        <option value="상업공간" <c:if test="${pb_dto.pb_residence eq '상업공간'}">selected</c:if>>상업공간</option>
                                        <option value="기타" <c:if test="${pb_dto.pb_residence eq '기타'}">selected</c:if>>기타</option>
                                    </select>					
                                    
                                    <div id="layer3-pb_room-Lable">
										공간
                                    </div>
                                    <select name="pb_room" id="layer3-pb_room">
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
                                    
                                    <div id="layer3-pb_style-Lable">
										스타일
                                    </div>
                                    <select name="pb_style" id="layer3-pb_style">
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

                                    <div id="layer3-pb_skill-Lable">
										셀프/전문가
                                    </div>                                    
                                    <select name="pb_skill" id="layer3-pb_skill">
                                        <option value="">선택</option>
                                        <option value="셀프" <c:if test="${pb_dto.pb_skill eq '셀프'}">selected</c:if>>셀프</option>
                                        <option value="전문가" <c:if test="${pb_dto.pb_skill eq '전문가'}">selected</c:if>>전문가</option>
                                    </select>						
                                </div>
                            </div>
                        </div>
                        
                        <!-- OHPhotoView 검색 설정 값 -->
						<!-- 게시글 번호 -->
						<input type="hidden" name="OPVpb_no" value=${pb_no } />
						<!-- sorting -->
						<input type="hidden" name="OPVorderingBy" value=${orderingBy } />
						<input type="hidden" name="OPVorderingMethod" value=${orderingMethod } />
						<!-- filtering -->
						<input type="hidden" name="OPVpb_residence" value=${pb_residence } />
						<input type="hidden" name="OPVpb_room" value=${pb_room } />
						<input type="hidden" name="OPVpb_style" value=${pb_style } />
						<input type="hidden" name="OPVpb_skill" value=${pb_skill } />
						<!-- searching -->
						<input type="hidden" name="OPVsearchingType" value=${searchingType } />
						<input type="hidden" name="OPVsearchingWord" value=${searchingWord } />
						<!-- paging -->
						<input type="hidden" name="OPVpageSelectedNum" value=${pageSelectedNum } />	                        
                        
					</form>	
                </div>
            </div>
		</div>							
		
		<!-- footer -->
		<%@ include file="footer.jsp" %>
		
	</div>	
	
	<!-- OHPhotoEditView.js -->
	<script src="../resources/js/oh/OHPhotoEditView.js"></script>	
	
</body>
</html>