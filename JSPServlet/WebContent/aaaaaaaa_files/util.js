//년도 콤보박스(년도 object로 받아서 처리)
//id(jquery selector), obj(년도 데이터), selVal(기본 선택값)
function getYearObjCombo(id, obj, selVal) {
	
	var objCnt = obj.length;
	
	var HTML = "";
	var selected = "";
	
	for(var cnt=0; cnt<objCnt; cnt++) {
		
		if(selVal && selVal == obj[cnt].year) selected = "selected='selected'";
		else selected = "";
		
		HTML += "<option value='"+obj[cnt].year+"' "+selected+">"+obj[cnt].year+"</option>";
	}
	
	return $(id).append(HTML);
}

//년도 콤보박스(년도 듀레이션)
//id(jquery selector), start(시작년도), end(종료년도), selVal(기본 선택값)
function getYearDurCombo(id, start, end, selVal) {
	
	var HTML = "";
	var selected = "";
	
	for(var cnt=start; cnt<=end; cnt++) {
		
		if(selVal && selVal == cnt) selected = "selected='selected'";
		else selected = "";
		
		HTML += "<option value='"+cnt+"' "+selected+">"+cnt+"</option>";
	}
	
	return $(id).append(HTML);
}

//월 콤보박스
//id(jquery selector), selVal(기본 선택값)
function getMonthCombo(id, selVal) {
	
	var HTML = "";
	var view = "";
	var selected = "";
	
	for(var cnt=1; cnt<=12; cnt++) {
		
		if(cnt<10)	view = "0"+cnt;
		else 		view = cnt;
		
		if(selVal && selVal == view) selected = "selected='selected'";
		else selected = "";
		
		HTML += "<option value='"+view+"' "+selected+">"+view+"</option>";
	}
	
	return $(id).append(HTML);
}

//일 콤보박스
//id(jquery selector), selVal(기본 선택값)
function getDayCombo(id, selVal) {
	
	var HTML = "";
	var view = "";
	var selected = "";
	
	for(var cnt=1; cnt<=31; cnt++) {
		
		if(cnt<10)	view = "0"+cnt;
		else 		view = cnt;
		
		if(selVal && selVal == view) selected = "selected='selected'";
		else selected = "";
		
		HTML += "<option value='"+view+"' "+selected+">"+view+"</option>";
	}
	
	return $(id).append(HTML);
}

//핸드폰번호 앞자리
//id(jquery selector), selVal(기본 선택값)
function getMobileFrontNum(id, selVal){
	
	var numArr = ["010","011","016","017","018","019"];
	
	var numArrCnt = numArr.length
	
	var HTML = "";
	var selected = "";
	
	for(var cnt=0; cnt<numArrCnt; cnt++) {
		
		if(selVal && selVal == numArr[cnt]) selected = "selected='selected'";
		else selected = "";
		
		HTML += "<option value='"+numArr[cnt]+"' "+selected+">"+numArr[cnt]+"</option>";
	}
	
	return $(id).append(HTML);
}

//컨트롤러에서 모델에 담긴 리스트를 화면에서 json 형식으로 변환함 
function strToJsonStr(str) {
	
	var rep1 = str.replace(/\}, {/g,"}@{");	
	var rep2 = rep1.replace(/\[|\]|{|}/g,"");	
	var rep3 = rep2.replace(/=/g,":");
	
	var strArr = rep3.split("@");
	var subStrArr = "";
	var subString = "";
	var newStr = "";
	var comma = "";
	
	for(var i=0; i<strArr.length; i++) {
		
		subStrArr = strArr[i].split(",");
		
		for(var k=0; k<subStrArr.length; k++) {
			
			subString = "\""+ subStrArr[k].trim().replace(":", "\":\"") + "\"";
			
			newStr += comma + subString;
			comma = ",";
		}
		
		comma = "@";
	}
	
	var newStr = "[{" + newStr.replace(/@/g,"},{") + "}]";
	
	return JSON.parse(newStr);
}

//null 이나 빈값을 기본값으로 변경
function nvl(str, defaultVal) {
	
    var defaultValue = "";
     
    if (typeof defaultVal != 'undefined') {
        defaultValue = defaultVal;
    }
     
    if (typeof str == "undefined" || str == null || str == '' || str == "undefined") {
        return defaultValue;
    }
     
    return str;
}

//날짜 구분자 넣기
function dateComma(date, comma) {
	
	var year = date.substr(0,4);
    var month = date.substr(4,2);
    var day = date.substr(6,2);
    
    return year + comma + month + comma + day;
}

//기존 함수(myMemberFrom.jsp), 숫자입력만
function isNumberKey(evt) {

    var charCode = (evt.which) ? evt.which : event.keyCode;

    if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))

        return false;

    return true;
}

//기존함수(PreBooking_popup.jsp), value 체크
function fn_egov_valCheck(val){
	
	if(val != null && val != ''){
		return true;
	}
	return false;
}

//기존함수(PreBooking_popup.jsp), 글자수 체크
function fn_egov_getByte(contents){
	var str_character;
	var int_char_count;
	var int_contents_length;
	
	int_char_count = 0;
	int_contents_length = contents.length;
	
	for(var k=0; k < int_contents_length; k++){
		str_character = contents.charAt(k);
		if(escape(str_character).length > 4)
			int_char_count += 2;
		else
			int_char_count++;
	}
	
	return int_char_count;
}

/* *
 * 인코딩 소스 Base64
 */
var Base64 = {

	// private property
	_keyStr : "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",

	// public method for encoding
	encode : function(input) {
		var output = "";
		var chr1, chr2, chr3, enc1, enc2, enc3, enc4;
		var i = 0;

		input = Base64._utf8_encode(input);

		while (i < input.length) {

			chr1 = input.charCodeAt(i++);
			chr2 = input.charCodeAt(i++);
			chr3 = input.charCodeAt(i++);

			enc1 = chr1 >> 2;
			enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
			enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
			enc4 = chr3 & 63;

			if (isNaN(chr2)) {
				enc3 = enc4 = 64;
			} else if (isNaN(chr3)) {
				enc4 = 64;
			}

			output = output + this._keyStr.charAt(enc1)
					+ this._keyStr.charAt(enc2) + this._keyStr.charAt(enc3)
					+ this._keyStr.charAt(enc4);

		}

		return output;
	},

	// public method for decoding
	decode : function(input) {
		var output = "";
		var chr1, chr2, chr3;
		var enc1, enc2, enc3, enc4;
		var i = 0;

		input = input.replace(/[^A-Za-z0-9\+\/\=]/g, "");

		while (i < input.length) {

			enc1 = this._keyStr.indexOf(input.charAt(i++));
			enc2 = this._keyStr.indexOf(input.charAt(i++));
			enc3 = this._keyStr.indexOf(input.charAt(i++));
			enc4 = this._keyStr.indexOf(input.charAt(i++));

			chr1 = (enc1 << 2) | (enc2 >> 4);
			chr2 = ((enc2 & 15) << 4) | (enc3 >> 2);
			chr3 = ((enc3 & 3) << 6) | enc4;

			output = output + String.fromCharCode(chr1);

			if (enc3 != 64) {
				output = output + String.fromCharCode(chr2);
			}
			if (enc4 != 64) {
				output = output + String.fromCharCode(chr3);
			}

		}

		output = Base64._utf8_decode(output);

		return output;

	},

	// private method for UTF-8 encoding
	_utf8_encode : function(string) {
		string = string.replace(/\r\n/g, "\n");
		var utftext = "";

		for ( var n = 0; n < string.length; n++) {

			var c = string.charCodeAt(n);

			if (c < 128) {
				utftext += String.fromCharCode(c);
			} else if ((c > 127) && (c < 2048)) {
				utftext += String.fromCharCode((c >> 6) | 192);
				utftext += String.fromCharCode((c & 63) | 128);
			} else {
				utftext += String.fromCharCode((c >> 12) | 224);
				utftext += String.fromCharCode(((c >> 6) & 63) | 128);
				utftext += String.fromCharCode((c & 63) | 128);
			}

		}

		return utftext;
	},

	// private method for UTF-8 decoding
	_utf8_decode : function(utftext) {
		var string = "";
		var i = 0;
		var c = c1 = c2 = 0;

		while (i < utftext.length) {

			c = utftext.charCodeAt(i);

			if (c < 128) {
				string += String.fromCharCode(c);
				i++;
			} else if ((c > 191) && (c < 224)) {
				c2 = utftext.charCodeAt(i + 1);
				string += String.fromCharCode(((c & 31) << 6) | (c2 & 63));
				i += 2;
			} else {
				c2 = utftext.charCodeAt(i + 1);
				c3 = utftext.charCodeAt(i + 2);
				string += String.fromCharCode(((c & 15) << 12)
						| ((c2 & 63) << 6) | (c3 & 63));
				i += 3;
			}

		}

		return string;
	},

	URLEncode : function(string) {
		return escape(this._utf8_encode(string));
	},

	// public method for url decoding
	URLDecode : function(string) {
		return this._utf8_decode(unescape(string));
	}
}

/*******************************************************************************
 * max length 체크 시작
 */
function cmm_maxLengthChk(arg, chkLength, name) {
	var argVal = $(arg).val();

	var tmpStr;
	var temp = 0;
	var onechar;
	var tcount;
	tcount = 0;

	tmpStr = new String(argVal);
	temp = tmpStr.length;

	for (k = 0; k < temp; k++) {
		onechar = tmpStr.charAt(k);
		if (escape(onechar) == '%0D') {
		} else if (escape(onechar).length > 4) {
			tcount += 2;
		} else {
			tcount++;
		}
	}

	if (tcount > Number(chkLength)) {
		reserve = tcount - Number(chkLength);
		alert(name + "은(는) " + chkLength + "바이트 이상은 입력 하실수 없습니다.");
		nets_check($(arg).val(), arg, Number(chkLength));
		return false;
	}

	return true;
}

function nets_check(aquery, arg, chkLength) {

	var tmpStr;
	var temp = 0;
	var onechar;
	var tcount;
	tcount = 0;

	tmpStr = new String(aquery);
	temp = tmpStr.length;

	for (k = 0; k < temp; k++) {
		onechar = tmpStr.charAt(k);

		if (escape(onechar).length > 4) {
			tcount += 2;
		} else {
			// 엔터값이 들어왔을때 값(\r\n)이 두번실행되는데 첫번째 값(\n)이 들어왔을때 tcount를 증가시키지 않는다.
			if (escape(onechar) == '%0A') {
			} else {
				tcount++;
			}
		}

		if (tcount > chkLength) {
			tmpStr = tmpStr.substring(0, k);
			break;
		}

	}
	$(arg).val(tmpStr);
	cal_byte(tmpStr);
}
/*******************************************************************************
 * max length 체크 끝
 */

/*******************************************************************************
 * 필수항목, 길이 체크
 */
function cmm_essChk(arg) {
	var chkFg = true;

	$
			.each(
					arg,
					function(index, item) {
						var essYn = item.essYn;
						var inputVal = $("#" + item.id);

						if (essYn == "Y"
								&& ($.trim(inputVal.val()) == "" || $
										.trim(inputVal.val()) == "<P>&nbsp;</P>")) {
							alert(item.name + " 필수항목 누락");
							inputVal.focus();
							chkFg = false;
							return false;
						}

						if ($.trim(item.chklen) != "") {
							if (!cmm_maxLengthChk("#" + item.id, item.chklen,
									item.name)) {
								chkFg = false;
								return false;
							}
						}
					});

	return chkFg;
}

/*******************************************************************************
 * input 숫자만 입력
 */
function cmm_checkDigit(event) {
	if ($(this).val() != "" && $(this).val().match(/[^0-9]/g) != null) {
		$(this).val($(this).val().replace(/[^0-9]/g, ''));
		$(this).focus();
	}
}

/*******************************************************************************
 * 날짜체크
 */
function cmm_isDate(id) {
	var val = $.trim($("input#" + id).val());

	if (val != "") {
		// 숫자, length 확인
		if (val.length == 8) {
			var year = val.substring(0, 4);
			var month = val.substring(4, 6);
			var day = val.substring(6, 8);

			// 유효날짜 확인
			if (checkDate(year, month, day, id)) {
				return true;
			} else {
				return false;
			}
		} else {
			if(langCd == "1"){
				alert("유효하지 않은 년,월,일(YYYYMMDD)입니다. 다시 확인해 주세요!");
			}else{
				alert("Invalid year, month, and day(YYYYMMDD).");
			}
				$("input#" + id).focus();
				return false;
		}
	} else {
		return true;
	}
}

/*******************************************************************************
 * 유효날짜 확인
 */
function checkDate(varCk1, varCk2, varCk3, id) {
	if (varCk1 >= "0001" && varCk1 <= "9999" && varCk2 >= "01"
			&& varCk2 <= "12") {
		febDays = "29";
		if ((parseInt(varCk1, 10) % 4) == 0) {
			if ((parseInt(varCk1, 10) % 100) == 0
					&& (parseInt(varCk1, 10) % 400) != 0) {
				febDays = "28";
			}
		} else {
			febDays = "28";
		}
		if (varCk2 == "01" && varCk3 >= "01" && varCk3 <= "31")
			return true;
		if (varCk2 == "02" && varCk3 >= "01" && varCk3 <= febDays)
			return true;
		if (varCk2 == "03" && varCk3 >= "01" && varCk3 <= "31")
			return true;
		if (varCk2 == "04" && varCk3 >= "01" && varCk3 <= "30")
			return true;
		if (varCk2 == "05" && varCk3 >= "01" && varCk3 <= "31")
			return true;
		if (varCk2 == "06" && varCk3 >= "01" && varCk3 <= "30")
			return true;
		if (varCk2 == "07" && varCk3 >= "01" && varCk3 <= "31")
			return true;
		if (varCk2 == "08" && varCk3 >= "01" && varCk3 <= "31")
			return true;
		if (varCk2 == "09" && varCk3 >= "01" && varCk3 <= "30")
			return true;
		if (varCk2 == "10" && varCk3 >= "01" && varCk3 <= "31")
			return true;
		if (varCk2 == "11" && varCk3 >= "01" && varCk3 <= "30")
			return true;
		if (varCk2 == "12" && varCk3 >= "01" && varCk3 <= "31")
			return true;
	}
	alert("유효하지 않은 년,월,일(YYYYMMDD)입니다. 다시 확인해 주세요!");
	$("input#" + id).focus();
	return false;
}

/*******************************************************************************
 * 날짜 기간 체크
 */
function cmm_dateBfAtChk(start, end) {
	if (Number($("input#" + start).val()) > Number($("input#" + end).val())) {
		if(langCd == "1"){
			alert("시작일자가 종료일자 보다 빠릅니다.");
		}else{
			alert("Start date is faster than end date.");
		}
		$("input#" + start).focus();
		return false;
	}

	return true;
}

/*******************************************************************************
 * 특정날짜의 요일을 구한다.
 */
function getDayOfWeek(a) {
 
    var now = toTimeObject(a);
    var day = now.getDay(); //일요일=0,월요일=1,...,토요일=6
    var week = new Array('일','월','화','수','목','금','토');
    return week[day];
}

/*******************************************************************************
 * Time 스트링을 자바스크립트 Date 객체로 변환
 * parameter time: Time 형식의 String
 */
function toTimeObject(a) { //parseTime(time)
    var year  = a.substr(0,4);
    var month = a.substr(4,2) - 1; // 1월=0,12월=11
    var day   = a.substr(6,2);
    return new Date(year,month,day);
}


/*******************************************************************************
 * 구분자 제거
 */
function cmm_removeFormat(id, arg) {
	var val = $("input[id='" + id + "']").val();
	var arrVal = new Array();
	var rtnVal = "";

	arrVal = val.split(arg);

	for ( var i = 0; i < arrVal.length; i++) {
		rtnVal += arrVal[i];
	}

	$("input[id='" + id + "']").val(rtnVal);
}

function cmm_rtnMsg(msg) {
	if (msg != "") {
		if (msg == "error") {
			alert("에러임.");
		} else {
			alert(msg);
		}
	}
}

function fn_close() {
	window.close();
}

/**
 * 콘트롤(모든 콘트롤 가능)에 값이 입력 또는 선택되었는지와 maxlength가 설정된 경우 한글을 2바이트 계산하여 길이를 체크한다.
 * [파라메터] ctl_name : 체크할 콘트롤 이름 err_message : 체크 오류시 출력할 메세지
 * 
 * ex) if(!emptyLengthCheckName("BD_C_TITLE","제목을 입력해주세요.")) return;
 */
function emptyLengthCheckName(ctl_name, err_message) {
	var ctl = document.getElementsByName(ctl_name);

	if (ctl.length == null || ctl.length == 'undefined') {
		return validationCheck(ctl, err_message);
	} else if (ctl[0].type == 'checkbox' || ctl[0].type == 'radio') {
		return validationCheck(ctl, err_message);
	} else if (ctl.type != 'undefined' && ctl.type != null) {
		return validationCheck(ctl, err_message);
	} else {
		for ( var i = 0; i < ctl.length; i++) {
			if (!ctl[i].disabled) {
				if (!validationCheck(ctl[i], err_message))
					return false;
			}
		}
	}

	return true;
}
/*
 * ==============================================================================================================
 * 공백, 숫자 및 길이 체크
 * =============================================================================================================
 */
/**
 * 콘트롤에 값이 공백 또는 숫자인지와 maxlength가 설정된 경우 길이를 체크한다. [파라메터] ctl_name : 체크할 콘트롤 이름
 * err_message : 체크 오류시 출력할 메세지
 */
function numericLengthCheckName(ctl_name, err_message) {
	var ctl = document.getElementsByName(ctl_name);

	if (ctl.length == null || ctl.length == 'undefined') {
		if (!isNumber(ctl.value)) {
			alert(err_message);
			ctl.focus();
			return false;
		}
	} else {
		for ( var i = 0; i < ctl.length; i++) {
			if (!ctl[i].disabled) {
				if (!isNumber(ctl[i].value)) {
					alert(err_message);
					ctl[i].focus();
					return false;
				}
			}
		}
	}

	return emptyLengthCheckName(ctl_name, err_message);

}
/*
 * ==============================================================================================================
 * 입력한 항목의 byte length 체크 (필수항목이 아닌 경우)
 * =============================================================================================================
 */
function checkByteLengthIde(ctl_name, len) {
	var ctl = document.getElementById(ctl_name);

	if (getByteLengthIde(ctl.value) > len) {
		// alert("value length is " + len + " Check Length");
		alert("입력한 항목의 길이가 " + len + "를 초과 하였습니다.");
		ctl.focus();
		return false;
	}
	return true;
}
/*==============================================================================================================
*   공백 및 길이 체크 
*=============================================================================================================*/	
function validationCheck(ctl,err_message) { 

	if ( ctl.type == 'text' || ctl.type == 'textarea' || ctl.type == 'file' || ctl.type == 'password' || ctl.type == 'hidden'){
		if ( ctl.value == '' ){
		    alert(err_message); 
		    if(!(ctl.type == 'hidden'))ctl.focus();
		    return false;
		} 
		return checkByteLength(ctl, ctl.maxLength);
	}
	else if ( ctl.type == 'select-one' ){
		if (ctl.size < 2 && ctl.selectedIndex == 0 || ctl.size > 1 && ctl.selectedIndex == -1){
		    alert(err_message); 
		    ctl.focus();
		    return false;
		} 
	} 
	else{
		if (! isCheckRadioSelect(ctl) ){
		    alert(err_message); 
		    return false;
		} 
	}
	
	return true;
} 

/*==============================================================================================================
*  입력한 항목의 byte length 체크
*=============================================================================================================*/	
function checkByteLength(ctl, len)
{
	if(len > 0){
		if(getByteLengthIde(ctl.value) > len)
		{
	        //alert("value length is " + len + "  Check Length");
	        alert("입력한 항목의 길이가 " + len + "를 초과 하였습니다.");
	        ctl.focus();
	        return false;
		}
		return true;	
	}else{
		return true;
	}
}

/*==============================================================================================================
*   입력한 항목의 byte length를 계산 한다.
*=============================================================================================================*/	
function getByteLengthIde(val)
{
	var len = 0;
	//UTF-8 3 bytes로 계산
	var lengthTable = new Array( new Array("\u0080", 1), new Array("\u07FF", 2), new Array("\uFFFF", 3) );
	//var lengthTable = new Array( new Array("\u0080", 1), new Array("\u07FF", 2), new Array("\uFFFF", 2) );
	if ( val == null ) return 0

	for(var i = 0; i < val.length; i ++ ) {
		for (j = 0; j  <  lengthTable.length; j++) {
			if (val.charAt(i)  <  lengthTable[j][0]) {
				len += lengthTable[j][1];
				break;
			}
		}
	}
	return len;
}

/*
 * ==============================================================================================================
 * 여기부터 연구>미술관 출판물>미술관소식지 공통 함수(art_publish_2006.html 참조)
 * =============================================================================================================
 */

function OpenWindow(subUrl){
	var url = "" + subUrl;
	var w = 600;   
	var h = 700;
	var LeftPosition=(screen.width-w)/2;
	var TopPosition=(screen.height-h)/2;
	var pop =  window.open(url, "_blank", "top="+TopPosition+", left="+LeftPosition+", width="+w+", height="+h+",toolbar=no,status=no,directories=no,scrollbars=yes,location=no,resizable=no,border=0,menubar=no");
	
	pop.focus();
}

function OpenWindow2(subUrl) { 
	 var url = "" + subUrl;
	 window.open(url,'ebook','toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=1014, height=705'); 
} 	
	
function fn_SelectChange(){
		var value = document.frmRsc.aiYear.value.substring(5,9);
		document.frmRsc.action = "/html/Temporary/art_publish_"+value+".html";
		var urlSet=document.frmRsc.action;
		window.open(urlSet, "_self");
}

/*
 * ==============================================================================================================
 * 여기부터 연구>미술관 출판물>연구,논문 공통 함수(research_list_14th.html 참조)
 * =============================================================================================================
 */

function fork(type){
	 child = window.open('', 'son', 'toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no,width=640,height=500');
	 child.focus();
}

function fn_SelectChanged(){
	
	var url_selectLength = document.frmRsc.url_select.value.substring(0,5).length;
	
	if(url_selectLength == "5"){
		
		var totalLength = document.frmRsc.url_select.value.length;
		
		if(totalLength == "7"){
			
		var value = document.frmRsc.url_select.value.substring(6,7);
		document.frmRsc.action = "/html/Temporary/research_list_"+value+"th.html";
		var urlSet=document.frmRsc.action;
		window.open(urlSet, "_self");
		
		}else if(totalLength == "8"){
			
			var value = document.frmRsc.url_select.value.substring(6,8);
			document.frmRsc.action = "/html/Temporary/research_list_"+value+"th.html";
			var urlSet=document.frmRsc.action;
			window.open(urlSet, "_self");	
			
		}
	}
}

//날짜
function converDateString(dt) {
	return dt.getFullYear() + "-" + addZero(dt.getMonth()+1) + "-" + addZero(dt.getDate());
}

function addZero(i) {
	var rtn = i + 100;
	return rtn.toString().substring(1,3);
}

function getInputDayLabel(ymd) {
	var week = new Array('일', '월', '화', '수', '목', '금', '토');
	var today = new Date(ymd).getDay();
	var todayLabel = week[today];
	return todayLabel;
}

//hash map
Map = function(){
 this.map = new Object();
};   
Map.prototype = {   
    put : function(key, value){   
        this.map[key] = value;
    },   
    get : function(key){   
        return this.map[key];
    },
    containsKey : function(key){    
     return key in this.map;
    },
    containsValue : function(value){    
     for(var prop in this.map){
      if(this.map[prop] == value) return true;
     }
     return false;
    },
    isEmpty : function(key){    
     return (this.size() == 0);
    },
    clear : function(){   
     for(var prop in this.map){
      delete this.map[prop];
     }
    },
    remove : function(key){    
     delete this.map[key];
    },
    keys : function(){   
        var keys = new Array();   
        for(var prop in this.map){   
            keys.push(prop);
        }   
        return keys;
    },
    values : function(){   
     var values = new Array();   
        for(var prop in this.map){   
         values.push(this.map[prop]);
        }   
        return values;
    },
    size : function(){
      var count = 0;
      for (var prop in this.map) {
        count++;
      }
      return count;
    }
};