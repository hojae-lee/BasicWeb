package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		/*
		 리퀘스트 영역에 속성저장
		 	: 서블릿에서 request영역을 사용하기 위해 해당 메소드로 HttpServletRequest타입의 매개변수를 전달한다.
		 	그러면 사용자의 모든 요청을 해당 서블릿 클래스에서 받을 수 있따.
		 */
		req.setAttribute("message", "Hello Servlet Test 성공");
		/*
		 web.xml 에 서블릿 매핑정보를 입력할때 <servlet>의 하위 엘리먼트로 <init-param>을 이용해서 서블릿 초기화
		 파라미터를 등록할 수 있따.
		 해당 정보를 getInitParameter() 메소드를 통해 가져올 수 있다.
		 */
		req.setAttribute("HELLO", this.getInitParameter("HELLO"));
		
		/*
		 View에 해당하는 JSP페이지로 포워드 한다. 그러면 request영역에 
		 */
		req.getRequestDispatcher("/13Servlet/HelloServlet.jsp").forward(req, resp);
		
	}
	 
}
