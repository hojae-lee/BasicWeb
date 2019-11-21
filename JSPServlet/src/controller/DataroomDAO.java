package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import model.BbsDTO;

public class DataroomDAO {

	Connection con;
	PreparedStatement psmt;
	ResultSet rs;
	
	public DataroomDAO() {
		
		try {
			Context ctx = new InitialContext();
			DataSource source = (DataSource)ctx.lookup("java:comp/env/jdbc/myoracle");
			
			con = source.getConnection();
			
		} catch (Exception e) {
			System.out.println("DBCP연결실패");
			e.printStackTrace();
		}
		
	}
	
	public int getTotalRecordCount(Map map) {
		
		int totalCount =0;
		
		try {
			String sql = "select count(*) from dataroom";
			
			if(map.get("Word")!=null) {
				sql += " where " + map.get("Column") + " "+ " like '%"+ map.get("Word") +"%' ";
			}
			
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception e) {}
		return totalCount;
	}
	
	public List<DataroomDTO> selectList(Map map){
		
		List<DataroomDTO> bbs = new Vector<DataroomDTO>();
		
		String sql = "select * from dataroom";
		
		if(map.get("Word")!=null) {
			sql += " where "+ map.get("Column") + " "+ " Like '%" + map.get("Word")+"%' ";
		}
		sql +=" order by idx desc";
				
		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				DataroomDTO dto = new DataroomDTO();
				
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setAttachedfile(rs.getString(6));
				dto.setDowncount(rs.getInt(7));
				dto.setPass(rs.getString(8));
				dto.setVisitcount(rs.getInt(9));
				
				bbs.add(dto);
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return bbs;
	}
	
	public DataroomDTO selectView(String idx) {
		DataroomDTO dto =null;
		
		String sql = "select * from dataroom "
				+" where idx=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, idx);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto = new DataroomDTO();
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setAttachedfile(rs.getString(6));
				dto.setDowncount(rs.getInt(7));
				dto.setPass(rs.getString(8));
				dto.setVisitcount(rs.getInt(9));
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public void updateVisitCount(String idx) {
		String sql = "update dataroom set visitcount=visitcount+1 where idx=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, idx);
			psmt.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int insert(DataroomDTO dto) {
		int affected =0;
		try {
			String sql = "insert into dataroom (idx,title,name,content,attachedfile,pass,downcount) "
					+ " values (seq_bbs_num.nextval,?,?,?,?,?,0)";
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getAttachedfile());
			psmt.setString(5, dto.getPass());
			
			affected = psmt.executeUpdate();
					
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return affected;
	}
	
	public boolean isCorrectPassword(String pass, String idx) {
		boolean isCorr = true;
		try {
			String sql = "select count(*) from dataroom where pass=? and idx=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, pass);
			psmt.setString(2, idx);
			rs = psmt.executeQuery();
			rs.next();
			if(rs.getInt(1)==0) {
				isCorr = false;
			}
			
		} catch (Exception e) {
			isCorr = false;
			e.printStackTrace();
		}
		return isCorr;
	}
	
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

	public int update(DataroomDTO dto) {
		
		int affected =0;
		
		try {
			
			String sql = "update dataroom set title=?, name=?, content=?, attachedfile=? where idx=? ";
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getAttachedfile());
			
			psmt.setString(5, dto.getIdx());
			
			affected = psmt.executeUpdate();
		} 
		catch (Exception e) {
			System.out.println("update중 예외 발생");
			e.printStackTrace();
		}
		return affected;
	}
	
	public int delete(String idx) {
		int affected =0;
		try {
			String sql = "delete from dataroom where idx=?";
			
			psmt =con.prepareStatement(sql);
			psmt.setString(1, idx);
			
			affected = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("delete중 예외발생");
			e.printStackTrace();
		}
		return affected;
	}
	
	public List<DataroomDTO> selectListPage(Map map) {
		
		List<DataroomDTO> bbs = new Vector<DataroomDTO>();

		String sql = ""
				+"select * from ("
				+ "		select Tb.*, rownum rNum from ("
				+ "			 select * from dataroom ";
		
		if(map.get("Word")!=null) {
			sql += " where " + map.get("Column") + " "+ " like '%"+ map.get("Word") +"%' ";
		}
		
		sql +=" order by idx desc "
				+ "		) Tb"
				+ ") "
				+ " where rNum between ? and ?";
		
		System.out.println("쿼리문:"+ sql);
		
		try {
			//3.쿼리실행을 위한 객체생성
			psmt = con.prepareStatement(sql);
			
			psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
			psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
			rs = psmt.executeQuery();
			while(rs.next()) {
				/*
				 4.쿼리의 결과셋의 갯수만큼 반복하면서 DTO객체에 저장 후 컬렉션에 다시 저장.
				 */
				DataroomDTO dto = new DataroomDTO();
				
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setAttachedfile(rs.getString(6));
				dto.setDowncount(rs.getInt(7));
				dto.setPass(rs.getString(8));
				dto.setVisitcount(rs.getInt(9));
				
				bbs.add(dto);
			}
		}
		catch (Exception e) {
			System.out.println("select시 예외발생");
			e.printStackTrace();
		}
		
		return bbs;
	}
	
	//답변형게시판 글쓰기 처리
	public int insertReply(DataroomDTO dto) {
		int affected =0;
		try {
			/*
			 답변글 처리를 위한 커럼추가
			 : 답변형 게시판에서 원글의 경우에는 일련번호와 동일한 그룹번호를 부여하게 된다.
			 즉 idx에 입력될 값과 동일한 값을 bgroup에 입력한다.
			 bstep, bindent는 0을 입력한다.
			 
			 ※NextVal의 경우 현재 시퀀스에 +1 처리한 값을 반환하지만 하나의 문장내에서 실행하게
			 되면 동일한 값을 반환한다.
			 */
			String sql = "insert into dataroom ("
					+ " idx,title,name,content,attachedfile,pass,downcount, "
					+ " bgroup, bstep, bindent) "
					+ " values (seq_bbs_num.nextval,?,?,?,?,?,0,"
					+ " seq_bbs_num.nextval,0,0)";
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getAttachedfile());
			psmt.setString(5, dto.getPass());
			
			affected = psmt.executeUpdate();
					
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return affected;
	}
	
	public DataroomDTO selectViewReply(String idx) {
		DataroomDTO dto =null;
		
		String sql = "select * from dataroom "
				+" where idx=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, idx);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto = new DataroomDTO();
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setAttachedfile(rs.getString(6));
				dto.setDowncount(rs.getInt(7));
				dto.setPass(rs.getString(8));
				dto.setVisitcount(rs.getInt(9));
				
				//답변글 추가하기
				dto.setBgroup(rs.getInt("bgroup"));
				dto.setBstep(rs.getInt("bstep"));
				dto.setBindent(rs.getInt("bindent"));
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public int reply(DataroomDTO dto) {
		int affected =0;
		try {
			/*
			 답변글을 입력하기전에 내가 부여 받은 step과 같거나 큰 번호가 이미 있다면 +1해서 뒤로 밀어준다.
			 */
			replyStepUpdate(dto.getBgroup(), dto.getBstep());
			
			String sql = "insert into dataroom ("
					+ " idx,title,name,content,attachedfile,pass,downcount, "
					+ " bgroup, bstep, bindent) "
					+ " values (seq_bbs_num.nextval,?,?,?,?,?,0,"
					+ " ?,?,?)";
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getAttachedfile());
			psmt.setString(5, dto.getPass());
			/*
			 답변형게시판은 원글의 경우 일련번호 idx와 bgroup그룹번호는 항상 동일한 값을 가진다.
			 답변글인 경우 원글의 bgroup 번호를 동일하게 부여받는다.
			 정렬bstep과 bindent는 원본글에서 +1 값을 부여 받는다.
			 */
			psmt.setInt(6, dto.getBgroup());
			psmt.setInt(7, dto.getBstep()+1);
			psmt.setInt(8, dto.getBindent()+1);
			
			affected = psmt.executeUpdate();
					
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return affected;
	}
	
	//페이지처리o, 답변글처리o
	public List<DataroomDTO> selectListPageReply(Map map) {
		
		List<DataroomDTO> bbs = new Vector<DataroomDTO>();

		String sql = ""
				+"select * from ("
				+ "		select Tb.*, rownum rNum from ("
				+ "			 select * from dataroom ";
		
		if(map.get("Word")!=null) {
			sql += " where " + map.get("Column") + " "+ " like '%"+ map.get("Word") +"%' ";
		}
		
		/*
		 답변글 기능 있는 경우 정렬
		 	그룹번호를 내림차순으로 1차정렬
		 	bstep 컬럼을 통해 오름차순으로 2차정렬
		 */
		sql +=" order by bgroup desc, bstep asc "
				+ "		) Tb"
				+ ") "
				+ " where rNum between ? and ?";
		
		System.out.println("쿼리문:"+ sql);
		
		try {
			//3.쿼리실행을 위한 객체생성
			psmt = con.prepareStatement(sql);
			
			psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
			psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
			rs = psmt.executeQuery();
			while(rs.next()) {
				/*
				 4.쿼리의 결과셋의 갯수만큼 반복하면서 DTO객체에 저장 후 컬렉션에 다시 저장.
				 */
				DataroomDTO dto = new DataroomDTO();
				
				int indentNum = rs.getInt(12);
				
				String spacer ="";
				dto.setBgroup(rs.getInt(10));
				dto.setBstep(rs.getInt(11));
				dto.setBindent(indentNum);
				
				if(indentNum>0) {
					for(int i=1; i<=indentNum; i++) {
						spacer += "&nbsp;&nbsp;";
					}
					spacer += spacer+"<img src='../images/re2.gif'>";
				}
				
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				
				dto.setTitle(spacer + rs.getString(3));
				
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setAttachedfile(rs.getString(6));
				dto.setDowncount(rs.getInt(7));
				dto.setPass(rs.getString(8));
				dto.setVisitcount(rs.getInt(9));
				
				bbs.add(dto);
			}
		}
		catch (Exception e) {
			System.out.println("select시 예외발생");
			e.printStackTrace();
		}
		
		return bbs;
	}
	
	public void replyStepUpdate(int groupNum, int stepNum) {
		try {
			String sql = "update dataroom set bstep=bstep+1 where bgroup=? and bsetp=?";
			
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, groupNum);
			psmt.setInt(2, stepNum);
			psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void downCountPlus(String idx) {
		
		String sql = "update dataroom set downcount=downcount+1 where idx=? ";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, idx);
			psmt.executeUpdate();
			
		} catch (Exception e) {}
		
	}
	
}
