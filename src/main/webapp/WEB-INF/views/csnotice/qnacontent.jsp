<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<script>
	function replyform() {
		/* alert("x"); */
 		var target = event.target;
		var rnbno = $(target).data("rnbno"); 
		
		var hiddenDiv = document.getElementById(rnbno+"replyform");
		
		hiddenDiv.style.display = "block";
	}

	function replyformclose() {
		/* alert("x"); */
 		var target = event.target;
		var rnbno = $(target).data("rnbno"); 
		
		var hiddenDiv = document.getElementById(rnbno+"replyform");
		
		hiddenDiv.style.display = "none";
	}
</script>

<body>
	<h3>qna content</h3>

	<table>
		<tr>
			<td class="left">번호</td>
			<td>${qna_content.nbno }</td>
		</tr>
		<tr>
			<td class="left">조회수</td>
			<td>${qna_content.nbhit }</td>
		</tr>
		<tr>
			<td class="left">글분류</td>
			<td>${qna_content.nbqnadiv }</td>
		</tr>
		<tr>
			<td class="left">작성자</td>
			<td>${qna_content.nbwriter }</td>
		</tr>
		<tr>
			<td class="left">제목</td>
			<td>${qna_content.nbtitle }</td>
		</tr>
		<tr>
			<td class="left">내용</td>
			<td>${qna_content.nbcontent }</td>
		</tr>
		<tr>
			<td class="left">날짜</td>
			<td>${qna_content.nbdate }</td>
		</tr>
		<tr>
			<td class="left">파일</td>
			<td>${qna_content.nbfilecode }</td>
		</tr>
		<tr>
			<td colspan="2"><a href="qnaeditview?nbno=${qna_content.nbno }">수정</a>
				<a href="qnadelete?nbno=${qna_content.nbno }">삭제</a> <a
				href="qnalist">목록으로</a> <br /></td>
		</tr>
	</table>

	<hr />


	<form action="qnareply?nbno=${qna_content.nbno }" method="post">
		<table border="1px">
			<tr>
				<td class="">답글 달기</td>
				<td class="">작성자</td>
			</tr>
			<tr>
				<td><textarea rows="6" cols="65" name="qnareply"></textarea></td>
				<td><input type="text" name="qnarewriter" /></td>
				<td><input type="submit" value="답변" /></td>
			</tr>
		</table>
	</form>
	<hr />
	<h3>답글 ${replycnt}개</h3>

	<c:forEach items="${replylist }" var="dto">
		<div>
			<span><h3>작성자 : ${dto.rnbwriter } &nbsp;&nbsp; 답글 :
					${dto.rnbcontent }</h3></span>


			<!--답글 달기 버튼을 클릭 시에 아래에 입력 창이 나타나도록 하는 스크립트-->
			<button onclick="replyform()" data-rnbno="${dto.rnbno }">답글달기</button>
		</div>


		<c:forEach items="${replyrlist}" var="rdto">
			<div<%-- id="${dto.rnbno }replyview"  style="display: none;" --%>>
				<p>${rdto.rnbwriter }&nbsp;&nbsp; 답글 : ${rdto.rnbcontent }</p>
			</div>
		</c:forEach>

		<!--숨겨진 div, id 값을 조회한 답글 번호로 지정하여 위의 스크립트에서 버튼을 각각의 div를 따로 적용-->
		<div id="${dto.rnbno }replyform" style="display: none;">
			<div>

				<input type="hidden" id="rnbno" name="rnbno" value="${dto.rnbno }" />
				<input type="hidden" id="nbno" name="nbno" value="${dto.nbno }" /> 
				<input type="hidden" id="rnbstep" name="rnbstep" value="${dto.rnbstep }" />
				<input type="hidden" id="rnbgroup" name="rnbgroup" value="${dto.rnbgroup }" /> 
				<input type="hidden" id="rnbindent" name="rnbindent" value="${dto.rnbindent }" /> 
				
				
				<textarea rows="6" cols="65" id="rcontent" name="rcontent">&nbsp;</textarea>
				<input type="text" name="rwriter" id="rwriter" /> 
				<input type="button" value="입력" onclick="reply()" />
			</div>
			<button onclick="replyformclose()" data-rnbno="${dto.rnbno }">접기</button>
		</div>


	</c:forEach>

	<script>
	
	var listLoad=false;
	
		function reply() {
			var parent = event.target.parentElement;
			var replyArea = parent.parentElement;
			
			
			if (!listLoad) {
				
			$.ajax({
				type: "post",
				async: true,
				url: "reply",
				data: {
					"rnbno" : $(parent).find("#rnbno").val(),
					"nbno" : $(parent).find("#nbno").val(),
					"rnbstep" : $(parent).find("#rnbstep").val(),
					"rnbgroup" : $(parent).find("#rnbgroup").val(),
					"rnbindent" : $(parent).find("#rnbindent").val(),
					"rcontent" : $(parent).find("#rcontent").val(),
					"rwriter" : $(parent).find("#rwriter").val()
					
				},
				success: function(data) {
					console.log("success");
					console.log(data);
					
					$(parent).find("#rwriter").val('');
			        $(parent).find("#rcontent").val('');
					/* $(parent).remove(); */
					/* $(parent).find("#rcontent").remove(); */
					
					var htmlText = "<p>";
					
					for (var i = 0; i < data.length; i++) {
						console.log(data[i].rnbcontent);
						htmlText += data[i].rnbcontent;
					htmlText += "<p>";
					}
					
					
					$(replyArea).prepend(htmlText);
					
					listLoad = true;
				}
				
			});
			}
			
			else if (listLoad) {
				
			$.ajax({
				type: "post",
				async: true,
				url: "reply",
				data: {
					"rnbno" : $(parent).find("#rnbno").val(),
					"nbno" : $(parent).find("#nbno").val(),
					"rnbstep" : $(parent).find("#rnbstep").val(),
					"rnbgroup" : $(parent).find("#rnbgroup").val(),
					"rnbindent" : $(parent).find("#rnbindent").val(),
					"rcontent" : $(parent).find("#rcontent").val(),
					"rwriter" : $(parent).find("#rwriter").val()
					
				},
				success: function(data) {
					console.log("success");
					console.log(data);
					
					$(parent).find("#rwriter").val('');
			        $(parent).find("#rcontent").val('');
					/* $(parent).remove(); */
					/* $(parent).find("#rcontent").remove(); */
					
					var htmlText = "<p>";
					var lastIndex = data.length - 1;
					
						console.log(data[lastIndex].rnbcontent);
						htmlText += data[lastIndex].rnbcontent;
					
					htmlText += "<p>";
					
					$(replyArea).prepend(htmlText);
					
					listLoad = true;
				}
			})
			}
		}
		
	</script>
</body>
</html>