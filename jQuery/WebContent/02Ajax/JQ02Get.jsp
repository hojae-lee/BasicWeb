<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JQ02Get.jsp</title>
<script src="../jquery/jquery-3.4.1.js" ></script>
<script>
	/*
	$.get() 메소드
		: HTTP Get방식을 통해 서버로투버 데이터를 받을때 사용한다.
	사용법
		$.get(url,param, success(data));
	-url : 정보를 요청할 서버의 url
	-param : 서버로 전송할 파라미터 단 반드시 jSON형식으로 전달해야 한다.
	-success(data) : 요청이 성공했을때 실행된 CallBack(콜백)메소드.
		콜백메소드로 전달되는 파라미터를 통해 성공 혹은 실패여부를 판단할수 있따.
		
	※$.get() 메소드와 $.post()메소드는 사용법이 완전히 동일하다.
	※서버로 요청시 파라미터가 업을경우에는 생략이 가능하다.
	*/
	
	/*
	파라미터 조립하기
		:$.get()메소드나 $.post()메소드를 통해 서버로 요청할떄 파라미터가 필요한 경우에는
		반드시 JSON형태로 조립한 후 전송해야 한다.
		하지만 폼값이 많아서 힘들때는 serialize()메소드를 사용한다.
		
		$('#폼이름').serialize()
			-> 해당 메소드를 사용하면 form하위 요소에 대해
			{'키':'값'} 형태로 조립된다. 단 input 요소의 name속성값이
			'키'로 사용된다는것에 주의해야 한다.
	*/
	$(function(){
		$('#btnXml').click(function(){
			$.get('./common/02NameCard.xml',
				function(data){
					//alert(data);
					$(data).find("명함").each(function(){
						var html = "<div>이름:"+
								$(data).find("성명").attr("이름")+"</div>";
						html += "<div>주소:"+
								$(data).find("주소").text()+"</div>";
						html += "<div>직위:"+  
								$(this).find("직위").text()+"</div>";
						html += "<div>이메일:"+
								$(this).find("e-mail").text()+"</div>";
						html += "<div>핸드폰:"+
								$(this).find("Mobile").text()+"</div>";
						html += "<div>전화번호:"+
								$(this).find("TEL").text()+"</div>";
						html += "<div>카피라이트:"+
								$(this).find("copyright").text()+"</div>";
								
						//$('#xmlDisplay').html(html);
						
						/*
						해당영역을 empty()로 비운후 append()로 추가한다.
						*/
						$('#xmlDisplay').empty();
						$('#xmlDisplay').append(html);
					});
			});
		});
		$('#btnJsp').click(function(){
			$.get(
				/*
				인자1: 요청URL
				*/
				'./common/02PrintToday.jsp',
				/*
				인자2: 파라미터
				*/
				{
					'msg' : $(this).text(),
					'varStr' : '튜브조아'
				},
				/*
				인자3: 콜백메소드
				*/
				
				function(data){
					alert(data);
					$('#jspDisplay').html(data);
				}
			);
		});
	});

	
	function locationGo(link){
		window.open(link,'','width=500,height=500');
	}
</script>
</head>
<body>
	<div class="container">
		<h2>$get()메소드 사용하기</h2> 
		
		<h3>xml파일 읽어오기</h3>
		<button class="btn" onclick="locationGo('./common/02NameCard.xml');">
			NameCard.xml바로가기
		</button>
		
		<button class="btn btn-info" id="btnXml">
			XML데이터 읽어오기
		</button>
		
		<div class="displayDiv" id="xmlDisplay">
			XML데이터정보를 디스플레이합니다.   
		</div>
	</div>
	
	<h3>jsp파일에서 읽어오기</h3>
	<button class="btn btn-warning" onclick="locationGo('./common/02PrintToday.jsp?msg=안녕하세요&varStr=튜브조아');">
		PrintToday.jsp바로가기
	</button>
	<button class ="btn btn-success" id="btnJsp">
		JSP결과 읽어오기
	</button>
	<div class="disDisplay" id="jspDisplay">
		JSP결과를 디스플레이 합니다.
	</div>
</body>
</html>