<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JQ02Get.jsp</title>
<script src="../jquery/jquery-3.4.1.js"></script>
<script>
   /*
      $('#naver').get(0)은 jQuery 객체가 아닌 자바스크립트의 dom객체를 선택한다.
      즉, 자바스크립트와 혼용해서 사용해야 할때 유용하게 사용할수 있다. 
   */
   $(document).ready(function(){
      //$(엘리먼트 선택자)
      $('#naver').click(function(){
         alert($('#naver').get(0).href);
      });
   });
   /*
      위 jQuery 코드를 JS로 구현하면 아래와 같다. get()메소드는 JS의 getElementById()와 같은 역활을한다.
   */
   function daumClick(){
      var daum = document.getElementById("daum");
      alert(daum.href);
   }
</script>
</head>
<body>
   <h2>get()메소드</h2>
   <ul>
      <li>
         <a href="#http://www.naver.com" id="naver">
            네이버
         </a>
      </li>
      <li>
         <a href="#Daum" alt="Daum입니다." id="daum" onclick="daumClick();">
            다음
         </a>
      </li>
   </ul>

</body>
</html>