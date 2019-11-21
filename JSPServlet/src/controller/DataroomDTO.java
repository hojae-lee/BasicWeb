package controller;

import java.sql.Date;

public class DataroomDTO {

	private String idx; 
	private String name;
	private String title; 
	private String content;
	private java.sql.Date postdate;
	private String attachedfile;
	private int downcount;
	private String pass;
	private int visitcount;
	
	//답변형게시판을 위한 컬럼 추가
	private int bgroup;
	private int bstep;
	private int bindent;
	
	public DataroomDTO() {
		// TODO Auto-generated constructor stub
	}

	public DataroomDTO(String idx, String name, String title, String content, Date postdate, String attachedfile,
			int downcount, String pass, int visitcount) {
		super();
		this.idx = idx;
		this.name = name;
		this.title = title;
		this.content = content;
		this.postdate = postdate;
		this.attachedfile = attachedfile;
		this.downcount = downcount;
		this.pass = pass;
		this.visitcount = visitcount;
	}

	public DataroomDTO(String idx, String name, String title, String content, Date postdate, String attachedfile,
			int downcount, String pass, int visitcount, int bgroup, int bstep, int bindent) {
		super();
		this.idx = idx;
		this.name = name;
		this.title = title;
		this.content = content;
		this.postdate = postdate;
		this.attachedfile = attachedfile;
		this.downcount = downcount;
		this.pass = pass;
		this.visitcount = visitcount;
		this.bgroup = bgroup;
		this.bstep = bstep;
		this.bindent = bindent;
	}

	public int getBgroup() {
		return bgroup;
	}

	public void setBgroup(int bgroup) {
		this.bgroup = bgroup;
	}

	public int getBstep() {
		return bstep;
	}

	public void setBstep(int bstep) {
		this.bstep = bstep;
	}

	public int getBindent() {
		return bindent;
	}

	public void setBindent(int bindent) {
		this.bindent = bindent;
	}

	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public java.sql.Date getPostdate() {
		return postdate;
	}

	public void setPostdate(java.sql.Date postdate) {
		this.postdate = postdate;
	}

	public String getAttachedfile() {
		return attachedfile;
	}

	public void setAttachedfile(String attachedfile) {
		this.attachedfile = attachedfile;
	}

	public int getDowncount() {
		return downcount;
	}

	public void setDowncount(int downcount) {
		this.downcount = downcount;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public int getVisitcount() {
		return visitcount;
	}

	public void setVisitcount(int visitcount) {
		this.visitcount = visitcount;
	}


	
}
