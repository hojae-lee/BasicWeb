<%@page import="model.MemberRegistDAO"%>
<%@page import="model.MemberRegistDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");

MemberRegistDTO dto = new MemberRegistDTO();
MemberRegistDAO dao = new MemberRegistDAO();

String user_id = request.getParameter("user_id");
String user_pw = request.getParameter("user_pw1");
String user_name = request.getParameter("user_name");
String gender = request.getParameter("gender");
String birthday= request.getParameter("birthday");
String birthday_ls = request.getParameter("birthday_ls");
String email = request.getParameter("email_id")+"@"+ request.getParameter("email_domain");
String email_choice = request.getParameter("email_choice");
String email_yn = request.getParameter("email_yn");
String mobile = request.getParameter("mobile1")+"-"+request.getParameter("mobile2")+"-"+request.getParameter("mobile3");
String sms_yn = request.getParameter("sms_yn");


String phone = request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3");
String zipcode = request.getParameter("zipcode");
String address1 = request.getParameter("address1");
String address2 = request.getParameter("address2");
String job = request.getParameter("job");

String[] user_brand_arr = request.getParameterValues("user_brand");
String user_brand_str = "";

for(int i=0; i<user_brand_arr.length; i++){
	if(i==user_brand_arr.length-1){
		user_brand_str += user_brand_arr[i];
	}
	else{
		user_brand_str += user_brand_arr[i]+ ",";	
	}
}


String[] user_part_arr = request.getParameterValues("user_part");
String user_part_str = "";

for(int i=0; i<user_part_arr.length; i++){
	if(i==user_part_arr.length-1){
		user_part_str += user_part_arr[i];
	}
	else{
		user_part_str += user_part_arr[i]+ ",";
	}
}

String user_part_txt = request.getParameter("user_part_txt");

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
dto.setUser_brand(user_brand_str);
dto.setUser_part(user_part_str);
dto.setUser_part_txt(user_part_txt);

int affected = dao.insertMember(dto);

if(affected==1){%>
	<script>
	alert("회원가입성공!");
	</script>
	<%
	request.setAttribute("USER_ID",dto.getUser_id());
	request.getRequestDispatcher("/homework/MemberModify.jsp").forward(request, response);
	%>
<%
}else{%>
	<script>
	alert("회원가입실패!");
	history.back();
	</script>
<%	
}
%>
