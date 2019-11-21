package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.FileUtil;

public class DeleteCtrl extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String idx = req.getParameter("idx");
		String nowPage = req.getParameter("nowPage");
		
		req.setAttribute("nowPage", nowPage);
		
		DataroomDAO dao = new DataroomDAO();
		DataroomDTO dto = dao.selectView(idx);
		
		int sucOrFail = dao.delete(idx);
		if(sucOrFail==1) {
			String file =dto.getAttachedfile();
			FileUtil.deleteFile(req, "/Upload", file);
		}
		
		req.setAttribute("WHEREIS", "DELETE");
		req.setAttribute("SUC_FAIL", sucOrFail);
		
		req.getRequestDispatcher("/14Dataroom/Message.jsp").forward(req, resp);
		
	}
	
}
