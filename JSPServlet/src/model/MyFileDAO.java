package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MyFileDAO {

	Connection con;
	PreparedStatement psmt;
	ResultSet rs;
	
	public MyFileDAO() {
		try {
			Context initCtx = new InitialContext();
			Context ctx = (Context)initCtx.lookup("java:comp/env");
			DataSource source = (DataSource)ctx.lookup("jdbc/myoracle");
			
			con = source.getConnection();
		} catch (Exception e) {
			System.out.println("DBCP연결실패");
			e.printStackTrace();
		}
	}
	
	public int myfileInsert(MyFileVO dto) {
		int affected = 0;
		try {
			String sql = "insert into myfile ( "
					+" idx,name,title,inter,ofile, sfile) "
					+" values ( "
					+" seq_bbs_num.nextval, ?, ?, ?, ?, ?)";
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getInter());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			
			affected = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Insert중 예외발생");
			e.printStackTrace();
		}
		return affected;
	}
	
	public List<MyFileVO> myFileList(){
		
		
		List<MyFileVO> fileList = new Vector<MyFileVO>();
		
		String sql = "select * from myfile where 1=1 order by idx desc";
		
		System.out.println("sql="+ sql);
		
		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				/*
				 4.쿼리의 결과셋의 갯수만큼 반복하면서 DTO객체에 저장 후 컬렉션에 다시 저장.
				 */
				MyFileVO dto = new MyFileVO();
				
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setInter(rs.getString(4));
				dto.setOfile(rs.getString(5));
				dto.setSfile(rs.getString(6));
				dto.setRegidate(rs.getString(7));
				
				fileList.add(dto);
			}
		}
		catch (Exception e) {
			System.out.println("select시 예외발생");
			e.printStackTrace();
		}
		return fileList;
	}
	
}
