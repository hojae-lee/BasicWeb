package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class NaverSearchAPI extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//파라미터받기
		String keyword = req.getParameter("keyword");
		String startNum = req.getParameter("startNum");
		/*
		 네이버 검색 API를 활용하여 검색결과는 한페이지에 20개씩 출력함.
		 검색결과 시작페이지는 프론트에서 startNum 으로 지정함.
		 */
		
		String clientId = "sFdTu5BcESwyrG0H5HoP";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "scB9t0qSa4";//애플리케이션 클라이언트 시크릿값";
        try {
            String text = URLEncoder.encode(keyword, "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/search/blog?query="+ text +"&start="+startNum+"&display=20"; // json 결과
            //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            System.out.println(response.toString());
            
            resp.setContentType("text/html; charset=utf-8;");
            resp.getWriter().write(response.toString());
            
        } catch (Exception e) {
            System.out.println(e);
        }
		
	}
	
}
