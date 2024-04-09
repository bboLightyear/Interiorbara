<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	
	<meta charset="UTF-8">	
	
	<title>OH - OHPhotoView.jsp</title>
	
	<!-- photo.css -->
	<link rel="stylesheet" href="../resources/css/oh/photo.css?after" />
	<!-- OHPhotoView.css -->
	<link rel="stylesheet" href="../resources/css/oh/OHPhotoView.css?after" />
	
	<!-- https://fontawesome.com/ -->
	<link  rel="stylesheet"
	  	   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
	  	   
	<!-- https://jquery.com/ -->		
	<script src="https://code.jquery.com/jquery-3.7.1.js" ></script>
	
</head>
<body>

	<!-- 데이터 표시 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<table border="1">
		<tr>
			<th colspan="16">OHPhotoBoard</th>
		</tr>
		<tr>
			<th>no</th>
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
				<td>${dto.no }</td>
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
			<th colspan="3">OHPhotoAttach</th>
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
		<tr>
			<th colspan="4">Post Information</th>
		</tr>
		<tr>
			<th>outputPostCount</th>
			<th>postTotalNum</th>
			<th>postStartNum</th>
			<th>postEndNum</th>
		</tr>
		<tr>
			<td>${ohPageVO.outputPostCount }</td>
			<td>${ohPageVO.postTotalNum }</td>
			<td>${ohPageVO.postStartNum }</td>
			<td>${ohPageVO.postEndNum }</td>		
		</tr>
		<tr>
			<th colspan="5">Page Information</th>
		</tr>
		<tr>
			<th>groupPageCount</th>
			<th>pageTotalNum</th>
			<th>pageSelectedNum</th>
			<th>pageStartNum</th>
			<th>pageEndNum</th>
		</tr>	
		<tr>
			<td>${ohPageVO.groupPageCount }</td>
			<td>${ohPageVO.pageTotalNum }</td>
			<td>${ohPageVO.pageSelectedNum }</td>
			<td>${ohPageVO.pageStartNum }</td>
			<td>${ohPageVO.pageEndNum }</td>
		</tr>							
	</table>
	<!-- 데이터 표시 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->	

	<h3>OHMainView.jsp</h3>

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
					<!-- <li><a href="#">집영상</a></li> -->
					<li><a href="#">#category</a></li>
				</ul>
			</div>							
						
			<div id="OHPhotoView-main">
						
				<div id="OHPhotoView-main-1">		
					<div id="OHPhotoView-title">집사진</div>					
					<!-- jQuery 작성완료
						     회원: 글쓰기 가능 
						  비회원: 글쓰기 불가능
						  -->
					<button id="OHPhotoView-toWriteButton">글쓰기</button> 
				</div>
						
				<div id="OHPhotoView-main-2">
					<form action="OHPhotoView" method="post">
						<!-- Start: sorting -->
						<div id="OHPhotoView-main-2-sorting">
							<div id="OHPhotoView-main-2-sorting-title">
								정렬
							</div>
                            <div id="OHPhotoView-main-2-sorting-orderingBy-lable">
								정렬기준
                            </div>							
							<select name="orderingBy" id="OHPhotoView-main-2-sorting-orderingBy">
								<option value="pb_date">날짜</option>
								<option value="pb_like">좋아요</option>
								<option value="pb_hit">조회수</option>
							</select>
                            <div id="OHPhotoView-main-2-sorting-orderingMethod-lable">
								정렬방식
                            </div>							
							<select name="orderingMethod" id="OHPhotoView-main-2-sorting-orderingMethod">
								<option value="desc">내림차순</option>
								<option value="asc">오름차순</option>
							</select>
						</div>
						<!-- End: sorting -->
						<!-- Start: filtering -->
						<div id="OHPhotoView-main-2-filtering">
                            <div id="OHPhotoView-main-2-filtering-title">
								필터
                            </div>						
                            <div id="OHPhotoView-main-2-filtering-pb_category-lable">
                                #category
                            </div>										
							<select name="pb_category" id="OHPhotoView-main-2-filtering-pb_category">
								<option value="default">전체</option>
								<option value="#그냥">#그냥</option>
								<option value="#내돈내산">#내돈내산</option>
							</select>	
                            <div id="OHPhotoView-main-2-filtering-pb_residence-lable">
								주거형태
                            </div>							
							<select name="pb_residence" id="OHPhotoView-main-2-filtering-pb_residence">
								<option value="default">전체</option>
								<option value="원룸&오피스텔">원룸&amp;오피스텔</option>
								<option value="아파트">아파트</option>
								<option value="빌라&연립">빌라&amp;연립</option>
								<option value="단독주택">단독주택</option>
								<option value="사무공간">사무공간</option>
								<option value="상업공간">상업공간</option>
								<option value="기타">기타</option>
							</select>				
                            <div id="OHPhotoView-main-2-filtering-pb_room-lable">
								공간
                            </div>							
							<select name="pb_room" id="OHPhotoView-main-2-filtering-pb_room">
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
                            <div id="OHPhotoView-main-2-filtering-pb_style-lable">
								스타일
                            </div>													
							<select name="pb_style" id="OHPhotoView-main-2-filtering-pb_style">
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
                            <div id="OHPhotoView-main-2-filtering-pb_skill-lable">
								셀프/전문가
                            </div>							
							<select name="pb_skill" id="OHPhotoView-main-2-filtering-pb_skill">
								<option value="default">전체</option>
								<option value="셀프">셀프</option>
								<option value="전문가">전문가</option>
							</select>								
						</div>
						<!-- End: filtering -->
						<!-- Start: searching -->					
						<div id="OHPhotoView-main-2-searching">	
                            <div id="OHPhotoView-main-2-searching-title">
								검색
                            </div>						
							<!-- 검색기준 - select element -->
                            <div id="OHPhotoView-main-2-searching-searchingType-lable">
								검색기준
                            </div>								
							<select name="searchingType" id="OHPhotoView-main-2-searching-searchingType">
								<option value="default">전체</option>
								<option value="pb_title">제목</option>
								<option value="pb_content">내용</option>
							</select>					
							<!-- 검색어 - input element -->		
							<input type="text" name="searchingWord" id="OHPhotoView-main-2-searching-searchingWord" value="${keepSearchingWord }" placeholder="검색어를 입력하세요." />
							<!-- 검색버튼 -->
							<input id="OHPhotoView-main-2-searching-searchingButton" type="submit" value="검색" />
						</div>
						<!-- End: searching -->
						<!-- Start: paging -->	
						<div id="OHPhotoView-main-2-paging">
                            <div id="OHPhotoView-main-2-paging-postCount">
                                <span id="OHPhotoView-main-2-paging-postCount-lable">
									검색된 게시글
                                </span>
                                <span id="OHPhotoView-main-2-paging-postCount-number">
									${ohPageVO.postTotalNum }개
                                </span>
                            </div>
                            <div id="OHPhotoView-main-2-paging-pageCount">
                                <span id="OHPhotoView-main-2-paging-pageCount-selectedPage">
									현재 페이지
                                </span>
                                <span id="OHPhotoView-main-2-paging-pageCount-selectedPage-number">
                                	${ohPageVO.pageSelectedNum }
                                </span>
                                <span id="OHPhotoView-main-2-paging-pageCount-separator">
                                    /
                                </span>                                
                                <span id="OHPhotoView-main-2-paging-pageCount-allPage">
									전체 페이지
                                </span>
                                <span id="OHPhotoView-main-2-paging-pageCount-allPage-number">
                                    ${ohPageVO.pageTotalNum }
                                </span>
                            </div>	
						</div>
						<!-- End: paging -->		
					</form>
				</div>
				
                <div id="OHPhotoView-main-3">				
				
					<div class="OHPhotoView-flexContainer">
									
						<!-- 반복문 사용, 게시물 표현 -->
						<c:forEach items="${ohPhotoView }" var="dto" varStatus="status">
						
							<div class="OHPhotoView-box">
								
	                            <div class="OHPhotoView-boxLayer-1">
	                                <div id="OHPhotoView-photoProfileImage">프로필 이미지</div>
	                                <div id="OHMainView-photoUserName">${dto.pb_user }</div>
	                                <div id="OHMainView-photoTitle">${dto.pb_title }</div>
	                            </div>								
								
	                            <div class="OHPhotoView-boxLayer-2">
									<!-- 이미지 클릭 => 게시물 상세보기 --> 
									<a href="OHPhotoDetailView?pb_no=${dto.pb_no }">
		                                <img id="OHPhotoView-photoImage" src="../resources/upload/oh/photo/${dto.ohPhotoAttach.pa_attach }" alt="해당 게시글 대표사진">
									</a>								
	                            </div>								
								
	                            <div class="OHPhotoView-boxLayer-3">                    
									<!-- 좋아요, 이미지 -->
									<c:set var="likeLoopFlag" value="false" />
									<c:forEach items="${ohPhotoLike }" var="like" varStatus="status">
										<c:if test="${not likeLoopFlag }">
											<c:if test="${dto.pb_no eq like.pb_no }">
												<span class="OHPhotoView-likeImage clickColor" id="${dto.pb_no }">
													<i class="fa-solid fa-heart"></i>
												</span>
												<c:set var="likeLoopFlag" value="true" />								
											</c:if>							
										</c:if>
									</c:forEach>
									<c:if test="${likeLoopFlag eq false }">
										<span class="OHPhotoView-likeImage" id="${dto.pb_no }">
											<i class="fa-regular fa-heart"></i>
										</span>						
									</c:if>
									<!-- 좋아요, 이미지 End -->		                                
	                                	                                
									<!-- 좋아요, 숫자 -->
									<span class="OHPhotoView-likeNumber" id="${dto.pb_no }">${dto.pb_like }</span>
									<!-- 좋아요, 숫자 End -->	                                
	                                
									<!-- 스크랩, 이미지 -->
									<c:set var="scrapLoopFlag" value="false" />
									<c:forEach items="${ohPhotoScrap }" var="scrap" varStatus="status">
										<c:if test="${not scrapLoopFlag }">
											<c:if test="${dto.pb_no eq scrap.pb_no }">
												<span class="OHPhotoView-scrapImage clickColor" id="${dto.pb_no }">
													<i class="fa-solid fa-bookmark"></i>
												</span>
												<c:set var="scrapLoopFlag" value="true" />
											</c:if>
										</c:if>
									</c:forEach>
									<c:if test="${scrapLoopFlag eq false }">
										<span class="OHPhotoView-scrapImage" id="${dto.pb_no }">
											<i class="fa-regular fa-bookmark"></i>
										</span>
									</c:if>
									<!-- 스크랩, 이미지 End -->	                                
	                                
									<!-- 스크랩, 숫자 -->
									<span class="OHPhotoView-scrapNumber" id="${dto.pb_no }">${dto.pb_scrap }</span>
									<!-- 스크랩, 숫자 End -->	                                
	                                
	                                <!-- 댓글, 이미지 -->
	                                <img class="OHPhotoView-replyImage" src="" alt="댓글">
	                                
	                                <!-- 댓글, 숫자 -->
	                                <div class="OHPhotoView-replyNumber">1000</div>
	                                
	                                <div id="OHPhotoView-photoHit">조회수</div>
	                                <div id="OHPhotoView-photoHitCount">${dto.pb_hit }</div>
	                                <div id="OHPhotoView-photoCategory">${dto.pb_category }</div>
	                                <div id="OHPhotoView-photoContent">${dto.pb_content }</div>
	                            </div>
	                            
							</div>
							
						</c:forEach>
						
					</div>
				
				</div>
				
				<div id="OHPhotoView-main-4">
					
					<!-- Paging -->
					<form action="OHPhotoView" id="pageForm" method="post">
						<c:if test="${ohPageVO.pageSelectedNum > 1 }">
							<!-- 첫번째 페이지로 이동 -->	                    
							<a href="#" onclick="firstPage()" id="firstPage"><i class="fa-solid fa-angles-left"></i></a>
							<!-- 이전 페이지로 이동 -->
							<a href="#" onclick="beforePage()" id="beforePage"><i class="fa-solid fa-circle-chevron-left"></i></a>
						</c:if>			
						<c:forEach begin="${ohPageVO.pageStartNum }" end="${ohPageVO.pageEndNum }" var="i">
							<c:choose>
								<c:when test="${i eq ohPageVO.pageSelectedNum }">
									<span style="color:red; font-weight:bold;">${i } &nbsp;</span>
								</c:when>
								<c:otherwise>
									<a href="#" onclick="movePage(${i })" >${i }</a>&nbsp;
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${ohPageVO.pageTotalNum > ohPageVO.pageSelectedNum }">
							<!-- 다음 페이지로 이동 -->
							<a href="#" onclick="nextPage()" id="nextPage"><i class="fa-solid fa-arrow-right"></i></a>
							<!-- 마지막 페이지로 이동 -->					
							<a href="#" onclick="lastPage()" id="lastPage"><i class="fa-solid fa-poo"></i></a>					                               					
						</c:if>
						<!-- hidden, value 전달 -->
						<input type="hidden" name="orderingBy" value=${keepOrderingBy } />
						<input type="hidden" name="orderingMethod" value=${keepOrderingMethod } />
						<input type="hidden" name="pb_category" value=${keepPb_category } />
						<input type="hidden" name="pb_residence" value=${keepPb_residence } />
						<input type="hidden" name="pb_room" value=${keepPb_room } />
						<input type="hidden" name="pb_style" value=${keepPb_style } />
						<input type="hidden" name="pb_skill" value=${keepPb_skill } />
						<input type="hidden" name="searchingType" value=${keepSearchingType } />
						<input type="hidden" name="searchingWord" value=${keepSearchingWord } />
						<input type="hidden" id="transPage"/>
					</form>
			
				</div>				
			
			</div>
			
		</div>
		
		<footer>
			<h1>footer</h1>
		</footer>
		
	</div>	
	
</body>

	<script>
	
		<!-- HTML Parsing 순서에 따라 body element 아래에 배치 -->
		
		$(document).ready(function() {
			$("OHPhotoView-toWriteButton").click(function() {
				/* 회원인지 확인 */
				if("${sessionScope.userId }" != null && "${sessionScope.userId }" != "") {	
					window.location.href = "OHPhotoWriteView";
				} else {
					alert("로그인 페이지로 이동");
				}
			});
		});			
		
		/* 변수 선언 - (정렬, 필터, 검색) 값 저장 */
		var keepOrderingBy = "${keepOrderingBy}";		
		var keepOrderingMethod = "${keepOrderingMethod}";		
		var keepPb_category = "${keepPb_category}";		
		var keepPb_residence = "${keepPb_residence}";		
		var keepPb_room = "${keepPb_room}";
		var keepPb_style = "${keepPb_style}";
		var keepPb_skill = "${keepPb_skill}";
		var keepSearchingType = "${keepSearchingType}";		
		var keepSearchingWord = "${keepSearchingWord}";
		
		/* 콘솔, 값 출력 */
		console.log("keepOrderingBy: " + keepOrderingBy);
		console.log("keepOrderingMethod: " + keepOrderingMethod);
		console.log("keepPb_category: " + keepPb_category);
		console.log("keepPb_residence: " + keepPb_residence);
		console.log("keepPb_room: " + keepPb_room);
		console.log("keepPb_style: " + keepPb_style);
		console.log("keepPb_skill: " + keepPb_skill);
		console.log("keepSearchingType: " + keepSearchingType);
		console.log("keepSearchingWord: " + keepSearchingWord);
		
		/* $(document).ready(function() {}); => 페이지가 로드된 후에 jQuery 실행 */
		$(document).ready(function() {
			$("#OHPhotoView-main-2-sorting-orderingBy").val(keepOrderingBy).prop("selected", true);
			$("#OHPhotoView-main-2-sorting-orderingMethod").val(keepOrderingMethod).prop("selected", true);
			$("#pb_category").val(keepPb_category).prop("selected", true);
			$("#pb_residence").val(keepPb_residence).prop("selected", true);
			$("#pb_room").val(keepPb_room).prop("selected", true);
			$("#pb_style").val(keepPb_style).prop("selected", true);
			$("#pb_skill").val(keepPb_skill).prop("selected", true);
			$("#searchingType").val(keepSearchingType).prop("selected", true);
			/* keepSearchingWord 값은  searchingWord에 value 값으로 입력 */
		});
		
		// 처음 페이지로 이동하는 함수
		function firstPage() {
				var inputHidden = $('<input>', {
				type: 'hidden',
				name: 'pageSelectedNum',
				value: '1'
			}); 
			$("#transPage").after(inputHidden);
			document.getElementById("pageForm").submit();
		};				
		// 이전 페이지로 이동하는 함수
		function beforePage() {
				var inputHidden = $('<input>', {
				type: 'hidden',
				name: 'pageSelectedNum',
				value: '${ohPageVO.pageSelectedNum - 1}'
			}); 
			$("#transPage").after(inputHidden);
			document.getElementById("pageForm").submit();
		};				
		// 원하는 페이지로 이동하는 함수
		function movePage(num) {
			var pageNum = num
			var inputHidden = $('<input>', {
				type: 'hidden',
				name: 'pageSelectedNum',
				value: pageNum
			});
			$("#transPage").after(inputHidden);
			document.getElementById("pageForm").submit();
		}
		// 다음 페이지로 이동하는 함수
		function nextPage() {						
				var inputHidden = $('<input>', {
				type: 'hidden',
				name: 'pageSelectedNum',
				value: '${ohPageVO.pageSelectedNum + 1}'
			}); 
			$("#transPage").after(inputHidden);
			document.getElementById("pageForm").submit();
		};
		// 마지막 페이지로 이동하는 함수
		function lastPage() {
				var inputHidden = $('<input>', {
				type: 'hidden',
				name: 'pageSelectedNum',
				value: '${ohPageVO.pageTotalNum}'
			}); 
			$("#transPage").after(inputHidden);
			document.getElementById("pageForm").submit();
		};		
		
		$(document).ready(function() {
			$(".likeImage").click(function() {
				/* 회원인지 확인 */						
				if("${sessionScope.userId }" != null && "${sessionScope.userId }" != "") {		
					// 사용자 id 값을 가져와 변수에 저장
					var userId = "${sessionScope.userId }"
					// userId 변수에 저장된 id 값 출력
					console.log("userId: ", userId);
					// 클릭한 하트 요소의 id 값을 가져와 변수에 저장
					var clickedId = $(this).attr("id");
					// clickedId 변수에 저장된 id 값 출력
					console.log("clickedId: ", clickedId);
					// 클릭 => 하트 색상변경
					$(this).toggleClass("clickColor");
					// 클릭한 요소의 하위 태그에서 i태그를 찾아서 icon 변수에 저장 
					var icon = $(this).find("i");
					// if 조건문, 기본 하트 모양 => True
					if(icon.hasClass("fa-regular")) {
						// <i> 요소의 클래스 변경 => 하트 모양변경 
						icon.removeClass("fa-regular").addClass("fa-solid");
						// ajax 요청 보내기
						$.ajax({
							url: "OHPhotoLikeExecute",
							method: "post",
							dataType: "json",
							data: {
								// 전송할 데이터
								'userId' : userId,
								'pb_no' : clickedId
							},
							success: function(response) {
				                // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
				            	console.log("AJAX 요청 성공");
				                // 서버에서 받은 게시물의 좋아요 횟수, 변수에 저장
				                var responseLikeNumber = response.likeNumber;
				                // responseLikeNumber 변수, 콘솔 출력
				            	console.log("서버에서 받은 게시물의 좋아요 횟수: ", responseLikeNumber);
				            	// [중요] 선택자를 이용해 요소 지정할 때 id, class 순서로 지정한다. 그 반대는 선택하지 못한다.
				            	var likeNumberSelector = "#" + clickedId + ".likeNumber";
				            	// likeNumberSelector 변수, 콘솔 출력
				            	console.log("likeNumberSelector: ", likeNumberSelector);
				            	// 서버에서 받은 게시물의 좋아요 횟수 => 숫자 갱신 
				                $(likeNumberSelector).text(responseLikeNumber);
							},
							error: function(xhr, status, error) {
				                // AJAX 요청 실패 시 실행할 코드
				                console.error("AJAX 요청 실패:", status, error);										
							}
						});
					} else {
						// <i> 요소의 클래스 변경 => 하트 모양변경 
						icon.removeClass("fa-solid").addClass("fa-regular");
						// ajax 요청 보내기
						$.ajax({
							url: "OHPhotoLikeExecute",
							method: "post",
							dataType: "json",
							data: {
								// 전송할 데이터
								'userId' : userId,
								'pb_no' : clickedId
							},
							success: function(response) {
				                // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
				            	console.log("AJAX 요청 성공");		
				                // 서버에서 받은 게시물의 좋아요 횟수, 변수에 저장
				                var responseLikeNumber = response.likeNumber;
				                // responseLikeNumber 변수, 콘솔 출력
				            	console.log("서버에서 받은 게시물의 좋아요 횟수: ", responseLikeNumber);
				            	// [중요] 선택자를 이용해 요소 지정할 때 id, class 순서로 지정한다. 그 반대는 선택하지 못한다.
				            	var likeNumberSelector = "#" + clickedId + ".likeNumber";
				            	// likeNumberSelector 변수, 콘솔 출력
				            	console.log("likeNumberSelector: ", likeNumberSelector);
				            	// 서버에서 받은 게시물의 좋아요 횟수 => 숫자 갱신 
				                $(likeNumberSelector).text(responseLikeNumber);						                
							},
							error: function(xhr, status, error) {
				                // AJAX 요청 실패 시 실행할 코드
				                console.error("AJAX 요청 실패:", status, error);										
							}
						});								
					}
				} else {
					// 비회원 => 좋아요 누를 경우
					alert("회원만 가능, 로그인 페이지로 이동");
				}	
			});
		});
		
		$(document).ready(function() {
			$(".scrapImage").click(function() {
				/* 회원인지 확인 */						
				if("${sessionScope.userId }" != null && "${sessionScope.userId }" != "") {		
					// 사용자 id 값을 가져와 변수에 저장
					var userId = "${sessionScope.userId }";
					// userId 변수에 저장된 id 값 출력
					console.log("userId: ", userId);
					// 클릭한 스크랩 요소의 id 값을 가져와 변수에 저장
					var clickedId = $(this).attr("id");
					// clickedId 변수에 저장된 id 값 출력
					console.log("clickedId: ", clickedId);
					// 클릭 => 스크랩 색상변경
					$(this).toggleClass("clickColor");
					// 클릭한 요소의 하위 태그에서 i태그를 찾아서 icon 변수에 저장 
					var icon = $(this).find("i");
					// if 조건문, 기본 스크랩 모양 => True
					if(icon.hasClass("fa-regular")) {
						// <i> 요소의 클래스 변경 => 스크랩 모양변경 
						icon.removeClass("fa-regular").addClass("fa-solid");
						// ajax 요청 보내기
						$.ajax({
							url: "OHPhotoScrapExecute",
							method: "post",
							dataType: "json",
							data: {
								// 전송할 데이터
								'userId' : userId,
								'pb_no' : clickedId
							},
							success: function(response) {
				                // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
				            	console.log("AJAX 요청 성공");
				                // 서버에서 받은 게시물의 스크랩 횟수, 변수에 저장
				                var responseScrapNumber = response.scrapNumber;
				                // responseScrapNumber 변수, 콘솔 출력
				            	console.log("서버에서 받은 게시물의 좋아요 횟수: ", responseScrapNumber);
				            	// [중요] 선택자를 이용해 요소 지정할 때 id, class 순서로 지정한다. 그 반대는 선택하지 못한다.
				            	var scrapNumberSelector = "#" + clickedId + ".scrapNumber";
				            	// scrapNumberSelector 변수, 콘솔 출력
				            	console.log("scrapNumberSelector: ", scrapNumberSelector);
				            	// 서버에서 받은 게시물의 스크랩 횟수 => 숫자 갱신 
				                $(scrapNumberSelector).text(responseScrapNumber);
							},
							error: function(xhr, status, error) {
				                // AJAX 요청 실패 시 실행할 코드
				                console.error("AJAX 요청 실패:", status, error);										
							}
						});
					} else {
						// <i> 요소의 클래스 변경 => 스크랩 모양변경 
						icon.removeClass("fa-solid").addClass("fa-regular");
						// ajax 요청 보내기
						$.ajax({
							url: "OHPhotoScrapExecute",
							method: "post",
							dataType: "json",
							data: {
								// 전송할 데이터
								'userId' : userId,
								'pb_no' : clickedId
							},
							success: function(response) {
				                // 성공적으로 서버로부터 응답을 받았을 때 실행할 코드
				            	console.log("AJAX 요청 성공");		
				                // 서버에서 받은 게시물의 스크랩 횟수, 변수에 저장
				                var responseScrapNumber = response.scrapNumber;
				                // responseScrapNumber 변수, 콘솔 출력
				            	console.log("서버에서 받은 게시물의 좋아요 횟수: ", responseScrapNumber);
				            	// [중요] 선택자를 이용해 요소 지정할 때 id, class 순서로 지정한다. 그 반대는 선택하지 못한다.
				            	var scrapNumberSelector = "#" + clickedId + ".scrapNumber";
				            	// scrapNumberSelector 변수, 콘솔 출력
				            	console.log("scrapNumberSelector: ", scrapNumberSelector);
				            	// 서버에서 받은 게시물의 스크랩 횟수 => 숫자 갱신 
				                $(scrapNumberSelector).text(responseScrapNumber);					                
							},
							error: function(xhr, status, error) {
				                // AJAX 요청 실패 시 실행할 코드
				                console.error("AJAX 요청 실패:", status, error);										
							}
						});								
					}
				} else {
					// 비회원 => 좋아요 누를 경우
					alert("회원만 가능, 로그인 페이지로 이동");
				}	
			});
		});		
				
				
				
	</script>			
	
	
</html>























