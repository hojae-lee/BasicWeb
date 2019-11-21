<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.MemberDTO"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>05ForEachExtend.jsp</title>
</head>
<body>
	<h2>확장 for문 형태의 forEach태그</h2>
	<%
	String[] colors = {"red","green","blue","#573838"};
	%>
	<h3>JSP코드로 배열출력</h3>
	<% for(String c : colors){ %>
		<h4 style="color:<%=c %>;">JSP코드로 출력</h4>
	<% } %>
	
	<h3>JSTL 및 EL로 배열출력</h3>
	<c:set var="colors" value="<%=colors %>" />
 	<c:forEach items ="${colors }" var="c">
 		<h4 style="color:${c};">
 			JSTL로 출력
 		</h4>
	</c:forEach>
	
	<!-- 
	확장형 forEach태그의 varStatus속성
	
	-index : 현재 루프내에서의 인덱스를 표시한다. 0부터 시작한다.
	 -->
	<h3>varStatus속성 알아보기</h3>
	<c:forEach items ="${colors }" var="c" varStatus="loopStatus" >
		<h4>${loopStatus.count } 번째 반복</h4>
		<ul>
			<li>index : ${loopStatus.index }</li>
			<li>first : ${loopStatus.first }</li>
			<li>last : ${loopStatus.last  }</li>
			<li>current : ${loopStatus.current }</li>
		</ul>	
	</c:forEach>
	
	<h3>리스트 계열의 컬렉션</h3>
	<%
	List lists = new Vector();
	lists.add(new MemberDTO("Hong","1111","홍씨",null));
	lists.add(new MemberDTO("park","2222","박씨",null));
	lists.add(new MemberDTO("quark","3333","퀅씨",null));
	%>
	
	<c:set var ="lists" value="<%=lists %>" />
	<h3>일반 for문 형태의 jSTL의 forEach태그</h3>
	<ul>
		<c:forEach begin="0" end="${lists.size()-1 }" var="i">
			<li>
				아이디:${lists[i].id },
				패스워드:${lists[i].pass },
				이름:${lists[i].name }
			</li>
		</c:forEach>
	</ul>
	
	<h3>확장 for문 형태의 JSTL forEach태그</h3>
	<ul>
		<c:forEach items="${lists }" var="list">
			<li>
				아이디:${list.id },
				패스워드:${list.pass },
				이름:${list.name }
			</li>
		</c:forEach>
	</ul>
	
	<h3>맵 계열 컬렉션 사용</h3>
	
	<%
	Map maps = new HashMap();
	maps.put("first",lists.get(0));
	maps.put("second",lists.get(1));
	maps.put("third",lists.get(2));
	%>
	<c:set var="maps" value="<%=maps %>" />
	
	<h4>키값을 알고 있을떄 :EL 변수 키값 혹은 EL변수["zlrkqt"]</h4>
	<ul>
		<li>
			아이디:${maps.first.id },
			비번:${maps.first.pass },
			이름:${maps.first.name }
		</li>
		<li>
			아이디:${maps.second.id },
			비번:${maps.second.pass },
			이름:${maps.second.name }
		</li>
		<li>
			아이디:${maps.third.id },
			비번:${maps.third.pass },
			이름:${maps.third.name }
		</li>
	</ul>
	
	<h4>키값을 모를떄 :확장 for문 사용</h4>
	<%--
	루프내에서 객체를 전달한 변수 map을 통해 맵의 Key값과 Value값을 알아낼수 있따.
		키값 : ${맵의 이름.key}
		벨류값 : ${맵의 이름.value}
	--%>
	<ul>
		<c:forEach items="${maps }" var="map">
		<li>
			<dl>
				<dt>Key값:${map.key }</dt>
				<dd>Value값=>
						아이디:${map.value.id },
						비번:${map.value.pass },
						이름:${map.value.name }
				</dd>
			</dl>
		</li>
		</c:forEach>
	</ul>
	
	
</body>
</html>