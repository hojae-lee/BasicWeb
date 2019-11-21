package model;

public class MyFileVO {

	private String idx;
	private String name;
	private String title; 
	private String inter;
	private String ofile;
	private String sfile;
	private String regidate; 
	//기본생성자 / 인자생성자
	public MyFileVO() {}
	
	public MyFileVO(String idx, String name, String title, String inter, String ofile, String sfile, String regidate) {
		this.idx = idx;
		this.name = name;
		this.title = title;
		this.inter = inter;
		this.ofile = ofile;
		this.sfile = sfile;
		this.regidate = regidate;
	}

	//getter/setter 메소드
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
	public String getInter() {
		return inter;
	}
	public void setInter(String inter) {
		this.inter = inter;
	}
	public String getOfile() {
		return ofile;
	}
	public void setOfile(String ofile) {
		this.ofile = ofile;
	}
	public String getSfile() {
		return sfile;
	}
	public void setSfile(String sfile) {
		this.sfile = sfile;
	}
	public String getRegidate() {
		return regidate;
	}
	public void setRegidate(String regidate) {
		this.regidate = regidate;
	}
	
	
}
