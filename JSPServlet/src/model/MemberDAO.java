package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;


public class MemberDAO {
	
	Connection con;
	PreparedStatement psmt;
	ResultSet rs;
	
	
	/*
	 MemberDAO 클래스의 생성자 메소드
	 	:오라클 DB에 연결 후 로그를 출력
	 */
	
	public MemberDAO(String driver, String url) {
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
	 id,pass를 파라미터로 받아서 회원인지 여부만 판단하여 true/false를 반환하는 메소드
	 */
	public boolean isMember(String id, String pass) {
		/*
		 JAVA에서 쿼리문 작성시 항상 문자열 앞뒤로 스페이스를 넣는 습관을 들이도록. 하자..
		 */
		String sql ="SELECT count(*) FROM member"+" WHERE id=? AND pass=?";
		int isMember =0;
		boolean isFlag = false;
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pass);
			rs = psmt.executeQuery();
			rs.next();
			/*
			 반환되는 값이 0 or 1 이므로 getInt()로 받는다.
			 */
			isMember = rs.getInt(1);
			System.out.println("affected: "+isMember);
			if(isMember ==0) {
				isFlag = false;
			}
			else {
				isFlag = true;
			}
		} catch (Exception e) {
			isFlag = false;
			e.printStackTrace();
		}
		return isFlag;
	}
	
	//회원인증 방법2: 회원정보 조회 후 DTO객체에 저장 후 반환
	public MemberDTO getMemberDTO(String id, String pwd) {
		MemberDTO dto = new MemberDTO();
		String sql = "select id,pass,name from member where id=? and pass=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pwd);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
			}
			else {
				System.out.println("결과셋이 없습니다.");
			}
		}
		catch (Exception e) {
			System.out.println("getMemberDTO오류");
			e.printStackTrace();
		}
		
		return dto;
	}
	
	//회원인증 방법3 : Map계열 컬렉션을 사용
	public Map<String,String> getMemberMap(String id,String pw){
		Map<String,String> maps = new HashMap<String,String>();
		
		String sql = "select id,pass,name from member where id=? and pass=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				maps.put("id", rs.getString(1));
				maps.put("pass", rs.getString(2));
				maps.put("name", rs.getString(3));
			}
			else {
				System.out.println("결과셋이 없습니다.");
			}
		}
		catch (Exception e) {
			System.out.println("getMemberDTO오류");
			e.printStackTrace();
		}
		return maps;
	}
}
