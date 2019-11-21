package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ViewCtrl extends HttpServlet {

	/*
	 서블릿이 요청을 받을 때 doGet() 혹은 doPost()로 받아서 처리하는데
	 service()는 위 두가지 방식의 요청을 동시에 받을 수 있따.
	 */
	
	@Override 
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String idx = req.getParameter("idx");
		
		DataroomDAO dao = new DataroomDAO();
		DataroomDTO dto = dao.selectView(idx);
		
		dao.updateVisitCount(idx);
		
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br/>"));
		dao.close();
		
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/14Dataroom/DataView.jsp").forward(req, resp);
		
	}
	
}
