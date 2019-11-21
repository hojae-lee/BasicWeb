<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Vector"%>
<%@page import="model.MemberDTO"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 
    	JSP문서에서 JSTL을 사용하기 위한 페이지 지시어 선언
    	prefix : JSTL을 선언할 떄 사용할 접두어
    	uri : 지원 URL
     -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>01Set.jsp</title>
</head>
<body>
	<!-- 
	set 태그 속성
		var : 변수명. 문자열만 가능함
		value : 값. 표현식, EL식 모두 가능함
		scope : 문자열만 가능함.
			영역을 지정함 문자열만 가능하고 page~application 4가지 영역을
			지정할 수 있다. 기본값은 가장 좁은 영역인 page영역이다.
		※즉 set태그를 사용하여 변수를 설정하면 영역에 저장되게 된다.
	 -->
	 
	 <h2>set태그</h2>
	 <h3>set태그로 EL에서 사용할 변수 설정하기</h3>
	 <ul>
	 	<li>
	 	1.value속성에 직접 값 대입:
	 		<c:set var = "directVar" value = "100" />
	 	</li>
	 	<li>
	 	2.value속성에 EL로 값 대입:
	 		<c:set var = "elVar" value ="${directVar mod 5 }" />
	 	</li>
	 	<li>
	 	3.value속성에 표현식으로 값 대입:
	 		<c:set var = "expVar" value ="<%=new Date() %>" />
	 	</li>
	 	<li>
	 	4.시작태그와 종료태그 사이에 값 설정:
	 		<c:set var="betweenVar" >
	 		변수값 요러게 설정
	 		</c:set>
	 	</li>
	 </ul>
	 
	 <h3>set태그로 설정한 데이터 표현식으로 출력</h3>
	 <ul>
	 	<li>
	 		directVar :
	 			<%=pageContext.getAttribute("directVar") %>
	 	</li>
	 	<li>
	 		elVar :
	 			<%=pageContext.getAttribute("elVar") %>
	 	</li>
	 	<li>
	 		expVar :
	 			<%=pageContext.getAttribute("expVar") %>
	 	</li>
	 	<li>
	 		betweenVar :
	 			<%=pageContext.getAttribute("betweenVar") %>
	 	</li>
	 </ul>
	 
	 <h3>EL로 출력</h3>
	 <!-- 
	 	EL로 영역의 속성을 읽어올때 XXXScope를 생략하면 가종 좋은 page영역을 읽어오게 된다.
	 	즉 아래 코드는 모두 page영역의 속성을 가져온것이다.
	  -->
	 <ul>
	 	<li>directVar : ${pageScope.directVar }</li>
	 	<li>elVar : ${elVar }</li>
	 	<li>expVar : ${expVar }</li>
	 	<li>betweenVar : ${betweenVar }</li>
	 </ul>
	 
	 <h2>set태그로 각 영역에 객체저장하기</h2>
	 <c:set var ="pageVar" value ="페이지영역" scope ="page" />
	 <c:set var ="requestVar" value ="리퀘스트영역" scope ="request" />
	 <c:set var ="sessionVar" scope ="session">
	 세션영역
	 </c:set> 
	 <c:set var ="applicationVar" scope ="application">
	 어플리케이션영역
	 </c:set>
	 
	 
	 <h3>JSP코드로 출력</h3>
	 <ul>
	 	<li>
	 		pageVar :
	 			<%=pageContext.getAttribute("pageVar") %>
	 	</li>
	 	<li>
	 		requestVar :
	 			<%=request.getAttribute("requestVar") %>
	 	</li>
	 	<li>
	 		sessionVar :
	 			<%=session.getAttribute("sessionVar") %>
	 	</li>
	 	<li>
	 		applicationVar :
	 			<%=application.getAttribute("applicationVar") %>
	 	</li>
	 </ul>
	 
	 <h3>EL로 출력[xxxScope사용]</h3>
	 <ul>
	 	<li>pageVar : ${pageScope.pageVar }</li>
	 	<li>requestVar : ${requestScope.requestVar }</li>
	 	<li>sessionVar : ${sessionScope.sessionVar }</li>
	 	<li>applicationVar : ${applicationScope.applicationVar }</li>
	 </ul>
	 
	 <h3>EL로 출력[xxxScope미사용]</h3>
	 <ul>
	 	<li>pageVar : ${pageVar}</li>
	 	<li>requestVar : ${requestVar }</li>
	 	<li>sessionVar : ${sessionVar }</li>
	 	<li>applicationVar : ${applicationVar }</li>
	 </ul>
	 
	 <h2>set태그로 자바빈 객체설정</h2>
	 <h3>인자생성자로 설정</h3>
	 <c:set var="argsMember" value='<%=new MemberDTO("KIM","1111", "김태희",null) %>' scope = "request" />
	 
	 <h3>JSP코드로 출력</h3>
	 
	 <ul>
	 	<li>아이디:
	 	<%=((MemberDTO)request.getAttribute("argsMember")).getId() %>
	 	</li>
	 	<li>이름:
	 	<%=((MemberDTO)request.getAttribute("argsMember")).getName() %>
	 	</li>
	 </ul>
	 
	 <h3>EL로 출력</h3>
	 <ul>
	 	<li>아이디:${requestScope.argsMember.id }</li>
	 	<li>아이디:${argsMember.name }</li>
	 </ul>
	 
	 <!-- 
	 set태그의 target속성과 property속성은 자바빈 객체의 속성 혹은 컬렉션계열 객체의 값을 설정할때사용하는 속성이다.
	 
	 target : 변수값을 지정하는 속성으로 반드시 EL식이나 표현식만 가능하다.
	 property : 값을 지정하는 속성으로 표현식 or EL식 or 값 모두 가능하다.
	 자바빈인 경우 - 속성명(멤버변수)
	 Map 컬렉션 : 키값
	 
	 ※ scope 속성은 var속성이 지정한 태그에서만 지정이 가능하다.
	  -->
	 <h3>target속성과 property속성</h3>
	  <c:set var="defaultMember" value='<%=new MemberDTO() %>' scope = "request" />
	  
	  <c:set target="${defaultMember }" property="id" value="Jung" />
	  <c:set target="${defaultMember }" property="pass" value="9999" />
	  <c:set target="${defaultMember }" property="name" value="정지훈" />
	  
	  <h3>target 및 property 속성으로 설정후 출력</h3>
	  <ul>
	  	<li>아이디 : ${requestScope.defaultMember.id }</li>
	  	<li>아이디 : ${defaultMember.pass }</li>
	  	<li>아이디 : ${requestScope.defaultMember.name }</li>
	  </ul>
	 
	 <h2>List 컬렉션 이용하기</h2>
	 
	 <%
	 /*
	 List계열의 컬렉션은 배열과 같이 순서를 보장하고 인덱스로 접근가능하므로 객체에 접근할떄는 인덱스를 사용한다.
	 */
	 List list = new Vector();
	 list.add(request.getAttribute("defaultMember"));
	 list.add(request.getAttribute("argsMember"));
	 %> 
	 
	 <h4>1단계 : set태그로 리스트계열 컬렋션 설정</h4>
	 <c:set var ="list" value ="<%=list %>" scope ="request" />
	 <h4>target및 property속성으로 미 설정후 출력</h4>
	 <ul>
	 	<li>아이디:${requestScope.list[0].id }</li>
	 	<li>비번:${requestScope.list[0].pass }</li>
	 	<li>이름:${requestScope.list[0].name }</li>
	 </ul>
	 <ul>
	 	<li>아이디:${requestScope.list[1].id }</li>
	 	<li>비번:${requestScope.list[1].pass }</li>
	 	<li>이름:${requestScope.list[1].name }</li>
	 </ul>
	 
	 <h4>2단계 : target 및 property속성으로 속성값 변경</h4>
	 <c:set target="${list[0] }" property="id" value="BTS" />
	 <c:set target="${list[0] }" property="pass" value="0000" />
	 <c:set target="${list[0] }" property="name" value="방학소년단" />
	 
	 <h4>target및 property 속성으로 설정후 출력</h4>
	 <ul>
		 <li>아이디:${requestScope.list[0].id }</li>
		 <li>아이디:${requestScope.list[0].pass }</li>
	 	 <li>아이디:${requestScope.list[0].name }</li>
	 </ul>
	 
	 <h2>Map 컬렉션 이용하기</h2>
	 <%
	 /*
	 Map계열의 컬렉션인 경우 key값을 통해 접근한다. key를 통한 접근이 index를 통한 접근보다 빠르다고 알려져있다.
	 */
	 Map map = new HashMap();
	 map.put("def", request.getAttribute("defaultMember"));
	 map.put("args", request.getAttribute("argsMember"));
	 %>
	 <h4>1단계 : set태그로 맵 컬렉션 설정</h4>
	 <c:set var ="map" value="<%=map %>" scope="request" />
	 
	 <h4>2단계 : target 및 property속성으로 속성값 설정</h4>
	 <c:set target="${map.args }" property="id" value="AOA" />
	 <c:set target="${map.args }" property="pass" value="7777" />
	 <c:set target="${map.args }" property="name" value="설형짱" />
	 
	 <h4>속성값 변경 후 출력</h4>
	 <ul>
	 	<li>아이디: ${map.args.id }</li>
	 	<li>아이디: ${map.args.pass }</li>
	 	<li>아이디: ${map.args.name }</li>
	 </ul>
</body>
</html>