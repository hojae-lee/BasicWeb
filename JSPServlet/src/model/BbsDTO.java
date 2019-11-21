package model;

import java.sql.Date;

//게시판 테이블의 레코드를 저장하기 위한 DTO클래스
public class BbsDTO {
	/*
	 DTO객체를 만들때 테이블 컬럼의 타입과는 상관없이 대부분의 멤버변수는 String형으로 정의하면 된다.
	 String형으로 정의하면된다.
	 
	 */
	private String num; //일련번호
	private String title; //제목
	private String content; //내용
	private String id; //작성자아이디
	private java.sql.Date postDate; //작성일
	private String visitcount; //조회수
	
	//생성자
	
	public BbsDTO() {}
	
	public BbsDTO(String num, String title, String content, String id, Date postDate, String visitcount) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.id = id;
		this.postDate = postDate;
		this.visitcount = visitcount;
	}
	
	//getter/setter
	
	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public java.sql.Date getPostDate() {
		return postDate;
	}

	public void setPostDate(java.sql.Date postDate) {
		this.postDate = postDate;
	}

	public String getVisitcount() {
		return visitcount;
	}

	public void setVisitcount(String visitcount) {
		this.visitcount = visitcount;
	}


	
	
}
