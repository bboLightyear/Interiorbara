<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.tech.ibara.my.db.DBCon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<script>
document.title = "관리자페이지";
</script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
a {
	text-decoration: none;
	color: black;
}
</style>

<%
String sql = "select round(to_char(m_date,'yyyymm')) ym ,count(*) cnt from modal_complete where m_date>=add_months(sysdate,-6) group by round(to_char(m_date,'yyyymm')) order by ym asc";
//최근 6개월간 견적횟수
Connection con = DBCon.getconConnection();
PreparedStatement pstmt = con.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();

JSONArray arr1 = new JSONArray();
while (rs.next()) {
	JSONObject obj = new JSONObject();
	String ym = rs.getString("ym");
	String cnt = rs.getString("cnt");
	obj.put("ym", ym);
	obj.put("cnt", cnt);
	if (obj != null) {
		arr1.add(obj);
	}
}
rs.close();
pstmt.close();
con.close();

String sql4 = "select round(to_char(m_date,'yyyymm')) ym ,count(*) cnt from modal_complete where m_date>=add_months(sysdate,-6) and m_type like '%스탠다드%' group by round(to_char(m_date,'yyyymm')) order by ym asc";
//최근 6개월간 스탠다드견적 횟수
Connection con4 = DBCon.getconConnection();
PreparedStatement pstmt4 = con4.prepareStatement(sql4);
ResultSet rs4 = pstmt4.executeQuery();

JSONArray arr4 = new JSONArray();
while (rs4.next()) {
	JSONObject obj4 = new JSONObject();
	String ym = rs4.getString("ym");
	String cnt = rs4.getString("cnt");
	obj4.put("ym", ym);
	obj4.put("cnt", cnt);
	if (obj4 != null) {
		arr4.add(obj4);
	}
}

rs4.close();
pstmt4.close();
con4.close();


String sql5 = "select round(to_char(m_date,'yyyymm')) ym ,count(*) cnt from modal_complete where m_date>=add_months(sysdate,-6) and m_type like '%프리미엄%' group by round(to_char(m_date,'yyyymm')) order by ym asc";
//최근 6개월간 프리미엄견적 횟수
Connection con5 = DBCon.getconConnection();
PreparedStatement pstmt5 = con5.prepareStatement(sql5);
ResultSet rs5 = pstmt5.executeQuery();

JSONArray arr5 = new JSONArray();
while (rs5.next()) {
	JSONObject obj5 = new JSONObject();
	String ym = rs5.getString("ym");
	String cnt = rs5.getString("cnt");
	obj5.put("ym", ym);
	obj5.put("cnt", cnt);
	if (obj5 != null) {
		arr5.add(obj5);
	}
}

rs5.close();
pstmt5.close();
con5.close();

String sql11 = "select round(to_char(m_date,'yyyymm')) ym ,count(*) cnt from modal_complete where m_date>=add_months(sysdate,-6) and m_place like '%아파트%' group by round(to_char(m_date,'yyyymm')),m_place order by ym asc";
//최근 6개월간 아파트 견적횟수
Connection con11 = DBCon.getconConnection();
PreparedStatement pstmt11 = con11.prepareStatement(sql11);
ResultSet rs11 = pstmt11.executeQuery();

JSONArray arr11 = new JSONArray();
while (rs11.next()) {
	JSONObject obj11 = new JSONObject();
	String ym = rs11.getString("ym");
	String cnt = rs11.getString("cnt");
	obj11.put("ym", ym);
	obj11.put("cnt", cnt);
	if (obj11 != null) {
		arr11.add(obj11);
	}
}
rs11.close();
pstmt11.close();
con11.close();

String sql12 = "select round(to_char(m_date,'yyyymm')) ym ,count(*) cnt from modal_complete where m_date>=add_months(sysdate,-6) and m_place like '%빌라%' group by round(to_char(m_date,'yyyymm')),m_place order by ym asc";
//최근 6개월간 빌라 견적횟수
Connection con12 = DBCon.getconConnection();
PreparedStatement pstmt12 = con12.prepareStatement(sql12);
ResultSet rs12 = pstmt12.executeQuery();

JSONArray arr12 = new JSONArray();
while (rs12.next()) {
	JSONObject obj12 = new JSONObject();
	String ym = rs12.getString("ym");
	String cnt = rs12.getString("cnt");
	obj12.put("ym", ym);
	obj12.put("cnt", cnt);
	if (obj12 != null) {
		arr12.add(obj12);
	}
}
rs12.close();
pstmt12.close();
con12.close();

String sql13 = "select round(to_char(m_date,'yyyymm')) ym ,count(*) cnt from modal_complete where m_date>=add_months(sysdate,-6) and m_place like '%오피스텔%' group by round(to_char(m_date,'yyyymm')),m_place order by ym asc";
//최근 6개월간 오피스텔 견적횟수
Connection con13 = DBCon.getconConnection();
PreparedStatement pstmt13 = con13.prepareStatement(sql13);
ResultSet rs13 = pstmt13.executeQuery();

JSONArray arr13 = new JSONArray();
while (rs13.next()) {
	JSONObject obj13 = new JSONObject();
	String ym = rs13.getString("ym");
	String cnt = rs13.getString("cnt");
	obj13.put("ym", ym);
	obj13.put("cnt", cnt);
	if (obj13 != null) {
		arr13.add(obj13);
	}
}
rs13.close();
pstmt13.close();
con13.close();

String sql14 = "select round(to_char(m_date,'yyyymm')) ym ,count(*) cnt from modal_complete where m_date>=add_months(sysdate,-6) and m_place like '%단독주택%' group by round(to_char(m_date,'yyyymm')),m_place order by ym asc";
//최근 6개월간 단독주택 견적횟수
Connection con14 = DBCon.getconConnection();
PreparedStatement pstmt14 = con14.prepareStatement(sql14);
ResultSet rs14 = pstmt14.executeQuery();

JSONArray arr14 = new JSONArray();
while (rs14.next()) {
	JSONObject obj14 = new JSONObject();
	String ym = rs14.getString("ym");
	String cnt = rs14.getString("cnt");
	obj14.put("ym", ym);
	obj14.put("cnt", cnt);
	if (obj14 != null) {
		arr14.add(obj14);
	}
}
rs14.close();
pstmt14.close();
con14.close();

%>

<main class="Site-content">
	<div class="mypage_category">
		<div class="mypage_category_list list_1 pointcolor">관리자메인</div>
		<div class="mypage_category_list list_2">
			<a href="admin_memberlist">회원관리</a>
		</div>
		<div class="mypage_category_list list_3">
			<a href="admin_report">신고게시판</a>
		</div>
	</div>

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
	<script type="text/javascript">
var jArray1 = new Array();
jArray1 = '<%=arr1%>';
/* 파싱 */
jArray1 = JSON.parse(jArray1);

var jArray4 = new Array();
jArray4 = '<%=arr4%>';
/* 파싱 */
jArray4 = JSON.parse(jArray4);

var jArray5 = new Array();
jArray5 = '<%=arr5%>';
/* 파싱 */
jArray5 = JSON.parse(jArray5);


var jArray11 = new Array();
jArray11 = '<%=arr11%>';
/* 파싱 */
jArray11 = JSON.parse(jArray11);

var jArray12 = new Array();
jArray12 = '<%=arr12%>';
/* 파싱 */
jArray12 = JSON.parse(jArray12);

var jArray13 = new Array();
jArray13 = '<%=arr13%>';
/* 파싱 */
jArray13 = JSON.parse(jArray13);

var jArray14 = new Array();
jArray14 = '<%=arr14%>';
/* 파싱 */
jArray14 = JSON.parse(jArray14);

const esticount={
		type:'line',
		label:"월별견적수",
		data:[
			jArray1[0].cnt,
			jArray1[1].cnt,
			jArray1[2].cnt,
			jArray1[3].cnt,
			jArray1[4].cnt,
			jArray1[5].cnt],
			backgroundColor:['rgba(16, 52, 166, 0.7)'],
			borderColor:['rgba(16, 52, 166, 0.7)'],
            borderWidth:1
}
const apart = {
        label:'아파트',
        data:[
        	jArray11[0].cnt,
			jArray11[1].cnt,
			jArray11[2].cnt,
			jArray11[3].cnt,
			jArray11[4].cnt,
			jArray11[5].cnt],
        backgroundColor:['rgba(30, 144, 255, 0.8)'],
        borderWidth:0
}
const villa = {
    label:'빌라',
    data:[
    	jArray12[0].cnt,
		jArray12[1].cnt,
		jArray12[2].cnt,
		jArray12[3].cnt,
		jArray12[4].cnt,
		jArray12[5].cnt],
    backgroundColor:['rgba(30, 144, 255, 0.6)'],
    borderWidth:0
}

const officetel = {
	    label:'오피스텔',
	    data:[
	    	jArray13[0].cnt,
			jArray13[1].cnt,
			jArray13[2].cnt,
			jArray13[3].cnt,
			jArray13[4].cnt,
			jArray13[5].cnt],
	    backgroundColor:['rgba(30, 144, 255, 0.4)'],
	    borderWidth:0
	}

const detachedhouse = {
	    label:'단독주택',
	    data:[
	    	jArray14[0].cnt,
			jArray14[1].cnt,
			jArray14[2].cnt,
			jArray14[3].cnt,
			jArray14[4].cnt,
			jArray14[5].cnt],
	    backgroundColor:['rgba(30, 144, 255, 0.2)'],
	    borderWidth:0
	}

const standard = {
            label:'스탠다드',
            data:[
            	jArray4[0].cnt,
				jArray4[1].cnt,
				jArray4[2].cnt,
				jArray4[3].cnt,
				jArray4[4].cnt,
				jArray4[5].cnt],
            backgroundColor:['rgba(30, 144, 255, 0.8)'],
            borderWidth:0
}
const premium = {
        label:'프리미엄',
        data:[
        	jArray5[0].cnt,
			jArray5[1].cnt,
			jArray5[2].cnt,
			jArray5[3].cnt,
			jArray5[4].cnt,
			jArray5[5].cnt],
        backgroundColor:['rgba(30, 144, 255, 0.4)'],
        borderWidth:0
}
const data1 = {
	    labels:[
	    	jArray1[0].ym,
			jArray1[1].ym,
			jArray1[2].ym,
			jArray1[3].ym,
			jArray1[4].ym,
			jArray1[5].ym
			],
	    datasets:[
	    	esticount,
	    	apart,
	    	villa,
	    	officetel,
	    	detachedhouse	    	
	    ]
	}
const data2 = {
    labels:[
    	jArray1[0].ym,
		jArray1[1].ym,
		jArray1[2].ym,
		jArray1[3].ym,
		jArray1[4].ym,
		jArray1[5].ym
		],
    datasets:[
    	esticount,
    	standard,
    	premium
    ]
}
const options = {
        /* maintainAspectRatio :false,//그래프의 비율 유지 */
        scales:{
            x:{ //x축값 누적
                stacked:true
            },
            y:{ //y축값 누적
                stacked:true
            },
        }
}
const ctx = document.getElementById('myChart');
const Chart1 = new Chart(ctx, {
    type:'bar',
    data:data1,
    options:options
});


const ctx2 = document.getElementById('myChart2');
const Chart2 = new Chart(ctx2, {
     type:'bar',
     data:data2,
     options:options     
 });
 
 </script>
</main>
<%@include file="footer.jsp"%>