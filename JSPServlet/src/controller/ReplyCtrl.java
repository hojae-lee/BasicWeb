package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import util.FileUtil;

public class ReplyCtrl extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//답변글쓰기 폼은 상세보기와 기본적으로 동일하다. 기존의 내용을 가져와서
		//쓰기폼에 삽입해준다.
		String idx = req.getParameter("idx");
		
		DataroomDAO dao = new DataroomDAO();
		//답변글쓰기
		DataroomDTO dto = dao.selectViewReply(idx);
		
		dto.setTitle("[Re]"+dto.getTitle());
		dto.setContent("\r\n\r\n\r\n[원본글입니다.]\r\n"+dto.getContent());
		
		req.setAttribute("dto", dto);
		
		req.getRequestDispatcher("/14Dataroom/DataReply.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

req.setCharacterEncoding("UTF-8");
		
		//해당 함수는 MultipartRequest객체를 생성하면서 파일업로드를 처리한다.
		MultipartRequest mr = FileUtil.upload(req, req.getServletContext().getRealPath("/Upload"));
		
		int sucOrFail;
		
		if(mr != null) {

			String name = mr.getParameter("name");
			String title = mr.getParameter("title");
			String pass = mr.getParameter("pass");
			String content = mr.getParameter("content");
			//서버에 저장된 실제파일명을 가져온다.
			String attachedfile = mr.getFilesystemName("attachedfile");
			
			String bgroup = mr.getParameter("bgroup");
			String bstep = mr.getParameter("bstep");
			String bindent = mr.getParameter("bindent");
			
			//DTO객체에 폼값 입력
			DataroomDTO dto = new DataroomDTO();
			dto.setAttachedfile(attachedfile);
			dto.setContent(content);
			dto.setTitle(title);
			dto.setName(name);
			dto.setPass(pass);
			
			dto.setBgroup(Integer.parseInt(bgroup));
			dto.setBstep(Integer.parseInt(bstep));
			dto.setBindent(Integer.parseInt(bindent));
			

			DataroomDAO dao = new DataroomDAO();
	
			sucOrFail = dao.reply(dto);
			dao.close();
		}
		else {
			sucOrFail = -1;
		}
		if(sucOrFail==1) {
			//req.getRequestDispatcher("/DataRoom/DataList").forward(req, resp);
			
			resp.sendRedirect("../DataRoom/DataList");
		}
		else {
			req.getRequestDispatcher("/14Dataroom/DataReply.jsp").forward(req, resp);
		}
		
	}
	
}
