<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.tech.ibara.my.db.DBCon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link rel="stylesheet" href="${path}/resources/css/my/mypageinfoedit.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>
/* 헤더 */
html,body {
	margin: 0;
	padding: 0;
	height: 100%;
}
body{
		display: flex;
  		min-height: 100vh;
  		flex-direction: column;
	}	
header {
	margin: 0;
	padding: 0;
	width: 100%;
	height: 130px;
	text-align: center;
    position: sticky;
    top: 0;
    z-index: 999;
}

/* 헤더 윗부분 */
.header_top {
	margin: 0;
	padding: 0;
	width: 100%;
	height: 65px;
	border-bottom: 1px solid #b1b8c0;
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: white;
}

/* 로고 이미지 */
.header_logo {
	display: inline-block;
	margin-top: 5px;
	margin-left: 150px;
	width: 400px;
	height: 50px;
	object-fit: fill;
	cursor: pointer;
}

.header_logo img{
	width: 100%;
	height: 100%;
	object-fit: cover;
	object-position: center;
}

/* 검색 창 */
.header_search_box {
	margin-top: 5px;
	display: inline-block;
	width: 40%;
	height: 30px;
	border: 1px solid #b1b8c0;
	border-radius: 10px;
	background-color: #f9fafb;
}
.header_search_box:hover {
	background-color: #e2f0fe;
}
.header_search_box:click {
	background-color: #e2f0fe;
}
/* 검색 부분 */
.header_search_box_input {
	margin-top: 5px;
	border: none;
	overflow: auto;
	z-index: -1;
	font-size: 15px;
	width: 80%;
	height: 60%;
	background-color: #f9fafb;
	text-align: center;
	cursor: pointer;
}
.header_search_box_input:hover {
	background-color: #e2f0fe;
}
.header_search_box_input:click {
	background-color: #e2f0fe;
}
.header_search_box_icon{
	margin-right: 10px;	
}
/* 회원관리부분 */
.header_login_box {
	margin-top: 25px;
	display: inline-block;
	width: fit-content;
	height: 30px;
	font-size: 12px;
}
/* 로그인 */
.header_login {
	float: left;
	margin-right: 10px;
	padding-left: 10px;
	padding-right: 10px;
	width: fit-content;
	height: fit-content;
	border-left: 1px solid #b1b8c0;
	border-right: 1px solid #b1b8c0;
	cursor: pointer;
}
/* 회원가입 */
.header_join {
	float: left;
	margin-right: 10px;
	padding-right: 10px;
	width: fit-content;
	height: fit-content;
	border-right: 1px solid #b1b8c0;
	cursor: pointer;
}
/* 마이페이지 */
.header_cs {
	float: left;
	cursor: pointer;
}

/* 헤더 아랫부분 */
.header_bottom {
	margin: 0;
	padding: 0;
	width: 100%;
	height: 65px;
	border-bottom: 1px solid #b1b8c0;
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: white;
    transition: 0.1s;
}

/* 카테고리 아이콘 */
.header_category_icon {
	margin-top: 12px;
	display: inline-block;
	width: fit-content;
	height: 40px;
	cursor: pointer;
}

/* 카테고리 list */
.header_category_list {
	margin-top: -5px;
	margin-left: 10px;
	padding-left: 10px;
	border-left: 1px solid #b1b8c0;
	display: inline-block;
	width: fit-content;
	height: fit-content;
	font-size: 15px;
	font-weight: bold;
	font-family: sans-serif;
	text-decoration: none;
	cursor: pointer;
}
.header_category_list:hover {
	padding-right: 10px;
	transform: scale(1.1);
    letter-spacing: 2px;
	background-color: #e2f0fe;
	transition: 0.1s;
	font-size: 18px;
}

.body_section {
	width: 80%;
	margin-left: 13%;
	text-align: center;
	height: auto;
	min-height: 100%;
	padding-bottom: 130px;
}
a{
	text-decoration: none;
	color: black;
}
.container{
	margin-top: 80px;
}

/* 푸터 */
/* #wrapper {
	width:100%;
    min-height: 35%;
    position: relative;
    display: grid;
    bottom: 0;
    margin-top: 26px;
} */

footer {
	margin: 0;
	padding: 0;
	width: 100%;
	height: 130px;
	position: absolute;
	/* transform: translateY(-10%); */
	border-top: 1px solid #b1b8c0;
	display: flex;
	background-color: #b1b8c0;
	bottom: 0;
}

/* 푸터 로고 */
.footer_logo {
	margin-top: 5px;
	margin-left: 30px;
	width: 120px;
	height: 120px;
	border: 1px solid #b1b8c0;
	cursor: pointer;
}

.footer_logo img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	object-position: center;
}

/* 푸터 내용 */
.footer_content {
	margin-top: 10px;
	margin-left: 50px;
	width: 60%;
	white-space: pre-line;
}

/* sns 아이콘 */
.footer_sns {
	position: absolute;
	right: 50px;
	bottom: 10px;
	text-align: right;
	margin-top: 100px;
	width: 150px;
	height: 25px;
}
.footer_sns a{
	float: left;
	margin-left: 5px;
	margin-right: 5px;
	width: 20px;
	height: 20px;
	text-decoration: none;
}
.Site-content {
  flex: 1;
}

.clear{
    clear: both;
}
</style>

<%

String sql="select round(to_char(m_date,'yyyymm')) ym ,count(*) cnt from modal_complete where m_date>=add_months(sysdate,-6) group by round(to_char(m_date,'yyyymm')) order by ym asc";
//최근 6개월간 견적횟수
Connection con=DBCon.getconConnection();
PreparedStatement pstmt=con.prepareStatement(sql);
ResultSet rs=pstmt.executeQuery();

JSONArray arr1=new JSONArray();
while(rs.next()){
	JSONObject obj=new JSONObject();
	String ym=rs.getString("ym");
	String cnt=rs.getString("cnt");
	obj.put("ym",ym);
	obj.put("cnt",cnt);
	if(obj!=null){
		arr1.add(obj);
	}
}
rs.close();
pstmt.close();
con.close();


String sql1="select round(to_char(order_date,'yyyymm')) ymm ,count(*) cnt1 from shop_order where order_date>=add_months(sysdate,-6) group by round(to_char(order_date,'yyyymm')) order by ymm asc";
//최근 6개월간 판매횟수
Connection con2=DBCon.getconConnection();
PreparedStatement pstmt2=con2.prepareStatement(sql1);
ResultSet rs2=pstmt2.executeQuery();


JSONArray arr2=new JSONArray();
while(rs2.next()){
	JSONObject obj2=new JSONObject();
	String ym=rs2.getString("ymm");
	String cnt=rs2.getString("cnt1");
	obj2.put("ym",ym);
	obj2.put("cnt",cnt);
	if(obj2!=null){
		arr2.add(obj2);
	}
}

rs2.close();
pstmt2.close();
con2.close();


String sql2="select round(to_char(order_date,'yyyymm')) ym, sum(total_price) sum from shop_order where order_date>=add_months(sysdate,-6) group by round(to_char(order_date,'yyyymm')) order by ym asc";

Connection con3=DBCon.getconConnection();
PreparedStatement pstmt3=con3.prepareStatement(sql2);
ResultSet rs3=pstmt3.executeQuery();



JSONArray arr3=new JSONArray();
while(rs3.next()){
	JSONObject obj3=new JSONObject();
	String ym=rs3.getString("ym");
	String sum=rs3.getString("sum");
	obj3.put("ym", ym);
	obj3.put("sum", sum);
	if(obj3!=null){
		arr3.add(obj3);
	}
}

%>


</head>
<body>
<!-- 헤더 -->
	<header>
		<!-- header_top : 헤더 윗부분 -->
		<div class="header_top">
			<!-- 왼쪽 여백 -->
			<div></div>
			<!-- header_logo : 로고 -->
			<div class="header_logo">
				<img src="${path}/resources/img/mainimg/main_logo.jpg" alt="#" onclick="location.href='${path}/main'" />
				
			</div>
			<!-- header_search_box : 검색창 -->
			<div class="header_search_box">
				<form action="${path}/mainSearchView" method="get">
					<i class="fas fa-search header_search_box_icon"></i> <input
						type="text" name="mainSearchContent" value="${mainSearchContent }"
						class="header_search_box_input" placeholder="검색">
				</form>
			</div>
			<!-- header_login_box : 회원관리부분 -->
			<div class="header_login_box">
			<!-- 로그인 세션 부분 -->
				<c:choose>
				   <c:when test="${loginUserDto eq null }">
		   				<div class="header_login">
							<a href="loginform">로그인</a>
						</div>
						<div class="header_join">
							<a href="joinform">회원가입</a>
						</div>
				   </c:when>
				   <c:otherwise>
	   					<div class="header_login">
							<a href="logout">로그아웃</a>
						</div>
						<div class="header_join">
							<a href="mypage">mypage</a>
						</div>
				   </c:otherwise>
				</c:choose>
			</div>

			<!-- 오른쪽 여백 -->
			<div></div>
		</div>
		<!-- header_bottom : 헤더 아랫부분 -->
		<div id="header_bottom" class="header_bottom">
			<!-- header_category_icon : 카테고리 아이콘 -->
			<div class="header_category_icon">
				<i class="fas fa-bars"></i>
			</div>
			<!-- header_category_list : 카테고리 / list_1~5 : list에 각각 들어갈 내용 -->
			<div class="header_category_list list_1">
				<a href="${path}/modal/mMain" class="openModal">퀵견적</a>
				
			</div>
			<div class="header_category_list list_2">
				<a href="${path}/shop/list">소품샵</a>
			</div>
			<div class="header_category_list list_3">
				<a href="${path}/biz/magazine/bizMgzList">업체 둘러보기</a>
			</div>
			<div class="header_category_list list_4">
				<a href="${path}/oh/OHMainView">우리 집 자랑하기</a>
			</div>
			<div class="header_category_list list_5">
				<a href="${path}/cshome">고객센터</a>
			</div>
		</div>
	</header>



	
	
	<div class="mypage_category">
		<div class="mypage_category_list list_1"><a href="#">메인</a>	</div>
		<div class="mypage_category_list list_2"><a href="admin_memberlist">회원관리</a></div>
		<!-- <div class="mypage_category_list list_3">업체신청관리</div> -->
		<div class="mypage_category_list list_3"><a href="admin_report">신고게시판</a></div>
		<!-- <div class="mypage_category_list list_4">컨텐츠관리</div> -->
	</div>
<main class="Site-content">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<canvas id="myChart"></canvas>
			</div>
			<div class="col-md-6">
				<canvas id="myChart2"></canvas>
			</div>
		</div>
	</div>
	
</main>

<script type="text/javascript">
var jArray1 = new Array();
jArray1 = '<%=arr1 %>';
/* 파싱 */
jArray1 = JSON.parse(jArray1);

var jArray2 = new Array();
jArray2 = '<%=arr2 %>';
/* 파싱 */
jArray2 = JSON.parse(jArray2);

const ctx = document.getElementById('myChart');

new Chart(ctx, {
	type : 'line',
	data : {
		labels : [ 
			jArray1[0].ym,
			jArray1[1].ym,
			jArray1[2].ym,
			jArray1[3].ym,
			jArray1[4].ym,
			jArray1[5].ym
			],
		datasets : [ {
			label : '#월별견적수',
			backgroundColor : [	'#1e90ff' ],
			borderColor : [	'#1e90ff' ],
			borderWidth : 1,
			fill:false,
			data : [
				jArray1[0].cnt,
				jArray1[1].cnt,
				jArray1[2].cnt,
				jArray1[3].cnt,
				jArray1[4].cnt,
				jArray1[5].cnt
				],
			
		} , {
			label : '#월별판매수',
			backgroundColor : [ '#1034a6' ],
			borderColor : ['#1034a6'],
			borderWidth : 1,
			fill:false,
			data : [
				jArray2[0].cnt,
				jArray2[1].cnt,
				jArray2[2].cnt,
				jArray2[3].cnt,
				jArray2[4].cnt,
				jArray2[5].cnt
				],
		
		} ]
	},
	options : {
		responsive : true,
		plugins : {
			legend : {
				position : 'top',
			},
			title : {
				/*display : true,
				text : 'Chart.js Line Chart'*/
			}
		}
	}
});

var jArray3 = new Array();
jArray3 = '<%=arr3 %>';
/* 파싱 */
jArray3 = JSON.parse(jArray3);

const ctx2 = document.getElementById('myChart2');

new Chart(ctx2, {
	type : 'bar',
	data : {
		labels : [
			jArray3[0].ym,
			jArray3[1].ym,
			jArray3[2].ym,
			jArray3[3].ym,
			jArray3[4].ym,
			jArray3[5].ym
			],
		datasets : [ {
			label : '#월별판매금액',
			data : [ 
				jArray3[0].sum,
				jArray3[1].sum,
				jArray3[2].sum,
				jArray3[3].sum,
				jArray3[4].sum,
				jArray3[5].sum
				],
			backgroundColor : [ '#0a1c32', '#13345d', '#235899', '#4982c8',
					'#7eabe1', '#c6d9f1' ],
			borderWidth : 0
		} ]
	},
	options : {
		responsive : true,
		plugins : {
			legend : {
				position : 'top',
			},
			title : {
				/* display : true,
				text : 'Chart.js bar Chart' */
			}
		}
	}
});


</script>

<div class="clear"></div>
<!-- 푸터 -->
	<div id="wrapper">
	<footer>
		<!-- 푸터 로고 -->
		<div class="footer_logo">
			<img src="${path}/resources/img/mainimg/footer_logo.PNG" alt="#" onclick="location.href='${path}/main'"  />
		</div>
		<!-- 푸터 내용 -->
		<div class="footer_content">(주) 카피바라 주소 : 대한민국 서울시 양천구 목동 655-19
			대표 : 조보근 전화번호 : 010-3017-5283</div>
		<!-- sns 아이콘 -->
		<div class="footer_sns">
			<a href="https://www.facebook.com/"><i class="fab fa-facebook fa-lg"></i></a>
			<a href="https://www.youtube.com/"><i class="fab fa-youtube fa-lg"></i></a>
			<a href="https://www.twitter.com/"><i class="fab fa-twitter fa-lg"></i></a>
			<a href="https://www.twitch.tv/"><i class="fab fa-twitch fa-lg"></i></a>
			<a href="https://www.instagram.com/"><i class="fab fa-instagram fa-lg"></i></a>
		</div>
	</footer>
	</div>
	



</body>
</html>