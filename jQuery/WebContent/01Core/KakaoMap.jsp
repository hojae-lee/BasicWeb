<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</head>
<body>
	<p style="margin-top: 12px">
		<em class="link"> <a href="javascript:void(0);"
			onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
				혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요 . </a>
		</em>
	</p>

	<div id="map" style="width: 90%; height: 700px;"></div>     

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e6c1306b0809eb4842dc037c77c84813&libraries=services,clusterer,drawing"></script>

	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.478710, 126.878648), // 지도의 중심좌표
			level : 10     
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		var listData = [
		    '경기도 용인시 처인구 포곡읍 에버랜드로', 
		    '서울특별시 송파구 잠실동 올림픽로 240', 
		    '경기도 과천시 막계동 광명로 181',
		    '경기도 부천시 원미구 상동 도약로 1',
		    '경기도 과천시 막계동 대공원광장로 102',
		    '인천광역시 중구 북성동 월미문화로 81',
		    '제주특별자치도 서귀포시 표선면 돈오름로 170',
		    '서울특별시 광진구 능동 능동로 216',
		    '강원도 정선군 고한읍 하이원길 424',
		    '경상남도 거제시 중곡1로 92 한일빌딩',
		    '제주특별자치도 서귀포시 안덕면 화순중앙로 132',
		    '경기도 용인시 처인구 포곡읍 에버랜드로 199',
		    '부산광역시 부산진구 새싹로 295',
		    '인천광역시 중구 월미로 252',
		    '경기도 화성시 송산면 지화리 산70',
		    '전라북도 군산시 성산면 철새로 53 금강랜드',
		    '경상남도 하동군 진교면 구고속도로 374-30',
		    '충청남도 서천군 마서면 장산로855번길 13',
		    '광주광역시 북구 하서로 52',
		    '대전광역시 중구 사정동',
		    '전라북도 군산시 새만금북로 520',
		    '경상남도 고성군 회화면 봉동리 산166-3',
		    '강원도 춘천시 남산면 강촌로 88',
		    '경기도 가평군 청평면 에덴벚꽃길 189',
		    '경기도 양주시 장흥면 권율로 120',
		    '강원도 춘천시 영서로 2965 육림공원',
		    '경상남도 진주시 남강로1번길 112-6 진주랜드',
		    '충청남도 당진시 신평면 삽교천3길 15 삽교호놀이동산',
		    '대구광역시 수성구 용학로 35-5',
		    '제주특별자치도 서귀포시 성산읍 중산간동로 4150-30',
		    '경기도 안성시 공도읍 대신두길 28',
		    '경상북도 경주시 보문로 544',
		    '전남 곡성군 오곡면 오지리 745-5',
		    '강원도 삼척시 도계음 심포남길 99호 (주)하히원추추파크'
		];
		
		var listname = [
			'에버랜드',
			'롯데월드',
			'서울랜드',
			'아인스월드',
			'서울대공원',
			'월미테마파크',
			'제주허브동산',
			'어린이 대공원',
			'하이원리조트 레포츠놀이동산',
			'피터팬 놀이동산',
			'제주마린파크',
			'에버랜드',
			'부산어린이대공원 키득키득파크',
			'마이랜드',
			'애니랜드',
			'금강랜드',
			'금오산랜드',
			'금강하굿둑 놀이공원',
			'광주 어린이대공원',
			'대전오월드조이랜드',
			'새만금 어린이랜드',
			'고성당항포랜드',
			'강촌랜드',
			'꿈의동산놀이공원',
			'두리랜드',
			'육림랜드',
			'진주랜드',
			'삽교호놀이동산',
			'수성랜드',
			'일출랜드',
			'농협안성팜랜드',
			'경주월드',
			'섬진강기차마을드림랜드',
			'하이원 추추파크'
			
		];

		listData.forEach(function(addr, index) {
		    geocoder.addressSearch(addr, function(result, status) {
		        if (status === daum.maps.services.Status.OK) {
		            var coords = new daum.maps.LatLng(result[0].y, result[0].x);

		            var marker = new daum.maps.Marker({
		                map: map,
		                position: coords
		            });
		              
		            marker.setMap(map);
		            
		            var infowindow = new daum.maps.InfoWindow({  
		                content: '<div style="width:150px;text-align:center;">' + listname[index] + '</div>',
		                disableAutoPan: true
		            });
		            infowindow.open(map, marker);
		        } 
		    });
		});
		
	</script>
</body>
</html>