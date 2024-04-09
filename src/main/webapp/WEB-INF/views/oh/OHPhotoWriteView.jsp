<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">

	<title>OH - PhotoWriteView.jsp</title>

	<!-- oh.css -->
	<link rel="stylesheet" href="../resources/css/oh/photo.css?after" />
	<!-- OHPhotoWriteView.css -->
	<link rel="stylesheet" href="../resources/css/oh/OHPhotoWriteView.css?after" />	
	
	<!-- https://fontawesome.com/ -->
	<link  rel="stylesheet"
	  	   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
	  	   
	<!-- https://jquery.com/ -->		
	<script src="https://code.jquery.com/jquery-3.7.1.js" ></script>
	
</head>
<body>

	<h3>OHPhotoWriteView.jsp</h3>

	<!-- 회원, 비회원 구분 후 메세지 출력 -->
	<c:choose>
		<c:when test="${sessionScope.userId ne null && !empty sessionScope.userId }">
			<h3>${sessionScope.userId }님</h3>	
		</c:when>
		<c:otherwise>
			<h3>비회원님</h3>					
		</c:otherwise>
	</c:choose>

	<div class="container">
	
		<header>
			<h1>header</h1>
		</header>
		
		<div class="contents">
		
			<div class="sideBar">
				<ul >
					<li><a href="OHMainView">우리집 자랑하기</a></li>
					<li><a href="OHPhotoView">집사진</a></li>
					<!-- 집영상 -->
					<!-- <li><a href="">집영상</a></li> -->
					<li><a href="">#category</a></li>
				</ul>
			</div>		
			
			<div id="OHPhotoWriteView-main">
		
				<div id="OHPhotoWriteView-main-1">
				
					<div id="OHPhotoWriteView-title">글쓰기</div>
				
				</div>			
				
				<div id="OHPhotoWriteView-main-2">

					<button id="OHPhotoWriteView-photoBoardButton">집사진</button> 
					
                    <!-- 집영상 -->
					<!-- <button id="OHPhotoWriteView-videoBoardButton">집영상</button> -->				    

                </div>
				
				<div id="OHPhotoWriteView-main-3">
				
					<form action="OHPhotoWriteExecute" method="post" enctype="multipart/form-data">
				
						
                        <div id="OHPhotoWriteView-main-sector1">

						    <input id="OHPhotoWriteView-writePostButton" type="submit" value="올리기" />
						
						    <button id="OHPhotoWriteView-cancelPostButton">취소하기</button>

                        </div>						
						
						
						<div id="OHPhotoWriteView-main-sector2">
						
							<div id="OHPhotoWriteView-main-sector2-1">

								<input id="OHPhotoWriteView-fileUploadInput" type="file" name="pa_attach" multiple />
						
							</div>
							
							<div id="OHPhotoWriteView-main-sector2-2">
							
                                <div id="sector2-2-layer1">
                                    <input id="layer1-title" type="text" name="pb_title" placeholder="제목을 입력하세요." />
                                </div>

                                <div id="sector2-2-layer2">
                                    <textarea id="layer2-content" name="pb_content" rows="10" cols="30" placeholder="내용을 입력하세요." ></textarea>
                                </div>								
						
								<div id="sector2-2-layer3">
                                    
                                    <div id="layer3-pb_category-Lable">
                                        #category
                                    </div>
                                    <select name="pb_category" id="layer3-pb_category">
                                        <option value="">선택</option>
                                        <option value="#그냥">#그냥</option>
                                        <option value="#내돈내산">#내돈내산</option>
                                    </select>				
                                    
                                    <div id="layer3-pb_residence-Lable">
										주거형태
                                    </div>
                                    <select name="pb_residence" id="layer3-pb_residence">
                                        <option value="">선택</option>
                                        <option value="원룸&오피스텔">원룸&amp;오피스텔</option>
                                        <option value="아파트">아파트</option>
                                        <option value="빌라&연립">빌라&amp;연립</option>
                                        <option value="단독주택">단독주택</option>
                                        <option value="사무공간">사무공간</option>
                                        <option value="상업공간">상업공간</option>
                                        <option value="기타">기타</option>
                                    </select>					
                                    
                                    <div id="layer3-pb_room-Lable">
										공간
                                    </div>
                                    <select name="pb_room" id="layer3-pb_room">
                                        <option value="">선택</option>
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
                                    
                                    <div id="layer3-pb_style-Lable">
										스타일
                                    </div>
                                    <select name="pb_style" id="layer3-pb_style">
                                        <option value="">선택</option>
                                        <option value="모던">모던</option>
                                        <option value="북유럽">북유럽</option>
                                        <option value="빈티지">빈티지</option>
                                        <option value="내추럴">내추럴</option>
                                        <option value="프로방스&로맨틱">프로방스&amp;로맨틱</option>
                                        <option value="클래식&앤틱">클래식&amp;앤틱</option>
                                        <option value="한국&아시아">한국&amp;아시아</option>
                                        <option value="유니크">유니크</option>
                                    </select>					
                                    
                                    <div id="layer3-pb_skill-Lable">
										셀프/전문가
                                    </div>                                    
                                    <select name="pb_skill" id="layer3-pb_skill">
                                        <option value="">선택</option>
                                        <option value="셀프">셀프</option>
                                        <option value="전문가">전문가</option>
                                    </select>
                                
                                </div>

                            </div>

                        </div>						
							
					</form>
				
				</div>			
		
			</div>
		
		</div>
		
		<footer>
			<h1>footer</h1>
		</footer>
		
	</div>
	
</body>
</html>