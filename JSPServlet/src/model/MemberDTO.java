package model;

import java.sql.Date;

public class MemberDTO {
	private String id;
	private String pass;
	private String name;
	private java.sql.Date regidate;
	//기본생성자
	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}
	//인자생성자
	public MemberDTO(String id, String pass, String name, Date regidate) {
		super();
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.regidate = regidate;
	}
	//getter/setter 메소드
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public java.sql.Date getRegidate() {
		return regidate;
	}
	public void setRegidate(java.sql.Date regidate) {
		this.regidate = regidate;
	}
	/*
	 Object클래스에서 제공하는 메소드로 객체를 문자열형태로 변형해서
	 반환해주는 역할을 한다.
	 */
	@Override
	public String toString() {
		return String.format("아이디:%s, 비밀번호:%s, 이름:%s", getId() ,pass,name);
	}
	
	
}
