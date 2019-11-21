package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.PagingUtil;

public class ListCtrl extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		DataroomDAO dao = new DataroomDAO();
		Map param = new HashMap();
		String addQueryString="";
		
		//request 객체를 통해 파라미터 받아오기
		String searchColumn = req.getParameter("searchColumn");
		String searchWord = req.getParameter("searchWord");
		
		if(searchWord != null){
			//전달된 파라미터가 있을때만 아래 문장 수행
			param.put("Column", searchColumn);
			param.put("Word", searchWord);
			
		}
		
		//테이블의 전체 레코드 수를 카운트
		int totalRecordCount = dao.getTotalRecordCount(param);
		
		ServletContext application = this.getServletContext();
		
		/*
		 방법2 : web.xml에서 서블릿 매핑정보가 있는 엘리먼트에서 초기화 파라미터를 가져온다.
		 */
		int pageSize = Integer.parseInt(application.getInitParameter("PAGE_SIZE"));
		int blockPage = Integer.parseInt(application.getInitParameter("BLOCK_PAGE"));
		
		//전체게시물의 갯수와 페이지크기를 이용해서 전체페이지를 계산한다.
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
		
		System.out.println("전체레코드수:"+ totalRecordCount);
		System.out.println("전체페이지수:"+ totalPage);
		
		/*
		 페이지번호를 파라미터를 통해 받아온다. 단 최초 리스트페이지로 진입시에는 페이지번호가
		 없으므로 이때는 1로 설정한다.
		 	페이지URL?nowPage=1 -> nowPage는 1의 값을 가진다.
		 	페이지URL?nowPage= -> nowPage는 "" 즉 공백문자를 가진다.
		 	페이지URL			-> NULL값을 가진다.
		 	※ null과 공백문자는 다르므로 별도 처리를 해야한다
		 */
		
		int nowPage = (req.getParameter("nowPage")==null || req.getParameter("nowPage").equals(""))
					?
					1
					:
					Integer.parseInt(req.getParameter("nowPage"));
		
		//가져올 레코드의 구간을 결정하기 위한 연산
		int start = (nowPage-1) * pageSize +1;
		int end = nowPage * pageSize;
		param.put("start", start);
		param.put("end", end);
		
		//안대~~~~~~~~~~~~~~
		param.put("totalPage", totalPage);//전체페이지수
		param.put("nowPage", nowPage);//현재페이지
		param.put("totalCount", totalRecordCount);//전체레코드갯수
		param.put("pageSize", pageSize);//페이지크기
		
		String pagingImg = PagingUtil.pagingImg(totalRecordCount, pageSize, blockPage, nowPage, "../DataRoom/DataList?"+addQueryString);
		
		param.put("pagingImg", pagingImg);
		//전체 레코드수를 Map에 저장.
		//param.put("totalCount",totalRecordCount);
		
		//테이블의 전체 레코드셋을 가져옴. 페이지처리x
		//List<DataroomDTO> lists = dao.selectList(param);
		
		//페이징처리를 위한 메소드호출 페이지처리o
		//List<DataroomDTO> lists = dao.selectListPage(param);
		
		//페이징처리를 위한 메소드 호출 페이지처리o 답변글처리o
		List<DataroomDTO> lists = dao.selectListPageReply(param);
		//커넥션풀의 자원반납.
		dao.close();
		
		//컬렉션에 저장된 내용을 view로 전달하기 위해
		//request영역에 속성 저장.
		req.setAttribute("lists", lists);
		req.setAttribute("map", param);
		
		//req.getRequestDispatcher("/14Dataroom/DataList.jsp").forward(req, resp);
		
		RequestDispatcher dis = req.getRequestDispatcher("/14Dataroom/DataList.jsp");
		dis.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		 만약 게시판 리스트쪽으로 POST방식으로 요청을 들어오더라도
		 처리는 doGet()메소드에서 처리할 수 있도록 호출해준다.
		 */
		doGet(req, resp);
	}
	
}
