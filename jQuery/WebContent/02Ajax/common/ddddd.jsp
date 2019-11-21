
	<!--================ Hero sm Banner end =================-->

			<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Parkmoa - 로그인</title>
<link rel="icon" href="../../img/Fevicon.png" type="image/png">
<link rel="stylesheet"
	href="https://www.goodchoice.kr/css/common.css?rand=1566971320" />
<link rel="canonical" href="https://www.goodchoice.kr/user/login">
<title>마이페이지</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="icon" href="../../img/Fevicon.png" type="image/png">
<LINK href="../../css/mypage_fonts.css" rel="stylesheet" type="text/css">
<LINK href="../../css/mypage_reset.css" rel="stylesheet" type="text/css">
<LINK href="../../css/mypage_common.css" rel="stylesheet"
	type="text/css">
<LINK href="../../css/mypage_inc.css" rel="stylesheet" type="text/css">
<LINK href="../../css/mypage_layout.css" rel="stylesheet"
	type="text/css">
<LINK href="../../css/mypage_popup.css" rel="stylesheet" type="text/css">
<LINK href="../../css/mypage_member.css" rel="stylesheet"
	type="text/css">

<link rel="stylesheet" href="../../vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="../../vendors/fontawesome/css/all.min.css">
<link rel="stylesheet"
	href="../../vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="../../vendors/linericon/style.css">
<link rel="stylesheet"
	href="../../vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet"
	href="../../vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet"
	href="../../vendors/Magnific-Popup/magnific-popup.css">

<link rel="stylesheet" href="../../css/style.css">
<link rel="stylesheet" href="../../css/swiper.css">
<link rel="stylesheet" href="../../css/main.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	var _BASE_URL = 'https://www.goodchoice.kr/';
	var _MOBILE = 'W';
	var _KAKAOTALK_APP_KEY = 'f6ffb505bb11d7cc3584d443ce35f704';
	var _FACEBOOK_APP_ID = '607467975974643';
</script>
<script>(function(a,b,c){if(c in b&&b[c]){var d,e=a.location,f=/^(a|html)$/i;a.addEventListener("click",function(a){d=a.target;while(!f.test(d.nodeName))d    =d.parentNode;"href"in d&&(d.href.indexOf("http")||~d.href.indexOf(e.host))&&(a.preventDefault(),e.href=d.href)},!1)}})(document,window.navigator,"standalone")</script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/<popper class=""></popper>min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<header class="header_area">
		<div class="main_menu">
			<nav class="navbar navbar-expand-lg navbar-light "
				style="background-color: #5fb6df">

				<div class="container box_1620">
					<a class="navbar-brand logo_h"
						href="../index.do?authority=${authority }"><img
						src="../../img/logo.jpg" alt=""></a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>

					<div class="collapse navbar-collapse offset "
						id="navbarSupportedContent">
						<ul class="nav navbar-nav menu_nav justify-content-end">
							<li class="nav-item active"><a class="nav-link"
								href="../index.do?authority=${authority }" style="color: white;">메인</a></li>
							<li class="nav-item"><a class="nav-link"
								href="../about.do?authority=${authority }" style="color: white">소개</a></li>

							<li class="nav-item submenu dropdown"><a href="#"
								class="nav-link dropdown-toggle" data-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false"
								style="color: white">테마파크</a>
								<ul class="dropdown-menu">
									<li class="nav-item" style="color: white"><a
										class="nav-link"
										href="../board/list.do?tp_category=park&authority=${authority }">놀이동산</a></li>
									<li class="nav-item" style="color: white"><a
										class="nav-link"
										href="../board/list.do?tp_category=water&authority=${authority }">워터파크</a></li>
									<li class="nav-item" style="color: white"><a
										class="nav-link"
										href="../board/list.do?tp_category=zoo&authority=${authority }">동물원/<br />아쿠아리움
									</a></li>
									<li class="nav-item" style="color: white"><a
										class="nav-link"
										href="../board/list.do?tp_category=forest&authority=${authority }">수목원</a></li>
								</ul></li>
							<li class="nav-item"><a class="nav-link"
								href="../board/infoevent.do?b_flag=event&authority=${authority }"
								style="color: white">이벤트</a></li>
							<li class="nav-item"><a class="nav-link"
								href="../board/infoevent.do?b_flag=faq&authority=${authority }"
								style="color: white">정보게시판</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
	</header>
<script type='text/javascript'>
//<![CDATA[
// 사용할 앱의 JavaScript 키를 설정해 주세요.
Kakao.init('e3a9917f7858f1fd1599b650b19c0699');
function loginWithKakao() {
  // 로그인 창을 띄웁니다.
  Kakao.Auth.login({
    success: function(authObj) {
      //alert(JSON.stringify(authObj));
      location.href = "https://kauth.kakao.com/oauth/authorize?client_id=6b102bba20b2cd09bbb91dbccd68daa8&redirect_uri=http://localhost:8080/project3rd/oauth&response_type=code";
    },
    fail: function(err) {
      alert(JSON.stringify(err));
    }
  });
};
//]]>
</script>
</head>
<body>
	<div class="container">

		<UL class="dex4">
	<div class="layer_fix layer_unfix pop_login pop_mem_reserve">
		<section>
			<form:form id="loginForm" action="../member/LoginAction.do"
				autocomplete="off" method="post">
				<div class="fix_title">
					<a href="../index.do"><img src="../../img/parkmoaLogo.png"
						alt="안되나요" /></a>
				</div>
				<a id="kakao-login-btn" class="btn_start btn_kakao"
					data-device-type="W" href="javascript:loginWithKakao();"><span><i
						class="icon-ic_login_kakaotalk"></i>카카오톡으로 로그인</span></a>
				<button type="button" id="facebook-login-btn"
					class="btn_start btn_fb">
					<span><i class="icon-ic_facebook"></i>Facebook으로 로그인</span>
				</button>
				<a href="${url}" id="naver_id_login" class='btn_start btn_naver'><span><i
						class="icon-ic_login_naver"></i>네이버로 로그인</span></a>
				<p class="space_or">
					<span>또는</span>
				</p>
				<div class="inp_type_1 ico_email form-errors">
					<!-- focus / err -->
					<input type="text" name="id" placeholder="아이디" required
						class="required" value="" data-msg-required="아이디를 입력해 주세요." />
				</div>
				<div class="inp_type_1 ico_pw form-errors">
					<input type="password" name="pw" placeholder="비밀번호" required
						class="required" data-msg-required="비밀번호를 입력해 주세요." />
				</div>
				<button class="btn_link" type="submit"
					style="background-color: #5fb6df;">
					<span style="font-weight: bold;">로그인</span>
				</button>
				<div class="link_half">
					<div>
						<a href="../member/findId.do"><span style="font-size: 0.9em;">아이디/비밀번호
								찾기</span></a>
					</div>
					<div>
						<a href="../member/policy.do"><span style="font-size: 0.9em;">회원가입</span></a>
					</div>
				</div>

			</form:form>
		</section>
	</div>
</body>
</html>
	</DIV>

	</div>
</body>
</html>