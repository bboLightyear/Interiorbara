<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<style>
    .br_content {
        margin: 20px;
        display: block;
        color: black;
        width: 400px;
        font-size: 12px;
        font-weight: normal;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: normal;
        line-height: 1.2;
        height: 4.8em;
        text-align: left;
        word-wrap: break-word;
        display: -webkit-box;
        -webkit-line-clamp: 4 ;
        -webkit-box-orient: vertical;
    }
    
    a {
	   text-decoration: none;
	   color: #1a1f27;
	}
</style>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>

<div class="clickResult">
	
	<div class="d-flex justify-content-evenly pb-2">
		<div class="px-3 d-flex justify-content-evenly" style="width: 660px;">
			<div class="card" style="width: 100%; background-color: #e2f0fe; border:#f9fafb; cursor: pointer;" onclick="loadHomeInfo()" >
			  <div class="card-body">
			    <p class="card-text px-5 text-center" style="font-size: 14px;">${bizHome.bh_notice }</p>
			  </div>
			</div>
		</div>
	</div>
	
	<div class="d-flex justify-content-evenly">
		<div class="p-3 d-flex" style="width: 660px;">
					<c:if test="${empty loginUserDto.memno}">
						<span onclick="redirectLogin()" style="font-size: 14px; cursor: pointer;"><strong style="background-color: #f9fafb">시공사례 (${bizHomeCasesCnt }+)</strong></span>
					</c:if>
					<c:if test="${not empty loginUserDto.memno}">
						<span onclick="location.href='../cases/bizCasesList?inteno=${inteno }'" style="font-size: 14px; cursor: pointer;"><strong style="background-color: #f9fafb">시공사례 (${bizHomeCasesCnt })</strong></span>
					</c:if>	
		</div>
	</div>
	
	<div class="d-flex justify-content-evenly">
		<div class="p-3 d-flex justify-content-evenly" style="width: 700px;">
			<div width="100%">
				<c:forEach items="${bizHomeCasesImgList }" var="hc_img">
					<c:if test="${hc_img.bcimg_cgn ne null }">
						<c:set value="${hc_img.bcimg_cgn }" var="filename" />
						<c:set value="${fn:toLowerCase(filename) }" var="fileNm" />
						<c:forTokens items="${fileNm }" delims="." var="token" varStatus="status">
						<c:if test="${status.last }">
							<c:choose>
								<c:when test="${token eq 'jpg' || token eq 'png'}">											
									<img src="../../resources/upload/biz/cases/${hc_img.bcimg_cgn }" alt="${hc_img.bcimg_cgn }" width="29%" height="102px" style="cursor:pointer;"
									onclick="location.href='../cases/bizCasesContentView?bc_no=${hc_img.bc_no }'"/>
								</c:when>
								<c:otherwise> </c:otherwise>		
								</c:choose>
							</c:if>
							</c:forTokens>
					</c:if>			
				</c:forEach>	
				<span>
					<c:if test="${empty loginUserDto.memno}">
						<button class="btn btn-outline-primary" style="width:9%; height: 100%" onclick="redirectLogin()">+</button>
					</c:if>
					<c:if test="${not empty loginUserDto.memno}">
						<button class="btn btn-outline-primary" style="width:9%; height: 100%" onclick="location.href='../cases/bizCasesList?inteno=${inteno }'">+</button>
					</c:if>	
				</span>
			</div>		
		</div>
	</div>
	
	<div class="d-flex justify-content-evenly">
		<div class="p-3 d-flex" style="width: 660px;">
					<c:if test="${empty loginUserDto.memno}">
						<span onclick="redirectLogin()"  style="font-size: 14px; cursor: pointer;"><strong style="background-color: #f9fafb">시공리뷰 (${bizHomeRvCnt })</strong></span>
					</c:if>
					<c:if test="${not empty loginUserDto.memno}">
						<span onclick="location.href='../review/bizRvList?inteno=${inteno }'" style="font-size: 14px; cursor: pointer;"><strong style="background-color: #f9fafb">시공리뷰 (${bizHomeRvCnt })</strong></span>
					</c:if>	
		</div>
	</div>
	
	<div class="d-flex justify-content-evenly">
		<div class="px-3 pb-3 d-flex justify-content-evenly" style="width: 700px;">
			<div style="width: 83%">
				<table style="border-collapse: separate; border-spacing: 10px;">
					<c:forEach items="${bizHomeRvImgList }" var="hr_img">
						<tr>
								<td width="25%">
									<c:if test="${hr_img.bizRvImgDto.brimg_cgn ne null }">
										<c:set value="${hr_img.bizRvImgDto.brimg_cgn }" var="filename" />
										<c:set value="${fn:toLowerCase(filename) }" var="fileNm" />
										<c:forTokens items="${fileNm }" delims="." var="token" varStatus="status">
										<c:if test="${status.last }">
											<c:choose>
												<c:when test="${token eq 'jpg' || token eq 'png'}">											
													<span onclick="location.href='../review/bizRvContentView?br_no=${hr_img.br_no }'" style="cursor:pointer;">
															<img src="../../resources/upload/biz/review/${hr_img.bizRvImgDto.brimg_cgn }" alt="${hr_img.bizRvImgDto.brimg_cgn }" style="cursor:pointer; width: 100%; height:100px"/>
													</span>
												</c:when>
											<c:otherwise> </c:otherwise>	
											</c:choose>
										</c:if>
										</c:forTokens>
									</c:if>	
								</td>
								<td width="75%">
									<span onclick="location.href='../review/bizRvContentView?br_no=${hr_img.br_no }'" style="cursor:pointer; height: 100%;">
										<span class="br_content" style="width: 90%;">
											${hr_img.br_content }
										</span>
									</span>	
								</td>
						</tr>
					</c:forEach>
				</table>
				<span class="d-flex justify-content-evenly" width="100%">
					<c:if test="${empty loginUserDto.memno}">
						<button class="btn btn-outline-primary" style="width: 95%; height: 10%;" onclick="redirectLogin()">+</button>
					</c:if>
					<c:if test="${not empty loginUserDto.memno}">
						<button class="btn btn-outline-primary" style="width: 95%; height: 10%;" onclick="location.href='../review/bizRvList?inteno=${inteno }'">+</button>
					</c:if>					
				</span>
			</div>
		</div>
	</div>
</div>
</body>
</html>