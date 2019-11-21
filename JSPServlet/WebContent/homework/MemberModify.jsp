<%@page import="model.MemberRegistDTO"%>
<%@page import="model.MemberRegistDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
MemberRegistDAO dao = new MemberRegistDAO();
MemberRegistDTO dto = new MemberRegistDTO();

String user_id = request.getAttribute("USER_ID").toString();
dto = dao.selectmemberresult(user_id);

String email1 = dto.getEmail().split("@")[0];
String email2 = dto.getEmail().split("@")[1];

String mobile1 = dto.getMobile().split("-")[0];
String mobile2 = dto.getMobile().split("-")[1];
String mobile3 = dto.getMobile().split("-")[2];

String gender = dto.getGender();
System.out.println(gender);

%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원가입폼 만들기</title>
<style type="text/css">
	body { font-size: 13px; }
	input [type="text"]{ height:20px; width:200px; }
	input [type="radio"]{ width:20px;}
	input.button1 {
		background-color:#ff0000; color:#ffffff; height:30px; border:1px solod #00afa0;
	}
	input.button2 {
		background-color:#339900; color:#ffffff; height:30px; border:1px solod #00afa0;
	}
	input.button3 {
		background-color:#0000ff; color:#ffffff; height:30px; border:1px solod #00afa0;
		height:100px; width:200px; font-size:1.5em;
	}
	.s50{width:50px;}.s70{width:70px;}.s90{width:90px;}
	.s200{width:200px;}.s300{width:300px;}.s400{width:400px;}
</style>

<script type="text/javascript">
//아이디 검증을 위한 전역변수
var idObj;
var idFlag;
window.onload = function(){
	idObj = document.registFrm.user_id;//아이디 객체		
}

//아이디 중복체크를 위해 팝업창을 띄우기전 아이디의 유효성을 검증한다. 
function id_overlapping(fn)
{
	//아이디 입력후 중복확인
	if(idObj.value.length==0) {	
		alert('아이디를 기입하신다음 중복확인을 누르세요.') ;
		idObj.focus();
		return;
	}	
	
	if(!idCapsule()){
		idObj.value="";
		idObj.focus();
		return;
	}
	
	window.open('id_overlap.jsp?user_id=' + idObj.value , 'IDWin', 
		'width=580, height=270, toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no');	
}
//아이디가 8~12자 사이가 아니면 false를 반환한다.
var idLength = function(param){	
	
	//console.log(param.value.length);	
	
	if(!(param.value.length>=8 && param.value.length<=12))
	{		
		return false;
	}
	return true;
}
//아스키코드로 숫자인지 여부확인 : 숫자라면 true를 반환한다.
function isNumber(param){		
	for(var i=0 ; i<param.length ; i++){
		if(!(param[i].charCodeAt(0)>=48 && param[i].charCodeAt(0)<=57)){
			return false;
		}		
	}
	return true;
}
//아이디의 첫문자는 숫자로 시작할수 없다
var idStartAlpha = function(param){	
	if(isNumber(param.value.substring(0,1))==true){		
		return false;
	}	
	return true;
}
//아스키코드로 숫자 or 알파벳인지 확인. 아니면 false반환
function isAlphaNumber(param){
	for(var i=0 ; i<param.value.length ; i++){			
		if(!((param.value[i].charCodeAt(0)>=97 && param.value[i].charCodeAt(0)<=122) 
				|| (param.value[i].charCodeAt(0)>=65 && param.value[i].charCodeAt(0)<=90)
				|| (param.value[i].charCodeAt(0)>=48 && param.value[i].charCodeAt(0)<=57))){
			return false;	
		}
	}
	return true;
}
//아이디검증 로직을 하나로 묶는다.
function idCapsule(){
	
	//1.아이디는 8~12자 이내여야 한다. 즉 7자를 쓰거나 13자를 쓰면 잘못된 아이디로 판단하고 재입력을 요구한다.
	if(!idLength(idObj)){
		alert('아이디는 8~12자만 가능합니다.');
		return false;
	}
	
	//2.아이디는 반드시 영문으로 시작해야 한다. 만약 숫자로 시작하면 잘못된 아이디로 판단한다.
	if(!idStartAlpha(idObj)){
		alert("아이디는 숫자로 시작할수 없습니다.");
		return false;
	}	

	//3.영문과 숫자의 조합으로만 구성해야 한다. 특수기호가 들어가거나 한글이 들어갈 경우 잘못된 아이디로 판단한다.
	if(!isAlphaNumber(idObj)){
		alert("아이디는 영문과 숫자만 포함할수 있습니다.");
		return false;
	}	
	
	return true;
}
//이메일 셀렉트 선택하면 도메인부분에 입력하기
function choiceInput(frm, elem) { 
	for(var i=0; i<elem.length;i++) { 
		if (elem.options[i].selected) {
			if(elem.options[elem.selectedIndex].value!="direct_input"){
				frm.email_domain.value = elem.options[elem.selectedIndex].value	
			}
			else{
				frm.email_domain.value = "";
				frm.email_domain.focus();
			}
		} 
	}
} 
function commonFocusMove(obj, mLength, next_obj){
    //DOM에 입력된 글자수의 길이를 가져온다.
    var strLength = obj.value.length;
    //조건에 만족할때 다음 항목으로 포커스를 이동한다. 
    if(strLength >= mLength){
        eval('document.registFrm.'+next_obj).focus();
    }
}
function registFrmCheck()
{	
	var fn = document.registFrm;
	
	//일반적인방법
	if(fn.user_id.value==""){
		alert("아이디를 입력해주세요");fn.user_id.focus();return false;
	}	
		  
	
	if(!idCapsule()){
		idObj.value="";
		idObj.focus();
		return false;
	}
	if(fn.user_pw1.value==""){alert("비밀번호를 입력해주세요");fn.user_pw1.focus();return false;}
	if(fn.user_pw2.value==""){alert("비밀번호를 입력해주세요");fn.user_pw2.focus();return false;}
	
	
	var chkBrandNum = 0;
    //관심브랜드 항목만큼 루프
	for(var i=0 ; i<fn.user_brand.length ; i++){         
		if(fn.user_brand[i].checked==true) chkBrandNum++;
	}
	if(chkBrandNum!=2){        
		alert("관심브랜드는 2개를 선택하셔야 합니다.");
		return false;
	}
	
	
	var chkpartNum = 0;
    //관심분야 항목만큼 루프
	for(var i=0 ; i<fn.user_part.length ; i++){         
		if(fn.user_part[i].checked==true) chkpartNum++;
	}
	if(!(chkpartNum>=1 && chkpartNum<=3)){        
		alert("관심분야는 1~3개를 선택하셔야 합니다.");
		return false;
	}
	
	
	
	//나머지 빈값체크에 대해서는 생략합니다.
			 		
	//아이디 중복확인을 마쳐야 회원가입을 할수있다.
	if(fn.overFlag.value=="0"){
		alert("아이디 중복확인을 해주세요.")
		return false;
	}		
	 
}
function registFrmCheck2()
{	
	var fn = document.registFrm;
	
	var frmArray = ["user_id", "user_pw1", "user_pw2", "user_name", 
		"gender[0]","birthday",	"birthLS[0]","email_id","email_domain",
		"email_yn[0]","mobile1","mobile2","mobile3","sms_yn[0]"]; 
	var txtArray = ["아이디", "패스워드", "패스워드확인", "이름", "성별", 
		"생년월일", "양력/음력", "이메일", "이메일도메인", 
		"이메일수신확인","휴대전화번호1","휴대전화번호2","휴대전화번호3",
		"휴대전화수신확인"]; 
			
	for(var i=0 ; i<frmArray.length ; i++)
	{
		if(eval("fn."+frmArray[i]+".type")=="text" 
				|| eval("fn."+frmArray[i]+".type")=="password" 
				|| eval("fn."+frmArray[i]+".type")=="date")
		{
			/*
			//일반적인방법
			if(fn.user_id.value==""){
				alert("아이디를 입력해주세요");
				fn.user_id.focus();
				return false;
			}
			*/				
			/*
			frmArray[i]이 string타입이므로 fn, value
			까지 문자열로 만들어준 다음 eval함수로
			DOM을 가져올수 있는 명령으로 만들어준다.
			*/
			if(eval("fn."+frmArray[i]+".value")==""){
				alert(txtArray[i]+"를(을) 입력하세요");
				eval("fn."+frmArray[i]+".focus()");
				return false;
			}			
		}
		else if(eval("fn."+frmArray[i]+".type")=="radio" || 
				eval("fn."+frmArray[i]+".type")=="checkbox")
		{
			//alert(frmArray[i]+"라디오박스");	
			var isRadio = false;
			var radioTxt =
				frmArray[i].substring(0,frmArray[i].length-3);
			var isGender = false;
			
			for(var j=0 ; j<eval("fn."+radioTxt+".length") ; j++)
			{
				if(eval("fn."+radioTxt+"["+j+"].checked")==true){
					isRadio = true;
					break;
				}
			}
			if(isRadio==false){
				alert(txtArray[i]+"를(을) 선택하세요");
				eval("fn."+radioTxt+"[0].focus()");
				return false;
			}
		}
		
		//아이디 중복확인을 마쳐야 회원가입을 할수있다.
		if(fn.overFlag.value=="0"){
			alert("아이디 중복확인을 해주세요.")
			return false;
		}		
	}
}

function registFrmCheck3(){
	var fn = document.registFrm;
	/* 폼값에 대한 검증은 모델1방식에서 했던 내용을 참조한다.*/
	fn.action="../homework/MemberRegist.do";
	fn.method ="post";
	fn.submit();
}

</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function postOpen()
{
    new daum.Postcode({
        oncomplete: function(data) {
			
        	var f = document.registFrm;
        	f.zipcode.value = data.zonecode;
        	f.address1.value = data.address;
        	
        	f.sido.value = data.sido;
        	f.gugun.value = data.sigungu;
        	
        	f.address2.focus();
        }
    }).open();
}

</script>
</head>
<body>
<form name="registFrm" action="MemberAction.jsp" method="post" 
	onsubmit="return registFrmCheck();">
<input type="hid-den" name="overFlag" value="0" />
	
<table width="90%" align="center" border="0" cellspacing="5"
	cellpadding="0">
	<colgroup>
		<col width="25%" />
		<col width="75%" />
		<!-- *로 대체해도됨 -->
	</colgroup>
	<tr>
		<td colspan="2" style="font-size: 24px;"><b>회원정보<span
				style="color: red;">(필수)</span></b></td>
	</tr>
	<tr>
		<td>아이디</td>
		<td>
			<input type="text" name="user_id" value="<%=dto.getUser_id() %>" placeholder="8자리이상" class="input1" /> 
			<input type="button" value="아이디중복확인" class="button2" 
				onclick="id_overlapping(this.form);" />

			<span style="color: red; font-size: 14px;">아이디형식에`
				맞춰주세요.(영문,숫자 조합 8문자 이상)</span></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="user_pw1" value="<%=dto.getUser_pw() %>" placeholder="****" class="input1" /> <span style="color: #cecece; font-size: 14px;">8~20자리의 영문,숫자조합을
				권장합니다.</span></td>
	</tr>
	<tr>
		<td>비밀번호확인</td>
		<td><input type="password" name="user_pw2" value="<%=dto.getUser_pw() %>" placeholder="****" class="input1" /></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" name="user_name" value="<%=dto.getUser_name() %>" placeholder=""	class="input1" /></td>
	</tr>
	<tr>
		<td style="height: 40px;">성별</td>
		<td>
			<input type="radio" class="radio1" name="gender" value="M" checked=""/><label	for="gender1">남성</label>
			&nbsp;&nbsp; 
			<input type="radio" class="radio1" name="gender" value="W" /><label for="gender2">여성</label>
		</td>
	</tr>
	<tr>
		<td>생년월일</td>
		<td><input type="date" name="birthday" value="<%=dto.getBirthday() %>" placeholder="" class="input1" /> &nbsp;&nbsp;&nbsp;&nbsp; 
			<input type="radio" class="radio1" name="birthday_ls" value="S" /><label for="solar">양력</label> 
			&nbsp;&nbsp; 
			<input type="radio" class="radio1" name="birthday_ls" value="L" /><label for="lunar">음력</label></td>
	</tr>		
	<tr>
		<td>이메일</td>
		<td>
			<input type="text" name="email_id" value="<%=email1 %>" placeholder="" class="input1" />
			@ 
			<input type="text" name="email_domain" value="<%=email2 %>" placeholder="" class="input1" />
			&nbsp;
			<select name="email_choice" style="height:25px;" onchange="choiceInput(this.form, this)">
				<option value="">-선택하세요-</option>
				<option value="naver.com">네이버</option>
				<option value="hanmail.net">다음</option>
				<option value="gmail.com">구글G메일</option>
				<option value="yahoo.com">야후</option>
				<option value="direct_input">-직접입력-</option>
			</select>
			<br /> 이메일 수신동의시, 신상튜브 등의 정보를 받아보실수 있습니다. <br /> 수신동의 거부시에도 기본서비스는
			발송됩니다. 
			<input type="radio" name="email_yn" value="Y" id="email_yes" /><label for="email_yes">예</label> 
			<input type="radio" name="email_yn" value="N" id="email_no" /><label for="email_no">아니오</label>
		</td>
	</tr>
	<tr>
		<td>휴대전화</td>
		<td>
			<input type="text" name="mobile1" value=<%=mobile1 %> placeholder="" class="s50" maxlength="3" />
			- 
			<input type="text" name="mobile2" value=<%=mobile2 %> placeholder="" class="s70" maxlength="4" /> 				
			- 
			<input type="text" name="mobile3" value=<%=mobile3 %> placeholder="" class="s70" maxlength="4" />
		 	<br /> 
		 	할인혜택과
			이벤트 등의 소식 안내를 SMS로 받으실수 있습니다. <br /> 
			수신동의 거부시에도 기본서비스는 튜브됩니다. 
			<input type="radio" name="sms_yn" value="Y" /><label for="sms_yes">예</label> 
			<input type="radio" name="sms_yn" value="N" /><label for="sms_no">아니오</label>
		</td>
	</tr>
</table>


<br />
<br />
<br />
<br />


<table width="90%" align="center" border="0" cellspacing="5"
	cellpadding="0" style="background-color: #D5D5D5;">
	<colgroup>
		<col width="25%" />
		<col width="75%" />
		<!-- *로 대체해도됨 -->
	</colgroup>
	<tr>
		<td colspan="2" style="font-size: 24px;"><strong>부가튜브<span style="color: #ff0000;">(선택)</span></strong></td>
	</tr>
	<tr>
		<td>일반전화</td>
		<td>
			<input type="text" name="phone1" value="" onkeyup="commonFocusMove(this,3,'phone2');"  class="s50" maxlength="3" />
			- 
			<input type="text" name="phone2" value="" onkeyup="commonFocusMove(this,4,'phone3');" class="s70" maxlength="4" /> 				
			- 
			<input type="text" name="phone3" value="" onkeyup="commonFocusMove(this,4,'zipcode');" placeholder="" class="s70" maxlength="4" />
		</td>
	</tr>
	<tr>
		<td>주소</td>
		<td>
			<input type="text" name="zipcode" value="<%=dto.getZipcode() %>" placeholder="" class="s50" maxlength="5" /> 
			<input type="button" value="우편번호찾기" class="button1" onclick="postOpen();" />
			<br />
			<input type="text" name="address1" value="<%=dto.getAddress1() %>" placeholder="" class="input2 s300" /><br/>
			<input type="text" name="address2" value="<%=dto.getAddress2() %>" placeholder="" class="input2 s400" />
			
			<input type="hidden" name="sido" />
			<input type="hidden" name="gugun" />
		</td>
	</tr>
	<tr>
		<td>직업</td>
		<td>
			<select name="job" style="height:25px;">
				<option value="직장인">직장인</option>
				<option value="자영업">자영업</option>
				<option value="군인">군인</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>관심브랜드</td>
		<td>
			<table border=0 style="width: 100%">
				<tr>
					<td width="33%"><label><input type="checkbox" name="user_brand" value="한빛미디어" />한빛미디어</label></td>
					<td width="33%"><label><input type="checkbox" name="user_brand" value="한빛아카데미" /></label>한빛아카데미</td>
					<td width="33%"><label><input type="checkbox" name="user_brand" value="한빛비즈" />한빛비즈</label></td>
				</tr>
				<tr>
					<td><label><input type="checkbox" name="user_brand" value="한빛라이프" />한빛라이프</label></td>
					<td><label><input type="checkbox" name="user_brand" value="리얼타임 eBook" />리얼타임 eBook</label></td>
					<td><label><input type="checkbox" name="user_brand" value="MAKE" />MAKE</label></td>
				</tr>
				<tr>
					<td><label><input type="checkbox" name="user_brand" value="한빛에듀" />한빛에듀</label></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>관심분야</td>
		<td>
			<table border=0 style="width:100%">
				<tr>
					<td width="33%"><label><input type="checkbox" name="user_part" value="프로그래밍 언어" />프로그래밍 언어</label></td>
					<td width="33%"><label><input type="checkbox" name="user_part" value="웹" />웹</label></td>
					<td width="33%"><label><input type="checkbox" name="user_part" value="모바일/게임" />모바일/게임</label></td>
				</tr>
				<tr>
					<td><label><input type="checkbox" name="user_part" value="데이터베이스" />데이터베이스</label></td>
					<td><label><input type="checkbox" name="user_part" value="네트워크/보안" />네트워크/보안</label></td>
					<td><label><input type="checkbox" name="user_part" value="IT자격증/수험서" />IT자격증/수험서</label></td>
				</tr>
				<tr>
					<td><label><input type="checkbox" name="user_part" value="OA/오피스" />OA/오피스</label></td>
					<td><label><input type="checkbox" name="user_part" value="디자인" />디자인</label></td>
					<td><label><input type="checkbox" name="user_part" value="사진/예술" />사진/예술</label></td>
				</tr>
				<tr>
					<td><label><input type="checkbox" name="user_part" value="경제/경영" />경제/경영</label></td>
					<td><label><input type="checkbox" name="user_part" value="자기계발" />자기계발</label></td>
					<td><label><input type="checkbox" name="user_part" value="인문/사회/과학" />인문/사회/과학</label></td>
				</tr>
				<tr>
					<td><label><input type="checkbox" name="user_part" value="여행/취미" />여행/취미</label></td>
					<td><label><input type="checkbox" name="user_part" value="가정/건강/유아" />가정/건강/유아</label></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="3"><label><input type="checkbox" name="user_part" value="기타" />기타:</label>
					<input type="text" class="member"  name="user_part_txt" style="padding: 2px" /></td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<p style="text-align: center;">
	<input type="submit" value="회원가입수정모델1" class="button3" />
	<input type="button" value="회원가입수정모델2(Servlet)" class="button3" onclick="registFrmCheck3()"/>
</p>

</form>
</body>
</html>