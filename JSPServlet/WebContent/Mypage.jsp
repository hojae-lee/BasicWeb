<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>마이페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<LINK href="aaaaaaaa_files/fonts.css" rel="stylesheet" type="text/css">
<LINK href="aaaaaaaa_files/reset.css" rel="stylesheet" type="text/css">
<LINK href="aaaaaaaa_files/common.css" rel="stylesheet" type="text/css">
<LINK href="aaaaaaaa_files/inc.css" rel="stylesheet" type="text/css">
<LINK href="aaaaaaaa_files/layout.css" rel="stylesheet" type="text/css">
<LINK href="aaaaaaaa_files/popup.css" rel="stylesheet" type="text/css">
<LINK href="aaaaaaaa_files/member.css" rel="stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>	
<body>     
<div class="container">                               
	<DIV class="row" style="text-align: right;">    
	<div class="col-sm-4" style="background-color: #5fb6df;" align="center">
		<button type="button" class="btn" onclick="location.href='#';" style="color:white;">회원정보수정</button> 
	</div>
	<div class="col-sm-4" style="background-color: #5fb6df;" align="center">
		<button type="button" class="btn" onclick="location.href='#';" style="color:white;">담은목록보기</button> 
	</div>
	<div class="col-sm-4" style="background-color: #5fb6df;" align="center">
		<button type="button" class="btn" onclick="location.href='#';" style="color:white;">구매내역확인</button>
	</div>
	
	</DIV>    
		<UL class="dex4">      
			<FIELDSET>
				<SECTION class="sect1 step04">  
					<DIV class="join_titlearea sect2">
						<H4>마이페이지(회원정보수정)</H4>
					</DIV>
					<DIV class="table_area table_area2">
						<TABLE>
							<CAPTION>회원정보 수정에 관한 테이블</CAPTION>
							<COLGROUP>
								<COL class="w14_pc">
								<COL style="width: 75%;">
							</COLGROUP>
							<TBODY>
								<TR>
									<TH scope="row"><LABEL for="infoId"><SPAN
											class="ftclr_red1">*</SPAN><SPAN>아이디</SPAN><SPAN></SPAN></LABEL></TH>
									<TD>
										<DIV class="input_box bdnone">
											<DIV class="input_wrap">
												<input type="text" class="form-control" placeholder="아이디">
											</DIV>
										</DIV>
									</TD>
								</TR>
								<TH scope="row"><LABEL for="infoId"><SPAN
										class="ftclr_red1">*</SPAN><SPAN>이메일</SPAN><SPAN></SPAN></LABEL></TH>
								<TD>
									<DIV class="">
										<input type="text" class="form-control" placeholder="이메일" style="width: 70%">
									</DIV>
								</TD>
								</TR>
								<TR>
									<TH scope="row"><LABEL for="password"><SPAN
											class="ftclr_red1">*</SPAN>비밀번호1</LABEL></TH>  
									<TD>
										<DIV class="">
											<input type="password" class="form-control" placeholder="비밀번호1" style="width: 40%">
										</DIV>
										<p></p>

									</TD>
								</TR>
								<TR>
									<TH scope="row"><LABEL for="rePassword"><SPAN
											class="ftclr_red1">*</SPAN>비밀번호2</LABEL></TH>
									<TD>
										<DIV class="">
											<input type="password" class="form-control" placeholder="비밀번호2" style="width: 40%">
										</DIV>

									</TD>
								</TR>
								<TR>
									<TH scope="row"><LABEL for="infoName"><SPAN
											class="ftclr_red1">*</SPAN>이름</LABEL></TH>
									<TD>
										<DIV class="input_box bdnone">
											<DIV class="input_wrap">
												<INPUT name="infoName" id="infoName" type="text" readonly=""
													value="김동하">
											</DIV>
										</DIV>
									</TD>
								</TR>
								<TR>
									<TH scope="row"><SPAN class="ftclr_red1">*</SPAN>생년월일</TH>
									<TD class="birth">
										<DIV class="">
											<input type="text" class="form-control" placeholder="19940208" style="width: 40%">
										</DIV>
									</TD>
								</TR>
								<TR>
									<TH scope="row"><SPAN class="ftclr_red1">*</SPAN>성별</TH>
									<TD class="gender">
										<DIV class="choice_wrap">
											<INPUT name="memCSex" class="design design_grey"
												id="infoGender1" type="radio" checked="" value="M">
											<LABEL for="infoGender1">남</LABEL>
										</DIV>
										<DIV class="choice_wrap">
											<INPUT name="memCSex" class="design design_grey"
												id="infoGender2" type="radio" value="F"> <LABEL
												for="infoGender2">여</LABEL>
										</DIV>
									</TD>
								</TR>  
								<TR>
									<TH scope="row"><SPAN class="ftclr_red1">*</SPAN>휴대폰</TH>

									<TD>
										<DIV class="">
											<input type="text" class="form-control" placeholder="휴대폰" style="width: 40%">
										</DIV>
									</TD>
								</TR>    
								<TR>
									<TH scope="row"><SPAN class="ftclr_red1">*</SPAN>사업자^^</TH>

									<TD>
										<DIV class="">
											<div class="form-check"> 
												  <label class="form-check-label">    
												    <input type="radio" class="form-check-input" name="optradio" disabled="disabled" checked="checked">기업회원
												  </label>
												</div>
												<div class="form-check">  
												  <label class="form-check-label">
												    <input type="radio" class="form-check-input" name="optradio" disabled="disabled">일반회원
												  </label>
										</DIV>
									</TD>
								</TR>    
							</TBODY>  
						</TABLE> 
						<br /><br />    
						<div align="center">
							<button type="button" class="btn btn-danger" style="width: 150px;" >확인</button>		  				
							<button type="button" class="btn btn-danger" style="width: 150px;" >취소</button>	 											
						</div>  
				</SECTION>
			</FIELDSET>
		</UL>
	</DIV>

</div>
</body>
</html>