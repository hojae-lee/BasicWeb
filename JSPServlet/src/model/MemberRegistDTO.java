package model;

import java.sql.Date;

public class MemberRegistDTO {

	private String user_id;
	private String user_pw;
	private String user_name;
	private String gender;
	private String birthday;
	private String birthday_ls;
	private String email;
	private String email_choice;
	private String email_yn;
	private String mobile;
	private String sms_yn;
	private String phone;
	private String zipcode;
	private String address1;
	private String address2;
	private String job;
	private String user_brand;
	private String user_part;
	private String user_part_txt;
	private java.sql.Date regisdate;
 
	public MemberRegistDTO() {}

	public MemberRegistDTO(String user_id, String user_pw, String user_name, String gender, String birthday,
			String birthday_ls, String email, String email_choice, String email_yn, String mobile, String sms_yn,
			String phone, String zipcode, String address1, String address2, String job, String user_brand,
			String user_part, String user_part_txt, Date regisdate) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.gender = gender;
		this.birthday = birthday;
		this.birthday_ls = birthday_ls;
		this.email = email;
		this.email_choice = email_choice;
		this.email_yn = email_yn;
		this.mobile = mobile;
		this.sms_yn = sms_yn;
		this.phone = phone;
		this.zipcode = zipcode;
		this.address1 = address1;
		this.address2 = address2;
		this.job = job;
		this.user_brand = user_brand;
		this.user_part = user_part;
		this.user_part_txt = user_part_txt;
		this.regisdate = regisdate;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getBirthday_ls() {
		return birthday_ls;
	}

	public void setBirthday_ls(String birthday_ls) {
		this.birthday_ls = birthday_ls;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmail_choice() {
		return email_choice;
	}

	public void setEmail_choice(String email_choice) {
		this.email_choice = email_choice;
	}

	public String getEmail_yn() {
		return email_yn;
	}

	public void setEmail_yn(String email_yn) {
		this.email_yn = email_yn;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getSms_yn() {
		return sms_yn;
	}

	public void setSms_yn(String sms_yn) {
		this.sms_yn = sms_yn;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getUser_brand() {
		return user_brand;
	}

	public void setUser_brand(String user_brand) {
		this.user_brand = user_brand;
	}

	public String getUser_part() {
		return user_part;
	}

	public void setUser_part(String user_part) {
		this.user_part = user_part;
	}

	public String getUser_part_txt() {
		return user_part_txt;
	}

	public void setUser_part_txt(String user_part_txt) {
		this.user_part_txt = user_part_txt;
	}

	public java.sql.Date getRegisdate() {
		return regisdate;
	}

	public void setRegisdate(java.sql.Date regisdate) {
		this.regisdate = regisdate;
	}

	
	
	
	 
	 
}
