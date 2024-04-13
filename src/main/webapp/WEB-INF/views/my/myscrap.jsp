<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.mypage_category {
    	margin: 0;
        padding: 0;
        width: 100%;
        height: 65px;
        /* border-bottom: 1px solid gray; */
        display: flex; 
        justify-content: center;
        align-items: center;
        /* background-color: lightblue; */
	}
    /* 카테고리 list */
   	.mypage_category_list {
        margin-top: -5px;
        margin-left: 10px;
        padding-left: 10px;
        border-left: 1px solid gray;
        display: inline-block;
        width: fit-content;
        height: fit-content;
        font-size: 15px;
        font-weight: bold;
        font-family: sans-serif;
        cursor: pointer;
    }
    table{
		width: 60%;
		margin-top: 30px;
		font-size: 15px;
		text-align: center;
	}
	th, td{
		height: 30px;
		border-bottom: 1px solid gray;
	}
	th{
		background-color: #e2f0fe;
	}
	    
</style>
</head>
<body>
<h3>myscrap.jsp</h3>
	<div class="mypage_category">
        <div class="mypage_category_list list_1"><a href="mypage">프로필</a></div>
	    <div class="mypage_category_list list_2"><a href="myshopping">나의쇼핑</a></div>
	    <div class="mypage_category_list list_3"><a href="mypagecompanysignup">업체신청</a></div> <br>
    </div>
    <div class="mypage_category">
        <div class="mypage_category_list list_1_1"><a href="mypage">모두보기</a></div>
	    <div class="mypage_category_list list_1_2"><a href="myphoto">내사진</a></div>
        <div class="mypage_category_list list_1_3"><a href="#">스크랩북</a></div>
        <div class="mypage_category_list list_1_4"><a href="mylike">좋아요</a></div>
        <div class="mypage_category_list list_1_5"><a href="mypageinfoedit">회원정보수정</a></div>
        <div class="mypage_category_list list_1_6"><a href="mypagepasswordedit">비밀번호변경</a></div>
    </div>
    
    <div>
    
    <%-- ${path}/biz/home/bizHome?inteno=${bizdto.inteno} --%>
    <table align="center">
    <tr>
    	<th colspan="2">북마크한 업체(${bmarkBiz}개)</th>
    </tr>
    <tr>
    	<td>업체이름</td>
    	<td>소개</td>
    </tr>
    
    <c:forEach items="${bhlist}" var="bh">
    <tr>
    	<td><a href="${path}/biz/home/bizHome?inteno=${bh.inteno}">${bh.bh_name}</a></td>
    	<td class="left"><a href="${path}/biz/home/bizHome?inteno=${bh.inteno}">${bh.bh_intro}</a></td>
    </tr>
    </c:forEach>
    <tr>
    	<td colspan="2"> </td>
    </tr>
    <tr>
    	<th colspan="2">스크랩한 게시물(${scrapPb})</th>
    </tr>
    <tr>
    	<td colspan="2">제목</td>
    </tr>
    
    <c:forEach items="${scraplist}" var="scrap">
    <tr>
    	<td colspan="2"><a href="${path}/oh/OHMainView?pb_no=${scrap.pb_no}">${scrap.pb_title}</a></td>
    </tr>
    </c:forEach>
    
    </table>
    
    
    </div>

</body>
</html>