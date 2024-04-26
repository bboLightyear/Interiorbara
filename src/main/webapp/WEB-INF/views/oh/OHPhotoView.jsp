<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>

<html>

<head>
	
	<meta charset="UTF-8">	
	
	<title>우리 집 자랑하기</title>
	
	<!-- photo.css -->
	<link rel="stylesheet" href="../resources/css/oh/photo.css?after" />
	<!-- OHPhotoView.css -->
	<link rel="stylesheet" href="../resources/css/oh/OHPhotoView.css?after" />
	
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
			<th colspan="16">OHPhotoBoard</th>
		</tr>
		<tr>
			<th>no</th>
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
		<c:forEach items="${ohPhotoView }" var="dto">				
			<tr>
				<td>${dto.no }</td>
				<td>${dto.pb_no }</td>
				<td>${dto.memno }</td>
				<td>${dto.pb_title }</td>
				<td>${dto.pb_content }</td>
				<td>${dto.pb_date }</td>
				<td>${dto.pb_like }</td>
				<td>${dto.pb_scrap }</td>
				<td>${dto.pb_reply }</td>
				<td>${dto.pb_link }</td>
				<td>${dto.pb_hit }</td>
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
--%>
<%-- 	
	<h3>OHPhotoView.jsp</h3>

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

	<!-- 로그인 정보 -->
 	<input type="hidden" id="memno" value=${loginUserDto.memno } />
	<!-- 정렬 정보 -->
	<input type="hidden" id="keepOrderingBy" value=${keepOrderingBy } />
	<input type="hidden" id="keepOrderingMethod" value=${keepOrderingMethod } />
	<!-- 필터 정보 -->
	<input type="hidden" id="keepPb_residence" value=${keepPb_residence } />
	<input type="hidden" id="keepPb_room" value=${keepPb_room } />
	<input type="hidden" id="keepPb_style" value=${keepPb_style } />
	<input type="hidden" id="keepPb_skill" value=${keepPb_skill } />
	<!-- 검색 정보 -->
	<input type="hidden" id="keepSearchingType" value=${keepSearchingType } />
	<input type="hidden" id="keepSearchingWord" value=${keepSearchingWord } />
	<!-- 페이지 정보 -->
	<input type="hidden" id="pageSelectedNum" value=${ohPageVO.pageSelectedNum } />
	<input type="hidden" id="pageTotalNum" value=${ohPageVO.pageTotalNum } />

	<div class="container">
		
		<!-- header -->
		<%@ include file="header.jsp" %>
		
		<div class="contents">
	
			<div class="sideBar">
				<ul >
					<a href="OHMainView"><li class="sideBar-OHMainView">우리 집 자랑하기</li></a>
					<a href="OHPhotoView"><li class="sideBar-OHPhotoView">집사진</li></a>
					<!-- 집영상 -->
					<!-- <li><a href="#">집영상</a></li> -->
					<!-- <li><a href="#">#category</a></li> -->
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
	                            
									<!-- 게시글 작성자 프로필 이미지 -->		
										
									<%-- 프로필 이미지가 없으면 기본 이미지 --%>
									<c:if test="${empty dto.myMemberInfoDto.profileimg}" >
										<a href="#" onclick="javascript_:window.open('../my/memberinfopage?memno=${dto.myMemberInfoDto.memno }','pop','menubar=no,status=no,scrollbars=no,resizable=no,width=560,height=700,top=50,left=50');">
											<img src="../resources/img/my/user.png" id="OHPhotoView-photoProfileImage">
										</a>
							        </c:if>
							        
							        <%-- 프로필 이미지가 있으면 있는 이미지 --%>
							        <c:if test="${!empty dto.myMemberInfoDto.profileimg}" >
							        	<a href="#" onclick="javascript_:window.open('../my/memberinfopage?memno=${dto.myMemberInfoDto.memno }','pop','menubar=no,status=no,scrollbars=no,resizable=no,width=560,height=700,top=50,left=50');">
							            	<img src="../resources/upload/my/${dto.myMemberInfoDto.profileimg }" id="OHPhotoView-photoProfileImage">
							            </a>
							        </c:if>		          
							                              
	                                <!-- 게시글 작성자 이름 -->
	                                <div id="OHPhotoView-photoUserName">
	                                	<a href="#" onclick="javascript_:window.open('../my/memberinfopage?memno=${dto.myMemberInfoDto.memno }','pop','menubar=no,status=no,scrollbars=no,resizable=no,width=560,height=700,top=50,left=50');">
	                                		${dto.myMemberInfoDto.nickname }
	                                	</a>
	                                </div>
	                                
	                                <!-- 게시글 제목 -->
	                                <div id="OHPhotoView-photoTitle">
	                                    <!-- 게시글 상세 페이지로 이동하는 링크 -->
	                                	<a id="OHPhotoView-moveToDetailTitle" onclick="moveToPhotoDetailView(event)">
	                                		<!-- 게시글 제목 -->
	                                		${dto.pb_title }
                        					<!-- 게시물 번호 -->
											<input type="hidden" class="OHPhotoViewPbNo" value=${dto.pb_no } />
										</a>											                                
	                                </div>
	                                
	                            </div>								
								
	                            <div class="OHPhotoView-boxLayer-2">
									<!-- 게시글 상세 페이지로 이동하는 링크 -->
									<a id="OHPhotoView-moveToDetailImage" onclick="moveToPhotoDetailView(event)">
										<!-- 게시글 대표 이미지 --> 
		                                <img id="OHPhotoView-photoImage" src="../resources/upload/oh/photo/${dto.ohPhotoAttach.pa_attach }" alt="해당 게시글 대표사진">
										<!-- 게시물 번호 -->
										<input type="hidden" class="OHPhotoViewPbNo" value=${dto.pb_no } />		                                
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
	                                <span class="OHPhotoView-replyImage" id="${dto.pb_no }">
	                                	<a id="OHPhotoView-moveToDetailReply" onclick="moveToPhotoDetailViewReply(event)">
	                                		<i class="fa-regular fa-comment"></i>
											<!-- 게시물 번호 -->
											<input type="hidden" class="OHPhotoViewPbNo" value=${dto.pb_no } />	                                		
	                                	</a>
	                                </span>
	                                <!-- 댓글, 이미지 End -->
	                                
	                                <!-- 댓글, 숫자 -->
	                                <div class="OHPhotoView-replyNumber" id="${dto.pb_no }">${dto.pb_reply }</div>
	                                <!-- 댓글, 숫자 End -->
	                                
	                              	<!-- 조회수, Lable -->
	                                <div id="OHPhotoView-photoHit">조회수</div>
	                                
	                                <!-- 조회수, 숫자 -->
	                                <div id="OHPhotoView-photoHitCount">${dto.pb_hit }</div>
	                                
									<!-- 게시글 내용 -->
	                                <div id="OHPhotoView-photoContent">
	                                	<!-- 게시글 상세 페이지로 이동하는 링크 -->
	                                	<a id="OHPhotoView-moveToDetailContent" onclick="moveToPhotoDetailView(event)">
	                                		<!-- 게시글 내용 -->
	                                		${dto.pb_content }
											<!-- 게시물 번호 -->
											<input type="hidden" class="OHPhotoViewPbNo" value=${dto.pb_no } />
										</a>		                                	
	                                </div>
	                                
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
							<a href="#" onclick="firstPage(1)" id="firstPage"><i class="fa-solid fa-angles-left"></i></a>
							<!-- 이전 페이지로 이동 -->
							<a href="#" onclick="beforePage(${ohPageVO.pageSelectedNum - 1 })" id="beforePage"><i class="fa-solid fa-angle-left"></i></a>
						</c:if>	
								
						<c:forEach begin="${ohPageVO.pageStartNum }" end="${ohPageVO.pageEndNum }" var="i">
							<c:choose>
								<c:when test="${i eq ohPageVO.pageSelectedNum }">
									<span style="color:#1e90ff; font-weight:bold;">${i } &nbsp;</span>
								</c:when>
								<c:otherwise>
									<a href="#" onclick="movePage(${i })" >${i }</a>&nbsp;
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<c:if test="${ohPageVO.pageTotalNum > ohPageVO.pageSelectedNum }">
							<!-- 다음 페이지로 이동 -->
							<a href="#" onclick="nextPage(${ohPageVO.pageSelectedNum + 1 })" id="nextPage"><i class="fa-solid fa-angle-right"></i></a>
							<!-- 마지막 페이지로 이동 -->					
							<a href="#" onclick="lastPage(${ohPageVO.pageTotalNum })" id="lastPage"><i class="fa-solid fa-angles-right"></i></a>					                               					
						</c:if>
						
						<!-- hidden, value 전달 -->
						<!-- 정렬 정보 -->
						<input type="hidden" name="orderingBy" value=${keepOrderingBy } />
						<input type="hidden" name="orderingMethod" value=${keepOrderingMethod } />
						<!-- 필터 정보 -->
						<input type="hidden" name="pb_residence" value=${keepPb_residence } />
						<input type="hidden" name="pb_room" value=${keepPb_room } />
						<input type="hidden" name="pb_style" value=${keepPb_style } />
						<input type="hidden" name="pb_skill" value=${keepPb_skill } />
						<!-- 검색 정보 -->
						<input type="hidden" name="searchingType" value=${keepSearchingType } />
						<input type="hidden" name="searchingWord" value=${keepSearchingWord } />
						<!-- 페이지 이동 버튼, 적용 jQuery 함수 - firstPage(), beforePage(), movePage(num), nextPage(), lastPage() -->
						<input type="hidden" id="transPage"/>
						
					</form>
			
				</div>				
			
			</div>
			
		</div>
		
		<!-- footer -->
		<%@ include file="footer.jsp" %>
		
	</div>	
	
	<!-- OHPhotoView.js -->
	<script src="../resources/js/oh/OHPhotoView.js"></script>		
	
</body>	
	
</html>
