package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;

public class SimpleMVC extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processRequest(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processRequest(req, resp);
	}
	
	protected void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//2단계 : 요청분석
		String type = req.getParameter("type");
		Object resultObj = null;
		//resp.setContentType("text/html;charset=UTF-8");
		//PrintWriter writer = resp.getWriter();
		//writer.print("type="+type);
		
		/*
		 3단계 : 모델을 사용하여 요청한 기능을 수행한다.
		 */
		if(type==null) {
			resultObj="파라미터가 없내용 호에에에엥";
		}
		else if(type.equals("greeting")) {
			
			/*
			 서블릿 클래스에서 application내장객체를 사용하기 위해 getServletContext()메소드를 
			 이용해서 내장객체를 얻어온다.
			 */
			ServletContext application = this.getServletContext();
			/*
			 web.xml에 등록된 컨텍스트 초기화 파라미터를 서블릿클랫스에서 얻어올 수 있따.
			 */
			String drv = application.getInitParameter("JDBCDriver");
			String url = application.getInitParameter("ConnectionURL");
			
			MemberDAO dao = new MemberDAO(drv, url);
			
			String id = req.getParameter("id");
			String pw = req.getParameter("pw");
			
			boolean isMember = dao.isMember(id, pw);
			
			if(isMember==true) {
				resultObj = "회원님 호에에엥";
			}
			else {
				resultObj = "넌회원아닝가 호에엥";
			}
		}
		else if(type.equals("date")) {
			resultObj = new java.util.Date();
		}
		else {
			resultObj = "호~에에엥엥";
		}
		/*
		 4단계 request혹은 session영역에 처리결과를 저장한다.
		 */
		
		req.setAttribute("result", resultObj);
		
		/*
		 5단계 RequestDispatcher를 사용하여 알맞은 view로 포워딩하여 처리결과를 저달한다.
		 view로 전달하지 않고 서블릿에서 처리하는 경우도 있따.
		 */
		
		RequestDispatcher dis = req.getRequestDispatcher("/13Servlet/SimpleMVC.jsp");
		dis.forward(req, resp);
		
	}
	
}
