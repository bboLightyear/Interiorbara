<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		header {
			border: 1px solid #333;
			height: 130px;
			text-align: center;
		}
		#sideBar {
			float: left;
			list-style-type: none;
			padding: 0px;
			margin: 0px;
			width: 200px
		}
		#sideBar li {
			background-color: #FF6347;
			border: 1px solid #333;
		}
		#sideBar li a {
			text-decoration: none;
		}
		#sideBar li a:hover {
		
		}
		#write {
			float: right;
		}
		footer {
			clear: both;
			border: 1px solid #333;
			height: 130px;
			text-align: center;
		}				
	</style>
</head>
<body>
	<div id="container">
	
		<header>
			<h1>header</h1>
		</header>
		
		<div id="contents">
		
			<ul id="sideBar">
				<li><a href="OHMainView">우리집 자랑하기</a></li>
				<li><a href="OHPhotoView">집사진</a></li>
				<li><a href="">집영상</a></li>
				<li><a href="">#category</a></li>
			</ul>	
			
			<h3>OHPhotoWriteView.jsp</h3>
		
			<h3>글쓰기</h3>
			
			<hr />			
			
			<button>집사진</button> 
			
			<br />
			
			<button>집영상</button>
			
			<form action="OHPhotoWriteExecute" method="post" enctype="multipart/form-data">
				
				<input type="submit" value="올리기" />
				
				&nbsp;&nbsp;&nbsp;
				
				<button><a href="OHPhotoView">취소하기</a></button>
				
				<hr />
				
				<input type="file" name="pa_attach" multiple />
				
				<hr />
				
				<table>
					<tr>
						<td>제목</td>
						<td>
							<input type="text" name="pb_title" placeholder="제목을 입력하세요." />
						</td>
					</tr>
					<tr>
						<td>내용</td>
						<td>
							<textarea name="pb_content" rows="10" cols="30" placeholder="내용을 입력하세요." ></textarea>
						</td>
					</tr>					
				</table>
				
				<label for="pb_category">#category</label>
				<select name="pb_category" id="pb_category">
					<option value="">선택</option>
					<option value="#그냥">#그냥</option>
					<option value="#내돈내산">#내돈내산</option>
				</select>				
				
				<label for="pb_residence">주거형태</label>
				<select name="pb_residence" id="pb_residence">
					<option value="">선택</option>
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
				
				<label for="pb_style">스타일</label>
				<select name="pb_style" id="pb_style">
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
				
				<label for="pb_skill">셀프/전문가</label>
				<select name="pb_skill" id="pb_skill">
					<option value="">선택</option>
					<option value="셀프">셀프</option>
					<option value="전문가">전문가</option>
				</select>	
				
			</form>
		
		</div>
		
		<footer>
			<h1>footer</h1>
		</footer>
		
	</div>
	
</body>
</html>