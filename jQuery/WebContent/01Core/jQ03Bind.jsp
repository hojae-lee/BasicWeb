<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JQ03Bind.jsp</title>
<script src="../jquery/jquery-3.4.1.js"></script>
<style>
   div{
      width:500px; height:130px;
      text-align:center; font-size:1.5em;
      border:1px dotted black;
   }
   input{ width:200px; height:100px; margin-top:20px;}
</style>
<script>
   $(document).ready(function(){
      /*
      bind()메소드 : 이벤트를 여러개 연결하고 싶을때 사용
      unbind()메소드: 이벤트를 해제할때 사용하는 메소드
      
      */
      $('#click_change')
         .bind("mouseover", function(){
            //마우스 오버시 배경색을 빨간색으로 변경
            document.getElementById("click_change")
               .style.backgroundColor="red";
         })
         .bind("mouseout",function(){
            //마우스 아웃시 배경생을 흰색으로 변경
            $(this).get(0).style
               .backgroundColor="white";
         })   
         .bind("click",function(){
            /*
            text() : JS의 innerText와 같은 역활을 하는 jQuery의 메소드
            */
            alert($(this).text());
         });
      $('#btnClick').click(function(){
         alert('버튼 클릭됨');
      });
      $("#btnEventClear").bind('click',function(){
         /*
         해당코드가 실행되면 #btnClick버튼을 눌러도 아무런 방으이 없게된다. 즉click이벤트가 제거된다.
         */
         $('#btnClick').unbind('click');
         alert('#btnClick의 이벤트가 제거됨');
      });
         
   });
   
</script>
</head>
<body>
   <h2>bind()메소드</h2>
   <div id="click_change">
      마우스를 over하면 red로 변하고 <br />
      마우스를 out하면 whilte로 변하고 <br />
      마우스를 click하면 여기 내용이 
      경고창(alert)으로 뜬데요~
   </div>
   <h2>unbind()메소드</h2>
   <input type="button" id="btnClick" value="난버튼"/>
   <input type="button" id="btnEventClear" value="이벤트제거버튼" />

</body>
</html>