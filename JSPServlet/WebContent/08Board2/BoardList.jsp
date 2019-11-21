<%@page import="util.PagingUtil"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.BbsDTO"%>
<%@page import="java.util.List"%>
<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//한글 깨짐 처리
request.setCharacterEncoding("UTF-8");

//Web.xml에 저장된 컨텍스트 초기화 파라미터 가져옴.
String drv = application.getInitParameter("JDBCDriver");
String url = application.getInitParameter("ConnectionURL");

//BbsDAO 객체 생성 및 DB연결
BbsDAO dao = new BbsDAO(drv, url);

/*
파라미터를 저장할 용도로 생성한 Map계열의 컬렉션
여러개의 파라미터가 존재할경우 한꺼번에 저장한 후 전달하기 위한 용도로 사용됨.
*/
Map<String,Object> param = new HashMap<String,Object>();

//폼값받기
String queryStr=""; //검색시 페이지번호로 쿼리스트링을 넘겨주기 위한 용도로 사용
String searchColumn = request.getParameter("searchColumn");
String searchWord = request.getParameter("searchWord");
if(searchWord != null){
	param.put("Column", searchColumn);
	param.put("Word", searchWord);
	
	queryStr = "searchColumn=" +searchColumn+ "&searchWord="+searchWord+"&";
}
//board테이블에 저장된 레코드 수 카운트
int totalRecordCount = dao.getTotalRecordCount(param);

/*********************페이지 처리 start****************************/
int pageSize = Integer.parseInt(application.getInitParameter("PAGE_SIZE"));
int blockPage = Integer.parseInt(application.getInitParameter("BLOCK_PAGE"));

//전체페이지수 계싼 => 125/10 => 12.xx => ceil(12.xx) =>13
int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);

//현재페이지 : 파라미터가 없을때는 무조건 1페이지로 지정한다. 즉 게시판에 처음으로
//				진입하면 페이지번호는 1이 된다.
int nowPage = (request.getParameter("nowPage")== null 
			||request.getParameter("nowPage").equals(""))? 1:Integer.parseInt(request.getParameter("nowPage"));

//한 페이지에 출력할 게시물의 범위를 결정(1~10,11~20 ...)
int start = (nowPage-1)*pageSize +1;
int end = nowPage * pageSize;

//범위 값을 Map컬렉션에 저장 후 Model로 전달.
param.put("start",start);
param.put("end",end);
/*********************페이지 처리 end****************************/

//게시판 리스트 화면에 출력할 레코드 가져옴.
List<BbsDTO> bbs = dao.selectListPage(param);

//DB자원반납
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardeList.jsp</title>
<style>
table{
	border: 1px solid;
	border-collapse: collapse;
	border-color: #fbceb1;
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
	<h2><span style="color:#ff7f00;">회원제 게시판보기(List)</span></h2>
	
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
				<button type="button" onclick="location.href='BoardWrite.jsp';" style= "border-color:#cb3837; color:white; background-color: #cb3837;">글쓰기</button>
			</td>
		</tr>
	</table>
	
	<table border="1" width="90%" >
		<tr>
			<th width="10%" style="background-color: #ffc790">번호</th>
			<th width="50%" style="background-color: #ffc790">튜브좋아</th>
			<th width="15%" style="background-color: #ffc790">작성자</th>
			<th width="10%" style="background-color: #ffc790">조회수</th>
			<th width="15%" style="background-color: #ffc790">작성일</th>
		</tr>
<%
/*
	컬렉션에 저장된 데이터가 있는지 확인하기 위해 isEmpty()함수 호출함.
*/
if(bbs.isEmpty()){
	//컬렉션에 저장된 데이터가 없는 경우
%>
		<tr>
			<td colspan="5" align="center">
				등록된 게시물이 없습니다 ^^!;
			</td>
		</tr>
<%
}
else
{
	//게시물의 가상번호. 1,2,3,4,5...이런 느낌 만약게시물이10개라면 10,9,8,7,6,5,4,3,2,1이런 느낌~.
	int vNum=0; 
	int countNum=0;
	
	/*
	컬렉션에 저장된 ResultSet의 갯수만큼 반복하면서 목록 출력
	*/
	for(BbsDTO dto : bbs){
		//가상번호 : 페이지 처리후에는 각 페이지에 따라 게시물의 가상번호가 변경되어야 한다.
		
		vNum = totalRecordCount - (((nowPage-1)*pageSize)+countNum++);
		/*
			전체게시물수 : 107개
			페이지사이즈 : 10
			
			현재페이지 : 1번
			첫번쨰 게시물 : 107- ((1-1*10)+0) = 107
			첫번쨰 게시물 : 107- ((1-1*10)+1) = 106
			
			현재페이지 : 2번
			첫번쨰 게시물 : 107- ((2-1*10)+0) = 97
			첫번쨰 게시물 : 107- ((2-1*10)+1) = 96
		*/
%>
		<tr>
			<th style= "color: #f4721f;"><%=vNum %></th>
			<td style="background-color: #f5f5dc; color: #f4721f;">
				<a href="BoardView.jsp?num=<%=dto.getNum()%>&nowPage=<%=nowPage%>&<%=queryStr%>">
					<%=dto.getTitle() %>
				</a>
			</td>
			<td style="background-color: #f5f5dc;"><%=dto.getId() %></td>
			<td style="background-color: #f5f5dc;"><%=dto.getVisitcount() %></td>
			<td style="background-color: #f5f5dc;"><%=dto.getPostDate() %></td>
		</tr>
<%
	}
}
%>
	</table>
	
	<!-- 페이지번호 -->
	<table border="1" width="90%">
		<tr>
			<td align="center">
				<!-- <img src="../images/paging1.gif" alt="" />
				<img src="../images/paging2.gif" alt="" />
				1 2 3 4 5 6 7 8 9 10
				<img src="../images/paging3.gif" alt="" />
				<img src="../images/paging4.gif" alt="" /> -->
				
				<%=PagingUtil.pagingImg(totalRecordCount, pageSize, blockPage, nowPage, "BoardList.jsp?"+queryStr) %>
			</td>
		</tr>
	</table>
	
</body>
</html>