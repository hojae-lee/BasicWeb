<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DataList.jsp</title>
<style>
table{
	border: 1px solid;
	border-collapse: collapse; 
	border-color: #fbceb1;
}

a{ 
	text-decoration:none 
}

a:link {
	text-decoration: none; color: #333333;
}
a:visited {
	text-decoration: none; color: #333333;
}

</style>

</head>
<body>
	<!-- 액션태그를 통한 외부파일 인클루드 -->
	<jsp:include page="../common/CommonLink.jsp"/>
	<h2><span style="color:#ff7f00;">비회원제 게시판보기(List)[총게시물수:${map.totalCount }]</span></h2>
	
	<form method="get">
		<table border="1" width="90%" >
 
			<tr>
				<td align="center" style="background-color: #ff7f00">
					<select name="searchColumn">
							<option value="title">제목</option>
							<option value="content">내용</option>
					</select>
					<input type="text" name="searchWord" />
					<input type="submit" name="검색하기" value="Success" style= "border-color:#cb3837; color:white; background-color: #cb3837;"/>
				</td>
			</tr>
		</table>
	</form> 
	
	<!-- 글쓰기 버튼 -->
	<table border = "1" width="90%">
		<tr>
			<td align="right">
				<button type="button" onclick="location.href='./DataWrite';" style= "border-color:#cb3837; color:white; background-color: #cb3837;">글쓰기</button>
			</td>
		</tr>
	</table>
	
	<table border="1" width="90%">
		<tr>
			<th width="10%" style="background-color: #ffc790">번호</th>
			<th width="*" style="background-color: #ffc790">제목</th>
			<th width="15%" style="background-color: #ffc790">작성자</th>
			<th width="10%" style="background-color: #ffc790">조회수</th>
			<th width="15%" style="background-color: #ffc790">작성일</th>
			<th width="8%" style="background-color: #ffc790">첨부</th>
		</tr>
	<!-- 
		ListCtril 클래스에서 request 영역에 저장한 ResultSet을 JSTL과 EL을 통해 화면에 내용을 출력한다.
			choose
				when -> lists 컬렉션에 아무값도 없을 떄...
				otherwise -> ResultSet 결과가 있을 때...
	 -->
	<c:choose>
		<c:when test="${empty lists }">
			<tr>
				<td colspan="5" class= "text-cen">
					등록된 게시물이 업습니다.
				</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${lists }" var="row" varStatus="loop">
				<tr>
					<th style= "color: #f4721f;">
						${map.totalCount - (((map.nowPage-1) * map.pageSize) + loop.index) }
					</th>
					<td style="background-color: #f5f5dc;">
					<a href="../DataRoom/DataView?idx=${row.idx }&nowPage=${param.nowPage}">	
						${row.title }
					</a>
					</td>
					<td style="background-color: #f5f5dc;">${row.name }</td>
					<td style="background-color: #f5f5dc;">${row.visitcount }</td>
					<td style="background-color: #f5f5dc;">${row.postdate }</td>
					<td align="center" style="background-color: #f5f5dc;">
						<c:if test="${not empty row.attachedfile }">
							<a href="./Download?filename=${row.attachedfile }&idx=${row.idx }">
								<img src="../images/diskk.png" width="50" alt="" />   		 				
							</a>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>

	</table>
	
	<!-- 페이지번호 -->
	<table border="1" width="90%">
		<tr>
			<td align="center">
				<!-- <img src="../images/paging1.gif" alt="" />
				<img src="../images/paging2.gif" alt="" />
				1 2 3 4 5
				<img src="../images/paging3.gif" alt="" />
				<img src="../images/paging4.gif" alt="" /> -->
				${map.pagingImg}
			</td>
		</tr>
	</table>
	
</body>
</html>