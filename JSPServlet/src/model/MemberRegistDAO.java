package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberRegistDAO {

	Connection con;
	PreparedStatement psmt;
	ResultSet rs;
	
	public MemberRegistDAO() {
		
		try {
			Context initCtx = new InitialContext();
			Context ctx = (Context)initCtx.lookup("java:comp/env");
			DataSource source = 
				(DataSource)ctx.lookup("jdbc/myoracle");
						
			con = source.getConnection();
			System.out.println("DBCP연결성공");
		}
		catch(Exception e) {
			System.out.println("DBCP연결실패");
			e.printStackTrace();
		}	

	}
	
	/*
	 * public MemberRegistDAO(String driver, String url) { try {
	 * Class.forName(driver); String id = "kosmo"; String pw = "1234"; con =
	 * DriverManager.getConnection(url,id,pw); System.out.println("DB 연결 성공"); }
	 * catch (Exception e) { System.out.println("DB 연결 실패!!"); e.printStackTrace();
	 * } }
	 */
	
	public boolean isMember(String id) {

		String sql ="SELECT count(*) FROM hw_member WHERE user_id=?";
		int isMember =0;
		boolean isFlag = false;
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
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
	
	public int insertMember(MemberRegistDTO dto) {
		int affected =0;
		
		try {
			String sql = "INSERT INTO hw_member ( "
					+ " user_id,user_pw,user_name,gender,birthday,birthday_ls, "
					+ " email,email_choice,email_yn,mobile, "
					+ " sms_yn,phone,zipcode,address1,address2,job,user_brand, "
					+ " user_part,user_part_txt) "
					+ " VALUES ( "
					+ " ?, ?, ?, ?, ?, ?,"
					+ " ?, ?, ?, ?, "
					+ " ?, ?, ?, ?, ?, ?, ?,"
					+ " ?, ?)";

			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getUser_id());
			psmt.setString(2, dto.getUser_pw());
			psmt.setString(3, dto.getUser_name());
			psmt.setString(4, dto.getGender());
			psmt.setString(5, dto.getBirthday());
			psmt.setString(6, dto.getBirthday_ls());
			psmt.setString(7, dto.getEmail());
			psmt.setString(8, dto.getEmail_choice());
			psmt.setString(9, dto.getEmail_yn());
			psmt.setString(10, dto.getMobile());
			psmt.setString(11, dto.getSms_yn());
			psmt.setString(12, dto.getPhone());
			psmt.setString(13, dto.getZipcode());
			psmt.setString(14, dto.getAddress1());
			psmt.setString(15, dto.getAddress2());
			psmt.setString(16, dto.getJob());
			psmt.setString(17, dto.getUser_brand());
			psmt.setString(18, dto.getUser_part());
			psmt.setString(19, dto.getUser_part_txt());
			
			affected = psmt.executeUpdate();
			
			if(affected==1) {
				System.out.println("회원등록완료");
			}
			else {
				System.out.println("회원등록실패");
			}
		}
		catch (Exception e) {
			System.out.println("insert중 예외발생");
			e.printStackTrace();
		}
		
		return affected;
	}
	
	public MemberRegistDTO selectmemberresult(String id) {
		MemberRegistDTO dto = new MemberRegistDTO();
		
		try {
			
			String sql = "select * from hw_member where user_id=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				String user_id = rs.getString(1);
				String user_pw = rs.getString(2);
				String user_name = rs.getString(3);
				String gender = rs.getString(4);
				String birthday = rs.getString(5);
				String birthday_ls = rs.getString(6);
				String email = rs.getString(7);
				String email_choice = rs.getString(8);
				String email_yn = rs.getString(9);
				String mobile = rs.getString(10);
				String sms_yn = rs.getString(11);
				String phone = rs.getString(12);
				String zipcode = rs.getString(13);
				String address1 = rs.getString(14);
				String address2 = rs.getString(15);
				String job = rs.getString(16);
				String user_brand = rs.getString(17);
				String user_part = rs.getString(18);
				String user_part_txt = rs.getString(19);
				
				System.out.println(user_id+user_pw+user_name+gender+birthday+birthday_ls+email+
						email_choice+email_yn+mobile+sms_yn+phone+zipcode+address1+address2+
						job+user_brand+user_part+user_part_txt);
				
				dto.setUser_id(user_id);
				dto.setUser_pw(user_pw);
				dto.setUser_name(user_name);
				dto.setGender(gender);
				dto.setBirthday(birthday);
				dto.setBirthday_ls(birthday_ls);
				dto.setEmail(email);
				dto.setEmail_choice(email_choice);
				dto.setEmail_yn(email_yn);
				dto.setMobile(mobile);
				dto.setSms_yn(sms_yn);
				dto.setPhone(phone);
				dto.setZipcode(zipcode);
				dto.setAddress1(address1);
				dto.setAddress2(address2);
				dto.setJob(job);
				dto.setUser_brand(user_brand);
				dto.setUser_part(user_part);
				dto.setUser_part_txt(user_part_txt);
			}
			else {
				System.out.println("결과셋이 없습니다.");
			}
			
		} catch (Exception e) {
			System.out.println("select문 예외발생");
			e.printStackTrace();
		}
		return dto;
	}
	
}
