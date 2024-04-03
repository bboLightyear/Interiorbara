<%@page import="com.tech.ibara.csnotice.dto.QnaDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>


<body>
    <%-- <%session.setAttribute("userId",null);%> --%> 
    <%session.setAttribute("userId","cus");%>   
   
   <p> <%= session.getAttribute("userId") %></p>
   <% System.out.println("userId 값 : "+session.getAttribute("userId")); %>
   
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
         
         <c:forEach items="${imglist}" var="dto">
            <td>
               <img src="../resources/upload/cs/${dto.filesrc}" alt="이미지" /> 
            </td>
         </c:forEach>
      </tr>
      <tr>
         <td>
            <%
             // qna_content에 담긴 nbwriter 출력하기
            QnaDto qna_content = (QnaDto) request.getAttribute("qna_content");
             String nbwriter = qna_content.getNbwriter();
             System.out.println("nbwriter 값: " + nbwriter);
             
             String userId=(String)session.getAttribute("userId");
             
            if( userId.equals(nbwriter)){ %>
            <a href="qnaeditview?nbno=${qna_content.nbno }">수정</a>
            <a href="qnadelete?nbno=${qna_content.nbno }">삭제</a> 
            <a href="qnalist">목록으로</a> <br />
            <% }else{
            %>
            <a href="qnalist">목록으로</a> <br />
            <% 
            }%>
            
         </td>
      </tr>
   </table>

   <hr />

   <%
   if(session.getAttribute("userId")==null){
      
   }else{
   %>
   
   <form action="qnareply?nbno=${qna_content.nbno }" method="post">
      <table border="1px">
         <tr>
            <td class="">답글 달기</td>
            <td class="">작성자</td>
         </tr>
         <tr>
            <td><textarea rows="6" cols="65" name="qnareply"></textarea></td>
            <td><input type="hidden" name="qnarewriter" value="<%=session.getAttribute("userId") %>"/><%=session.getAttribute("userId") %></td>
            <td><input type="submit" value="답변" /></td>
         </tr>
      </table>
   </form>
   <% } %>
   <hr />
   <h3>답글 ${replycnt}개</h3>

   <!--전체 글에 대한 답글 조회  -->
   <c:forEach items="${replylist }" var="dto">
      <div>
         <span><h3>작성자 : ${dto.rnbwriter }&nbsp;&nbsp; 답글 :
               ${dto.rnbcontent }&nbsp;&nbsp;</h3></span>

         <!--답글 달기 버튼을 클릭 시에 아래에 입력 창이 나타나도록 하는 스크립트-->
         <%
         if(session.getAttribute("userId")==null){
            
         }else{
         %>
         <button onclick="replyform()" data-rnbno="${dto.rnbno }">답글달기</button>
         <% } %>
      </div>

      <div id="${dto.rnbno }replyrview" style="display: block;">


         <input type="button" onclick="replyrview()"
            id="${dto.rnbno }replyvbtn" name="${dto.rnbno }replyvbtn"
            data-rnbno="${dto.rnbno }" value="답글보기" />
      </div>


      <!--숨겨진 div, id 값을 조회한 답글 번호로 지정하여 위의 스크립트에서 버튼을 각각의 div를 따로 적용-->
      <div id="${dto.rnbno }replyform" style="display: none;">
         <div>

            <input type="hidden" id="rnbno" name="rnbno" value="${dto.rnbno }" />
            <input type="hidden" id="nbno" name="nbno" value="${dto.nbno }" />
            <input type="hidden" id="rnbstep" name="rnbstep"
               value="${dto.rnbstep }" /> <input type="hidden" id="rnbgroup"
               name="rnbgroup" value="${dto.rnbgroup }" /> <input type="hidden"
               id="rnbindent" name="rnbindent" value="${dto.rnbindent }" />

            <textarea rows="6" cols="65" id="rcontent" name="rcontent">&nbsp;</textarea>
            <input type="hidden" name="rwriter" id="rwriter" value="<%=session.getAttribute("userId") %>"/> 
            <input type="button" value="입력" onclick="reply()" data-rnbno="${dto.rnbno }" />
         </div>
         <button onclick="replyformclose()" data-rnbno="${dto.rnbno }">접기</button>
      </div>

   </c:forEach>

   <script>
   var viewbtn=false;
   
      // 답글보기 버튼 처리
      function replyrview() {
         var target = event.target;
         var rnbno = $(target).data("rnbno");

         console.log(rnbno);
   
         var parent = event.target.parentElement;
         var replyArea = document.getElementById(rnbno + "replyrview");
         var replyvbtn = document.getElementById(rnbno + "replyvbtn");

         $.ajax({
            type : "post",
            async : true,
            url : "replyview",
            data : {
               "rnbno" : rnbno
            },
            success : function(data) {
               console.log("success");
               console.log(data);
               
               viewbtn=true;
               
               var htmlText = "";

               for (var i = 0; i < data.length; i++) {

                  htmlText += "<p>";
                  console.log(data[i].rnbcontent);
                  htmlText += data[i].rnbcontent;
                  htmlText += "</p>";
               }

               // div 못 불러오는 거 확인하는 if문
               if (replyArea) {
                  $(replyArea).append(htmlText);
               } else {
                  console.error("replyArea is null or undefined");
               }

               replyvbtn.remove();
            }
         })
      }
      // 답글 폼 보이게 하는 스크립트 
      function replyform() {
         /* alert("x"); */
         var target = event.target;
         var rnbno = $(target).data("rnbno");
         var hiddenDiv = document.getElementById(rnbno + "replyform");

         hiddenDiv.style.display = "block";
      }

      // 답글 폼 닫는 스크립트
      function replyformclose() {
         /* alert("x"); */
         var target = event.target;
         var rnbno = $(target).data("rnbno");

         var hiddenDiv = document.getElementById(rnbno + "replyform");

         hiddenDiv.style.display = "none";
      }

      function reply() {
         var target = event.target;

         var rnbno = $(target).data("rnbno");
         var parent = event.target.parentElement;
         var replyArea = document.getElementById(rnbno + "replyrview");

         $.ajax({
            type : "post",
            async : true,
            url : "reply",
            data : {
               "rnbno" : $(parent).find("#rnbno").val(),
               "nbno" : $(parent).find("#nbno").val(),
               "rnbstep" : $(parent).find("#rnbstep").val(),
               "rnbgroup" : $(parent).find("#rnbgroup").val(),
               "rnbindent" : $(parent).find("#rnbindent").val(),
               "rcontent" : $(parent).find("#rcontent").val(),
               "rwriter" : $(parent).find("#rwriter").val()

            },
            success : function(data) {
               console.log("success");
               console.log(data);

               $(parent).find("#rwriter").val('');
               $(parent).find("#rcontent").val('');

               var htmlText = "";
               var lastIndex = data.length - 1;

               console.log('lastindex' + lastIndex);

               console.log(data[lastIndex].rnbcontent);

               console.log(viewbtn);
               
               if (viewbtn==true) {   
                  
               htmlText += "<p>";
               htmlText += data[lastIndex].rnbcontent;
               htmlText += "</p>";

               // replyArea 요소가 존재하는지 확인
               if (replyArea) {
                  // 생성된 HTML을 replyArea에 추가
                  $(replyArea).append(htmlText);
               } else {
                  console.error("replyArea is null or undefined");
               }
               
               }
            }
         })
      }
   </script>
</body>
</html>