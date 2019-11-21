
$(document).ready(function () {
	/*아카이브 컬렉션 상세 - 내 알람 바구니 담기 팝업*/
	$('.popcall--basket').bind('click', function(e) {
		e.preventDefault();
		BPOPUP =  $('#popBasket').bPopup({
		    modalClose : true,
		    opacity: 0.8,
	        positionStyle: 'fixed',
	        onClose : function(){
	        	$(".popcall--basket").focus();
	        }
		});
	});

	/*우편번호 검색 팝업*/
	$('.popcall--zipcode').bind('click', function(e) {
		e.preventDefault();
		BPOPUP =  $('#popZipcode').bPopup({
		    modalClose : true,
		    opacity: 0.8,
	        positionStyle: 'fixed',
	        onClose : function(){
	        	$(".popcall--zipcode").focus();
	        }
		});
		$("#keyword").focus();
	});

	// 상세 전시관 위치 팝업
	$(".popcall--place").bind('click',function(e){
		e.preventDefault();
		$('#popPlace').bPopup({
			positionStyle : 'fixed',
	        onClose : function(){
	        	$(".popcall--place").focus();
	        }
		});
		$("#b-close").focus();
	});

	// 멤버십 혜택 약관 팝업
	$(".popcall--terms").bind('click',function(e){
		e.preventDefault();
		$('#popTerms').bPopup({
			positionStyle : 'fixed',
	        onClose : function(){
	        	$(".popcall--terms").focus();
	        }
		});
		$("#b-close").focus();
	});
	
	// 다국어 해외 기자 신청 팝업
	$(".popcall--reporter").bind('click',function(e){
		e.preventDefault();
		$('#popReport').bPopup({
			positionStyle : 'fixed',
	        onClose : function(){
	        	$(".popcall--reporter").focus();
	        }
		});
		$("#infoOrgan").focus();
	});


	// 다국어 영상 팝업
	$(".popcall--movie").bind('click',function(e){
		e.preventDefault();
		$('#popMovie').bPopup({
			positionStyle : 'fixed',
	        onClose : function(){
	        	$(".popcall--movie").focus();
	        }
		});
	});

	//관람 > 과천관 등 관련 팝업
	$('.popcall--bus_schedule').bind('click', function(e) {
		e.preventDefault();
		BPOPUP = $('#popBusSchedule').bPopup({
			modalClose: true,
			opacity: 0.8,
			positionStyle: 'fixed',
	        onClose : function(){
	        	$(".popcall--bus_schedule").focus();
	        }
		});
		$("#popBusScheduleCloseBtn").focus();
	})
	$(".popcall--discount").bind('click',function(e){
		e.preventDefault();
		$('#popDiscountInfo').bPopup({
			positionStyle : 'fixed',
	        onClose : function(){
	        	$(".popcall--discount").focus();
	        }
		});
		$("#popDiscountInfoCloseBtn").focus();
	});

	//공통 > 풋터 뉴스레터 정보 이용동의 팝업
	$(".popcall--emailAgree").bind('click',function(e){
		e.preventDefault();
		$('#popEmailAgree').bPopup({
			positionStyle : 'fixed',
	        onClose : function(){
	        	$(".popcall--emailAgree").focus();
	        }
		});
		$("#newsletterAgree").focus();
	});

	//아카이브 > 도서 > 상세검색 
	//한국대학부호검색
	$(".popcall--univcode").bind('click',function(e){
		e.preventDefault();
		$('#popUnivcode').bPopup({
			positionStyle : 'fixed',
	        onClose : function(){
	        	$(".popcall--univcode").focus();
	        }
		});
	});
	//한국정부기관부호검색
	$(".popcall--agencycode").bind('click',function(e){
		e.preventDefault();
		$('#popAgencycode').bPopup({
			positionStyle : 'fixed',
	        onClose : function(){
	        	$(".popcall--agencycode").focus();
	        }
		});
	});
	// 아카이브 세미나 예약하기 팝업
	$(".popcall--seminar").bind('click',function(e){
		e.preventDefault();
		$('#popSeminarApply').bPopup({
			positionStyle : 'fixed',
	        onClose : function(){
	        	$(".popcall--seminar").focus();
	        }
		});
	});
	// 아카이브 이용안내 팝업
	$(".popcall--archiveInfo").bind('click',function(e){
		e.preventDefault();
		$('#popArchiveInfo').bPopup({
			positionStyle : 'fixed',
	        onClose : function(){
	        	$(".popcall--archiveInfo").focus();
	        }
		});
		$("#popArchiveInfoCloseBtn").focus();
	});
});



/*관람 - 전시실층별안내 맵 팝업 관련 */
;(function($, win) {
	'use strict';
	var $win = $(win);
	$.fn.mapPop = function (options) {
		var settings = $.extend(true, {
			container: $('#pop_map'),
			floorStart: 1,
			publicPath: '../resources/images/visit/',
			fileExt: '.jpg'
		}, options||{});

		return this.each(function () {
			var $this = $(this);
			$this.on('click', function (e) {

				$.preventActions(e);

				var place = $this.attr('id').split('_')[1];
				var $popMap = settings.container.addClass(place+'_map');
				var floorStart = settings.floorStart;
				var floorStartImageNum = (floorStart > 0) ? '0' + floorStart: 'b' + Math.abs(floorStart);
				var placeHtml = "";

				var m = new Image();
				m.src = settings.publicPath + 'img_' + place + '_' + floorStartImageNum + settings.fileExt;
				place = place.charAt(0).toUpperCase() + place.slice(1);
				if(mobileKey == "PC"){
					placeHtml = './pop'+place+'Map.html';
				}else{
					placeHtml = './pop'+place+'MobileMap.html';
				}
				
				console.log(placeHtml);
				m.onload = function () {
					$popMap.load(placeHtml, function () {
						$popMap.bPopup({
							positionStyle: 'fixed',
							onClose : function(){
					        	$('#view_'+place.toLowerCase()+'_map').focus();
					        }
						}, function () {
							var $infos = $('.infos'),
								$controller = $('#controller'),
								$floors = $controller.find('a'),
								$popCont = $('#pop_cont'),
								$btn_open_controller = $('#btn_open_controller'),
								openarrSanpCnt = 0
							;

							$('.map_img_box_in').mCustomScrollbar({axis:"x"});

							$btn_open_controller.on('click', function () {
								$popCont.toggleClass('ellipsis_controller');
								if(openarrSanpCnt > 0 && $('.ico_open_arr').text() == '층 선택 메뉴 닫기'){
									$('.ico_open_arr').text("층 선택 메뉴 열기");
								}else{
									$('.ico_open_arr').text("층 선택 메뉴 닫기");
								}
								openarrSanpCnt ++;
							});

							$controller.on('click', 'a', function (e) {
								$.preventActions(e);
								$floors.removeClass('active');
								var $this = $(this).addClass('active');

								$infos.removeClass('active');
								var $cur = $($this.attr('href')).addClass('active');
								var w = $win.width();
								if(w < 1024 ) {
									$controller.removeAttr('style');
								}
								else {
									$controller.css('top', $cur.find('.common_facil').height() + 68 + 'px');
								}

							});
							$controller.find('a').filter(function () {
								var n = (floorStart < 0) ? 'b' + Math.abs(floorStart): 'f'+ floorStart;
								return '#'+n === $(this).attr('href');
							}).click().end().eq(0).focus();

							if($win.width() >= 1024) {
								$btn_open_controller.click();
							}
						});
					});
				};
				m.onerror = function (e) {
					console.warn(e.type);
					console.dir(e);
				}
			})
		})
	}
})(jQuery, window);