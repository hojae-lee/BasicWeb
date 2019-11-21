<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>jQ07Css.jsp</title>
    <script src="../jquery/jquery-3.4.1.js"></script>
    <script>
        $(document).ready(function() {

			$('div').each(function(index) {
			    $(this).css({
			        'width': '500px',
			        'height': '200px',
			        'border': 'solid red 2px'
			    });
			});
			
			/*
			css()메소드 : JS에서 style을 제어하듯이 Css속성을 부여하거나
				속성값을 가져올수 있는 메소드
				
				사용법1 : 매개변수1,2를 통해 속성과 속성값을 설정한다.
					엘리먼트.css('속성1','값1').css('속성1','값2')
				사용법2 : JSON형태로 속성값을 한번에 전달한다.
					엘리먼트.css({'속성1':'값1',......})
					
				해당 속성에 값을 부여하고 싶을때
					엘리먼트.css('속성','값');
				해당 속성값을 가져오고 싶을떄
					변수 = 엘리먼트.css('속성');
			*/
		  	$('button').click(function() {
		  		//현재 설정된 폰트의 크기를 실시간으로 가져온다.
		        var size = parseInt($("#article1").css("font-size"));
		        if ($(this).text() == "기사늘리기") {
		            size += 2;
		        } 
		        else {
		            size -= 2;
		        }
		        $('div').css("fontSize", size + "px");
			});
        });

    </script>
</head>

<body>
    <h2>css()메소드</h2>
    <h3>뉴스기사 늘리기/줄이기</h3>

    <button id="big">기사늘리기</button>
    <button id="small">기사줄이기</button>

    <div id="article1" style="font-size: 12px;">
        여기는 뉴스기사가 나와요 <br />
        여기는 뉴스기사가 나와요 <br />
        여기는 뉴스기사가 나와요 <br />
    </div>
    <div id="article2" style="font-size: 12px;">
        여기는 뉴스기사가 나와요 <br />
        여기는 뉴스기사가 나와요 <br />
        여기는 뉴스기사가 나와요 <br />
    </div>

</body>

</html>
