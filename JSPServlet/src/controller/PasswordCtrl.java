package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PasswordCtrl extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		/*
		 패스워드 검증폼으로 전달된 파라미터 중에서 mode는 getParameter()로 받은 후 request영역에 저장한다.
		 그리고 jsp페이지로 포워드를 걸어서 영역에서 읽어온다.
		 */
		String mode = req.getParameter("mode");
		req.setAttribute("mode", mode);
		
		req.getRequestDispatcher("/14Dataroom/DataPassword.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String idx = req.getParameter("idx");
		String mode = req.getParameter("mode");
		String pass = req.getParameter("pass");
		
		DataroomDAO dao = new DataroomDAO();
		boolean isCorrect = dao.isCorrectPassword(pass,idx);
		dao.close();
		
		req.setAttribute("PASS_CORRECT", isCorrect);
		
		req.getRequestDispatcher("/14Dataroom/PassMessage.jsp").forward(req, resp);
		
	}
	
}
