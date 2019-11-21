package shop;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletContext;

public class ShoppingDAO {

	private static ShoppingDAO dao = new ShoppingDAO();
	
	Connection con;
	PreparedStatement psmt;
	ResultSet rs;
	
	private ShoppingDAO() {
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String id = "kosmo";
			String pw = "1234";
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl",id,pw);
			System.out.println("DB 연결 성공");
		}
		catch (Exception e) {
			System.out.println("DB 연결 실패!!");
			e.printStackTrace();
		}
	}
	
	public static ShoppingDAO getInstance() {
		System.out.println("DAO객체반환");
		return dao;
	}
	
	public ArrayList<OptionsDTO> getOption(String g_idx){
		ArrayList<OptionsDTO> optionList = new ArrayList<OptionsDTO>();
		
		String sql = "select * from sh_options where g_idx =? order by op_price ASC";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, g_idx);
			rs = psmt.executeQuery();
			while(rs.next()) {
				OptionsDTO dto = new OptionsDTO();
				
				dto.setOp_idx(rs.getString(1));
				dto.setOp_name(rs.getString(2));
				dto.setOp_price(rs.getString(3));
				dto.setG_idx(rs.getString(4));
				
				optionList.add(dto);
			}
		} catch (Exception e) {
			System.out.println("select문 시 예외 발생");
			e.printStackTrace();
		}
		return optionList;
	}
	
	public OptionsDTO optionView(String op_idx) {
		
		OptionsDTO dto = new OptionsDTO();
		
		String sql = "select * from sh_options where op_idx=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, op_idx);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setOp_idx(rs.getString(1));
				dto.setOp_name(rs.getString(2));
				dto.setOp_price(rs.getString(3));
				dto.setG_idx(rs.getString(4));
				System.out.println("성공");
			}
		} catch (Exception e) {
			System.out.println("상세보기시 예외발생");
			e.printStackTrace();
		}
		return dto;
	}
}
