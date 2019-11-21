package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//서블릿 클래스로 정의하기 위해 HttpServlet클래스를 상속받는다.
public class NoJSPServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		/*
		 View없이 서블릿에서 내용을 출력하고자 할 때 아래와 같이 처리한다.
		 컨텐츠 타입을 지정한 후 출력할 내용을 print메소드를 이용해서 출력한다.
		 */
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter writer = resp.getWriter();
		
		writer.println("<html>");
		writer.println("<head><title>헬로 서블릿띠</title></head>");
		writer.println("<body>");
		writer.println("<h2>jsp파일없이 화면에 출력되네요?~</h2>");
		writer.println("</body>");
		writer.println("</html>");
		writer.close();
	}
	
}