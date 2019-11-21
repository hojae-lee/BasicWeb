<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- PassMessage.jsp --%>
<%-- 
	패스워드 검증을 마친 후 결과에 따라 alert메시지를 띄워주고
	mode값에 따라 수정혹은 삭제 페이지로 이동한다.
	mode->edit라면 수정페이지로 이동한다.
	mode->delete라면 즉시 삭제처리한다. 삭제는 이미 앞에서 패스워드 검증을 마친 후 현재페이지로 진입하므로 
	추가적인 확인을 필요없다.
 --%>
<c:choose>
	<c:when test="${param.mode=='edit' }">
		<c:set var="moveUrl" value="/DataRoom/DataEdit?idx=${param.idx }&nowPage=${requestScope.nowPage }" />
	</c:when>
	<c:otherwise>
		<c:set var="moveUrl" value="/DataRoom/DataDelete?idx=${param.idx }&nowPage=${nowPage }" />
	</c:otherwise>
</c:choose>
<!-- 
	패스워드 검증 후
		성공이면 true값이 반환되므로 완료 메세지 후 수정페이지로 이동함 실패면 false이므로 실패
		메세지 후 패스워드 검증페이지로 이동함.
 -->
<script>
	<c:choose>
		<c:when test="${PASS_CORRECT }">
			alert("패스워드 검증완료");
			location.href="<c:url value='${moveUrl }' />";
		</c:when>
		<c:otherwise>
			alert("패스워드 검증실패 뒤로이동");
			history.back();
		</c:otherwise>
	</c:choose>
</script>