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

String sql1 = "select round(to_char(order_date,'yyyymm')) ymm ,count(*) cnt1 from shop_order where order_date>=add_months(sysdate,-6) group by round(to_char(order_date,'yyyymm')) order by ymm asc";
//최근 6개월간 판매횟수
Connection con2 = DBCon.getconConnection();
PreparedStatement pstmt2 = con2.prepareStatement(sql1);
ResultSet rs2 = pstmt2.executeQuery();

JSONArray arr2 = new JSONArray();
while (rs2.next()) {
	JSONObject obj2 = new JSONObject();
	String ym = rs2.getString("ymm");
	String cnt = rs2.getString("cnt1");
	obj2.put("ym", ym);
	obj2.put("cnt", cnt);
	if (obj2 != null) {
		arr2.add(obj2);
	}
}

rs2.close();
pstmt2.close();
con2.close();

String sql2 = "select round(to_char(order_date,'yyyymm')) ym, sum(total_price) sum from shop_order where order_date>=add_months(sysdate,-6) group by round(to_char(order_date,'yyyymm')) order by ym asc";

Connection con3 = DBCon.getconConnection();
PreparedStatement pstmt3 = con3.prepareStatement(sql2);
ResultSet rs3 = pstmt3.executeQuery();

JSONArray arr3 = new JSONArray();
while (rs3.next()) {
	JSONObject obj3 = new JSONObject();
	String ym = rs3.getString("ym");
	String sum = rs3.getString("sum");
	obj3.put("ym", ym);
	obj3.put("sum", sum);
	if (obj3 != null) {
		arr3.add(obj3);
	}
}
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
				<button onclick="updateData();">업데이트</button>
				<button onclick="updateData2();">되돌리기</button>
				<canvas id="myChart2"></canvas>
			</div>
		</div>
	</div>
	<script type="text/javascript">
var jArray1 = new Array();
jArray1 = '<%=arr1%>';
/* 파싱 */
jArray1 = JSON.parse(jArray1);

var jArray2 = new Array();
jArray2 = '<%=arr2%>';
/* 파싱 */
jArray2 = JSON.parse(jArray2);

var jArray3 = new Array();
jArray3 = '<%=arr3%>';
/* 파싱 */
jArray3 = JSON.parse(jArray3);


const ctx = document.getElementById('myChart');

new Chart(ctx, {
	type: 'line',
	data : {
		labels : [ 
			jArray1[0].ym,
			jArray1[1].ym,
			jArray1[2].ym,
			jArray1[3].ym,
			jArray1[4].ym,
			jArray1[5].ym
			],
		datasets : [{
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
			}
		}
	
	}
});

const ctx2 = document.getElementById('myChart2');
/* 
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
			}
		}
	}
}); */

const data = {
		  labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
		  datasets: [{
		    label: 'Example Dataset',
		    data: [12, 19, 3, 5, 2, 3],
		    backgroundColor: ['red', 'blue', 'yellow', 'green', 'purple', 'orange'],
		  }]
		};

function updateData() {
	  const newData = [25, 10, 5, 15, 20, 12];

	  chart.data.datasets[0].data = newData;
	  chart.update();
	}
	
function updateData2(){
	const oldData= [12, 19, 3, 5, 2, 3];
	chart.data.datasets[0].data = oldData;
	chart.update();
}
const chart = new Chart(ctx2, {
	  type: 'bar',
	  data: data,
	  options: {
	    responsive: true,
	    scales: {
	      y: {
	        beginAtZero: true
	      }
	    }
	  }
	});

</script>
</main>
<%@include file="footer.jsp"%>