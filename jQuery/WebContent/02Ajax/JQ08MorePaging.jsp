<%@page import="board.BbsDTO"%>
<%@page import="java.util.List"%>
<%@page import="board.BbsDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
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


//board테이블에 저장된 레코드 수 카운트
int totalRecordCount = dao.getTotalRecordCount(param);

/*********************페이지 처리 start****************************/
//설정값이지만 변수로 처리함.
int pageSize = 10;
int blockPage = 5;

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
<title>JQ08MorePaging.jsp</title>
<script src="../jquery/jquery-3.4.1.js" ></script>
<script>
	$(function(){
		$('#moreBtn').click(function(){
			$.ajax({
				url : "./common/08MorePage.jsp",
				type : "get",
				contentType : "text/html; charset=utf-8;",
				data : {
					//더보기할 페이지 번호를 파라미터로 넘겨준다.
					nowPage : $('#nowPage').val()
				},
				//콜백데이터는 HTML형태로 넘겨받는다.
				dataType : "html",
				success : function(d){
					//요청 성공시 콜백되는 HTML데이터를 table 뒷부분에 추가한다.
					$('#boardTable').append(d);
					//다음 페이지번호를 계산하기 위해 현재 페이지에 +1 처리한다.
					var nextPage = parseInt($('#nowPage').val())+1;
					//파라미터를 넘겨주기 위해 hidden폼에 재입력한다.
					$('#nowPage').val(nextPage);
				},
				error : function(e){
					//요청에 대한 에러가 발생했을때 콜백데이터를 통해 오류를 확인한다.
					alert("에러발생!"+e.status+":"+e.statusText);
				}
			});
		});
	});
</script>
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
	<h2>jQuery Ajax()메소드를 활용한 페이지 더보기 구현</h2>

	<!-- jQuery의 append()메소드는 선택된 엘리먼트의 시작태그와 종료태그 사이의
	컨텐츠를 유지한채로 뒷부분에 추가되는 컨텐츠를 삽입한다.
	따라서 table태그를 선택할 수 있도록 id를 부여한다. -->
	<table border="1" width="90%" id="boardTable">
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
					<!-- 페이지 더보기의 경우 추가된 게시물은 동적으로 처리 되기떄문에 새로고침하면
					사라지게 된다. 따라서 상세보기의 경우는 target을 _blank로 설정해서 새창으로 처리 될 수 있도록 해야한다. -->
					<a href="BoardView.jsp?num=<%=dto.getNum()%>" target="_blank">
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
	
	<!-- 더보기를 처리할 페이지로 전달할 파라미터 라스트에 첫 진입시 무조건 1페이지가
	디스플레이되므로 두번째 페이지는 무조건 2로 설정함 -->
	<input type="hidden" id="nowPage" value="2" />
	<!-- 게시물10개 더보기 버튼 -->
	<button type="button" id="moreBtn" style="width:90%; background-color: black; height:35px; color:white;" >
		게시물 10개 더보기
	</button>
</body>
</html>