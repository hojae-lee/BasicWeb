package eltag;

import model.MemberDAO;

public class MyTagLib {
	
	/*
	 	JAVA클래스로 정의한 메소드를 EL식에서 호출하기
	 	: 함수 정의시 반드시 public static으로 선언해야 한다.
	 */

	/*
	 메소드설명 : 매개변수로 전달된 문자열에 숫자가 아닌 문자가 포함되어 있으면
	 false를 반환하고 전체가 숫자가 일때 true를 반환한다.
	 */
	public static boolean isNumber(String value) {
		
		char[] chArr = value.toCharArray();
		for(int i=0; i< chArr.length; i++) {
			if(!(chArr[i]>='0' && chArr[i]<='9')) {
				return false;
			}
		}
		return true;
	}
	
	public static String getGender(String jumin) {
		
		String gender ="";
		
		char mw = jumin.charAt(7);
		
		if(mw=='1' || mw=='3') {
			gender = "man";
		}
		else if(mw=='2' || mw =='4') {
			gender = "woman";
		}
		else {
			gender = "외계인?";
		}
		
		return gender;
	}
	
//	public static String getGender(String j) {
//		
//		int beginIndex = j.indexOf("-") +1 ;
//		String gender = j.substring(beginIndex,beginIndex+1);
//		
//		if(Integer.parseInt(gender)==1 || Integer.parseInt(gender)==3) {
//			return "남자";
//		}
//		else if(Integer.parseInt(gender)==2 || Integer.parseInt(gender)==4) {
//			return "여자";
//		}
//		else {
//			return "주민번호 오류";
//		}
//	}
	
	
	/* 아이디/패스워드를 매개변수로 받아서 회원여부를 판단하여 반환하는 메소드 */
	//memberLogin(아이디, 패스워드, JDBC드라이버, 커넥션URL)
	
	public static boolean memberLogin(String id, String pw, String drv, String url) {
		
		MemberDAO dao = new MemberDAO(drv, url);
		boolean isMember = dao.isMember(id, pw);
		return isMember;
		
	}
	
	
	
	
	
	
	
	
	
	
}
