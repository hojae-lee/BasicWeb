package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

public class BbsDAO {

	Connection con;
	PreparedStatement psmt;
	ResultSet rs;
	
	/*
	 MemberDAO 클래스의 생성자 메소드
	 	:오라클 DB에 연결 후 로그를 출력
	 */
	
	/*
	 생성자(방법1)
	 	:jsp파일에서 web.xml에 등록된 컨텍스트 초기화 파라미터를 가져와서 해당 생성장를 호출 할 떄 파라미터로
	 	전달한다. 이 경우 DB를 연결 할 때 마다 초기화 파라미터를 가져와야 하므로 중복되는 코드가 발생한다.
	 */
	public BbsDAO(String driver, String url) {
		try {
			Class.forName(driver);
			String id = "kosmo";
			String pw = "1234";
			con = DriverManager.getConnection(url,id,pw);
			System.out.println("DB 연결 성공");
		}
		catch (Exception e) {
			System.out.println("DB 연결 실패!!");
			e.printStackTrace();
		}
	}
	
	/*
	 생성자(방법2)
	 	: JSP파일에서는 application 내장객체를 파라미터로 전달하고 해당 생성자에서 web.xml을 직접 접근한다.
	 	application내장객체는 javax.servlert.ServletContext타입으로 정의 되어 있으므로 아래와 같이 매개변수를 받아서 사용
	 	한다. ※각 내장객체의 타입은 JSP교안 '내장객체' 부분 참조
	 */
	public BbsDAO(ServletContext ctx) {
		try {
			Class.forName(ctx.getInitParameter("JDBCDriver"));
			String id = "kosmo";
			String pw = "1234";
			con = DriverManager.getConnection(ctx.getInitParameter("ConnectionURL"),id,pw);
			System.out.println("DB 연결 성공");
		}
		catch (Exception e) {
			System.out.println("DB 연결 실패!!");
			e.printStackTrace();
		}
	}
	
	//게시판 리스트 가져오기(간단버전 : 페이지 처리 없음, 검색어 처리 없음)
	//검색기능사용
	public List<BbsDTO> selectList(Map<String, Object > map){
		
		//1.결과셋을 담기위한 리스트계열 컬렉션 생성
		List<BbsDTO> bbs = new Vector<BbsDTO>();
		//2.게시물 전체를 가져오기 위한 쿼리문 작성
		String sql = "select * from board";
		
		if(map.get("Word")!=null) {
			sql += " where " + map.get("Column") + " "+ " like '%"+ map.get("Word") +"%'";
		}
		
		sql +=" order by num desc";
		
		try {
			//3.쿼리실행을 위한 객체생성
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				/*
				 4.쿼리의 결과셋의 갯수만큼 반복하면서 DTO객체에 저장 후 컬렉션에 다시 저장.
				 */
				BbsDTO dto = new BbsDTO();
				
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostDate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				
				bbs.add(dto);
			}
		}
		catch (Exception e) {
			System.out.println("select시 예외발생");
			e.printStackTrace();
		}
		
		return bbs;
	}
	
	//게시물의 레코드 갯수를 카운트(페이지처리, 가상번호를 위해 사용)
	public int getTotalRecordCount(Map<String, Object> map) {
		int totalCount =0;
		
		String sql = "select count(*) from board";
		
		if(map.get("Word")!=null) {
			sql += " where " + map.get("Column") + " "+ " like '%"+ map.get("Word") +"%'";
		}
		System.out.println("sql="+sql);
		
		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return totalCount;
	}
	
	public int insertWrite(BbsDTO dto) {
		int affected =0;
		try {
			String sql = "insert into board ( "
					+" num,title,content,id,visitcount) "
					+" values ( "
					+" seq_board.nextval, ?, ?, ?, 0)";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			
			affected = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("insert중 예외발생");
			e.printStackTrace();
		}
		
		return affected;
	}
	
	//게시물의 조회수 증가
	public void updateVisitCount(String num) {
		String sql = "update board set "
				+ " visitcount=visitcount+1 "
				+ " where num=? ";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, num);
			psmt.executeQuery();
		}
		catch (Exception e) {
			System.out.println("조회수 증가시 예외발생");
			e.printStackTrace();
		}
	}
	
	//일련번호에 해당하는 게시물 하나 가져오기.
	public BbsDTO selectView(String num) {
		BbsDTO dto = new BbsDTO();
		String sql = "select * from board where num=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, num);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString("content"));
				dto.setPostDate(rs.getDate(4));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString(6));
			}
		}
		catch (Exception e) {
			System.out.println("상세보기시 예외발생");
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public int updateEdit(BbsDTO dto) {
		int affected = 0;
		try {
			String sql = "update Board set title=? , content = ? where num=? ";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNum());
			
			affected = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("update중 예외발생");
			e.printStackTrace();
		}
		return affected;
	}
	
	public int delete(BbsDTO dto) {
		int affected = 0;
		try {
			String sql = "delete from Board where num=?";
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getNum());
			
			affected = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("delete중 예외발생");
			e.printStackTrace();
		}
		return affected;
	}
	
	//게시판 리스트 페이징 처리 추가 메소드
	public List<BbsDTO> selectListPage(Map<String,Object> map){
		
		List<BbsDTO> bbs = new Vector<BbsDTO>();
		
		String sql = " "
				+" select * from ( "
				+" select Tb.*, ROWNUM rNum from ( "
				+" select * from board ";
		if(map.get("Word")!=null) {
			sql += " where "+ map.get("Column") + " "+ " Like '%" + map.get("Word")+"%' ";
		}
		sql += " "
			+" order by num desc "
			+" ) Tb "
			+" ) "
			+" where rNum between ? and ?";
		System.out.println("쿼리문:"+ sql);
		
		try {
			psmt = con.prepareStatement(sql);
			
			//JSP에서 계산한 페이지 범위값을 이용해 인파라미터를 설정한다.
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				BbsDTO dto = new BbsDTO();
				
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString(3));
				dto.setPostDate(rs.getDate(4));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString(6));
				
				bbs.add(dto);
			}
		} catch (Exception e) {
			System.out.println("select시 ㅇ/ㅖ외발생");
			e.printStackTrace();
		}
		return bbs;
	}
	
	//자원반납
	public void close() {
		try {
			if(rs!=null)rs.close();
			if(psmt!=null)psmt.close();
			if(con!=null)con.close();
		}
		catch (Exception e) {
			System.out.println("자원반납시 예외발생");
			e.printStackTrace();
		}
	}
	
}
