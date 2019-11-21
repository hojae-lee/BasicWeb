package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import util.FileUtil;

public class EditCtrl extends HttpServlet {

	/*
	 수정폼으로 진입할때는 doGet() 수정완료시 doPost()메소드가 처리함.
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String idx = req.getParameter("idx");
		
		DataroomDAO dao = new DataroomDAO();
		DataroomDTO dto = dao.selectView(idx); 
		
		req.setAttribute("dto", dto);
		
		req.getRequestDispatcher("/14Dataroom/DataEdit.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		
		MultipartRequest mr = FileUtil.upload(req, req.getServletContext().getRealPath("/Upload"));
		
		int sucOrFail;
		
		if(mr != null) {
			String idx = mr.getParameter("idx");
			String nowPage = mr.getParameter("nowPage");
			String originalfile = mr.getParameter("originalfile");
			
			//수정처리후 상세보기로 이동하므로 영역에 속성을 저장한다.
			req.setAttribute("idx", idx);
			req.setAttribute("nowPage", nowPage);
			
			String name = mr.getParameter("name");
			String title = mr.getParameter("title");
			String content = mr.getParameter("content");
			String attachedfile = mr.getFilesystemName("attachedfile");
			
			if(attachedfile==null) {
				attachedfile = originalfile;
			}
			
			DataroomDTO dto = new DataroomDTO();
			dto.setAttachedfile(attachedfile);
			dto.setContent(content);
			dto.setTitle(title);
			dto.setName(name);
			
			dto.setIdx(idx);
			
			DataroomDAO dao = new DataroomDAO();
			sucOrFail = dao.update(dto);
			
			//레코드의 업데이특 성공이고 새로운 파일을 업로드 완료햇다면 기존의 파일은 삭제 처리한다.
			if(sucOrFail==1 && mr.getFilesystemName("attachedfile")!=null) {
				FileUtil.deleteFile(req, "/Upload", originalfile);
			}
			dao.close();
		}
		else {
			sucOrFail = -1;
		}
		
		req.setAttribute("SUC_FAIL", sucOrFail);
		req.setAttribute("WHEREIS", "UPDATE");
		
		req.getRequestDispatcher("/14Dataroom/Message.jsp").forward(req, resp);
		
	}
	
}
