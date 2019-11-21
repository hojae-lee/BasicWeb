package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CalculatorServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String fNum = req.getParameter("firstNum");
		String sNum = req.getParameter("secondNum");
		
		int fnum = Integer.parseInt(fNum);
		int snum = Integer.parseInt(sNum);
		
		String op = req.getParameter("operator");
		
		int returnValue;
		switch(op) {
		case "+":
			returnValue = fnum + snum;
			break;
		case "-":
			returnValue = fnum - snum;
			break;
		case "*":
			returnValue = fnum * snum;
			break;
		case "/":
			returnValue = fnum / snum;
			break;
		default:
			returnValue =0;
		}
		
		req.setAttribute("calResult", "연산의 결과:"+ returnValue);
		req.getRequestDispatcher("/13Servlet/HelloServlet.jsp").forward(req, resp);
		
	}
	
}
