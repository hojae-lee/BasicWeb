<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03If.jsp</title>
</head>
<body>
<!-- 
if태그 : 
	-JSTL의 if문은 시작태그와 종료태그를 통해서 조건을 판단한다.
	-else문이 없기 때문에 조건이 여러개 일떄는 표현하기가 어렵다.
	이 떄는 주로 choose문을 사용한다.
 -->
	<h2>if태그</h2>
	<c:set var="numVar" value="100" />
	<c:set var="strVar" value="JAVA" />
	
	<h3>JSTL의 if태그로 짝수/홀수 판단하기</h3>
	<!-- 
		if(numVar%2==0) 와 동일한 조건으로 if문 작성됨. 
		해당 조건의 결과는 result에 저장됨.
	 -->
	<c:if test="${numVar mod 2 eq 0 }" var="result">
		${numVar }는 짝수입니다. <br />
	</c:if>
	\${result } : ${result } <br />
	
	<h3>위 if문을 EL식의 삼항식으로 표현</h3>
	${numVar } : ${numVar mod 2 == 0 ? "는 짝수" : "는 홀수" }
	
	<h3>문자열 비교</h3>
	<!-- 
		JSTL의 if문은 else가 없기 때문에 참 or 거짓의 형태로 만들때는 아래와 같이 참인조건
		거짓인 조건으로 각각의 if문의 블럭을 만들어야 한다.
	 -->
	<c:if test="${JAVA eq '자바' }">
		${strVar }는 자바다 <br />
	</c:if>
	
	<c:if test="${JAVA ne '자바' }">
		${strVar }는 자바가 아니다. <br />
	</c:if>
	
	<h2>if문 사용시 주의사항</h2>
	<!-- 
		test속성에 EL식이 아닌 일반값이 들어가면 무조건 false를 반환한다.
		EL식이더라도 {}양쪽에 빈공백이 들어가게 되면 무조건 false를 반환한다.
		단 일반값이더라도 true인 경우에는 true를 반환한다.
	 -->
	
	<h3>항상 출력되거나 출력되지 않는 조건식</h3>
	
	<c:if test="${true }" >
	난 절대 출력돼~
	</c:if>
	<c:if test="${false }" >
	난 절대 출력되지 않아~.
	</c:if>
	
	<h3>test속성에 일반값으로 조건지정</h3>
	<c:if test="100" var ="result">
		100은 일반값이므로 무조건 false 반환
	</c:if>
	\${result } : ${result } <br />
	
	<c:if test="tRue" var="result">
		TRUE(true) 대소문자 구분없음 항상 참임 <br />
	</c:if>
	\${result } : ${result } <br />
	
	<h3>EL식으로 조건판단시 {}양 쪽에 공백이 있으면 무조건 false로 판단됨</h3>
	<c:if test=" ${true } " var="result">
		빈 공백이 있으면 무조건 false처리됨
	</c:if>
	\${result } : ${result } <br />
	
	<h3>연습문제 if태그</h3>
	<form method="get">
		아이디 : <input type="text" name="user"/>
		<br />
		패스워드 : <input type="text" name="pass"/>
		<br />
		<input type="submit" value="로그인"/>
	</form>
	<!-- 
		아이디,패스워드를 입력후 submit 한 후 EL식을 통해 파라미터로 받은 후
		"kosmo", "1234" 인 경우 "kosmo님 하이룽~" 이라고 출력한다.
		만약 틀렸다면 "아이디와 비번을 확인하세요"를 출력한다.
		EL과 JSTL의 if태그만을 이용해서 구현 하시오.
	 -->
	 
	 <h2>내꺼</h2>
	 전송된 아이디 : ${param.user }
	 <br />
	 전송된 패스워드 : ${param.pass }
	 <br />
	 
	 
	 <c:if test = "${param.user eq 'kosmo' and param.pass eq '1234'}" var="login">
	 	${param.user }님 하이룽~
	 	<br />
	 </c:if>
	 
	 <c:if test = "${param.user ne null or param.pass ne null  }" var="login">
		 <c:if test = "${param.user ne'kosmo' or param.pass ne '1234'}" var="login">
		 	"${param.user }와 ${param.pass }을 확인하세요"
		 	<br />
		 </c:if>
	 </c:if>
	 
	 <h2>샘 꺼</h2>
	 <c:if test="${not empty param.user }">
		 전송된 아이디 : ${param.user }
		 <br />
		 전송된 패스워드 : ${param.pass }
		 <br />
		 
		<c:if test = "${param.user eq 'kosmo' and param.pass eq '1234'}" var="login">
		 	${param.user }님 하이룽~
		 	<br />
		 	<c:if test="${not login }">
		 		아이디와 비번을 확인하세욤
		 	</c:if>
		</c:if>
	 
	 </c:if>
	 

</body>
</html>