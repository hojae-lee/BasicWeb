(function ($, win) {
	'use strict';
	var $win = $(window);
	$.preventActions = function (ev) {
		ev = ev || win.event;
		if (ev.stopPropagation && ev.preventDefault) {
			ev.stopPropagation();
			ev.preventDefault();
		}
		else {
			ev.cancelBubble = true;
			ev.returnValue = false;
		}
	};

	$.fn.more = function (settings) {
		var options = $.extend({
			closeText: '간략히 보기',
			openText: '자세히 알아보기',
			infoTextTarget: 'span',
			trigger: '',triggerActiveclass: 'on',
			contents: '',
			flagClassName: 'close'
		}, settings || {});

		return this.each(function () {
			var $this = $(this),
				$contents = $this.find(options.contents),
				$trigger = $this.find(options.trigger),
				$textTarget = $trigger.find(options.infoTextTarget)
			;
			$trigger.on('click', function (ev) {
				$.preventActions(ev);
				if($contents.hasClass(options.flagClassName)) {
					$contents.removeClass(options.flagClassName);
					$trigger.addClass(options.triggerActiveclass)
					if($textTarget.length){
						$textTarget.text(options.closeText);
					}
				}
				else {
					$contents.addClass(options.flagClassName);
					$trigger.removeClass(options.triggerActiveclass)
					if($textTarget.length){
						$textTarget.text(options.openText);
					}
				}
			})

		})
	}
})(jQuery, window);

//header_search, header_gnb, lnb
$(function(){
	// (임시) 이미지 사이즈 fix start
	/* var imgHeight = $('[class*="list_type"] .obj_thumb.img_type2 .thumb > p,[class*="list_type"] .obj_thumb.img_type2 .thumb > a').width();
	$('[class*="list_type"] .obj_thumb.img_type2 .thumb > p,[class*="list_type"] .obj_thumb.img_type2 .thumb > a').height(imgHeight); */

	//다국어 선택
	$('#joinLang').click(function(e){
		e.preventDefault();
		if ($(this).hasClass('on')){
			$(this).removeClass('on');
			$('#header > div').removeClass("lang_on");
		} else {
			$(this).addClass('on');
			$('#header > div').addClass("lang_on");
		}

	});
	$('.lang_selecter ul a').click(function(e){
		e.preventDefault();
		var langTxt = $(this).text();
		$('#joinLang .now').text(langTxt);
		$('#joinLang').removeClass('on');
		$('.lang_selecter').slideUp(400);
	});
	$('.language .lang_close').click(function(e){
		e.preventDefault();
		$('#joinLang').removeClass('on');
		$('.lang_selecter').slideUp(400);
	});


	// header Gnb
	$('#headerGnb .gnb_smenu > h3 > a').click(function(e){
		e.preventDefault();
		if($(window).width() < 1024){
			if ($(this).closest('h3').hasClass('active') === false) {
				$('#headerGnb .gnb_smenu > h3').removeClass('active');
				$(this).closest('h3').addClass('active');
			} else {
				$(this).closest('h3').removeClass('active');
			};

			if ($(this).closest('h3').next('.gnb_smnlist').is(":visible")) {
				$('.gnb_smnlist').slideUp();
			} else {
				$('.gnb_smnlist').slideUp();
				$(this).closest('h3').next('.gnb_smnlist').slideDown(400);
			};
		}
	});

	$('#header .hbtn_gnb > button').click(function(e){
		e.preventDefault();
		if($(window).width() < 1024){
			if ($(this).hasClass("on") === false){
				$(this).addClass("on");
				$('#header').addClass("on");
				$('#wrap').css('height', '100%');
				$('#wrap').addClass('over_y_hidden');
			} else {
				$(this).removeClass("on");
				$('#header').removeClass("on");
				$('#wrap').css('height', 'auto');
				$('#wrap').removeClass('over_y_hidden');
			}
		}

	});

	$('.fix_btn_gnb > button').click(function(e){
		e.preventDefault();
		if(($(window).width() > 1024) && ($(window).scrollTop() > 156)){
			if ($(this).hasClass('on') === false) {
				$(this).addClass('on');
				$('.header_wrap > h1').addClass('hidden');
				$('#gnb').addClass('up_index');
			} else {
				$(this).removeClass('on');
				$('.header_wrap > h1').removeClass('hidden');
				$('#gnb').removeClass('up_index');
			}
		}

	});

	$(window).on('load resize', function(){

		if($(window).width() < 1024){
			$('#gnb').off("mouseenter");
			$('#gnb').off("mouseleave");
			$('.gnb_smenu').off("mouseenter");
			$('.gnb_smenu').off("mouseleave");
		} else {
			$('#headerGnb .gnb_smenu > h3').removeClass('active');
			$('#gnb').on("mouseenter focusin",function(){
				$('#header > div').addClass("gnb_on");
				$(this).addClass("open");
			}).on("mouseleave focusout",function(){
				$(this).removeClass("open");
				$('#header > div').removeClass("gnb_on");
				$('.header_gnbwrap > h3').removeClass("open");
			});
			$('.header_gnbwrap > h3').on("mouseenter focusin",function(){
				$('.header_gnbwrap > h3').removeClass("open");
				$(this).addClass("open");
			}).on("mouseleave focusout",function(){
				$(this).removeClass("open");
			});
			$('.gnb_smenu').on("mouseenter focusin",function(){
				$('.header_gnbwrap > h3').removeClass("open");
				$(this).prev('h3').addClass("open");
			}).on("mouseleave focusout",function(){
				$(this).prev('h3').addClass("open");
			});
		}

	});

	//searchBar
	$("#header .hbtn_search").each(function(){
		var srch = $(".header_searchwrap");
		$("#header .hbtn_search").on("click", function(e){
			// Prevents the default action to be triggered
			e.preventDefault();
			if(srch.css('display') === 'none'){
				$(".header_searchwrap").addClass("show");
				$(this).closest('.header_wrap').find('h1').addClass("sch_show");
				$(".bt_searchwrap_close").addClass('show');
				if ($('.header_wrap h1').hasClass('hidden')) {
					$('.header_wrap h1').removeClass('hidden');
					$('#gnb').removeClass('up_index');
					$('.fix_btn_gnb > button').removeClass('on');
				}
			} else {
				$(".header_searchwrap").removeClass("show");
				$(this).closest('.header_wrap').find('h1').removeClass("sch_show");
				$(".bt_searchwrap_close").removeClass('show');
			}
		});
		$(".bt_searchwrap_close").bind("click", function(e){
			// Prevents the default action to be triggered
			e.preventDefault();
			$(".header_searchwrap").removeClass("show");
			$('.header_wrap').find('h1').removeClass("sch_show");
			$(this).removeClass("show");
		});
	});

	// lnb 클릭 이벤트 제어
	$("#lnb [class*='depth'] .now > a").on('click', function(e){
		e.preventDefault();
		if ($(this).closest('.now').hasClass('on')) {
			$(this).closest('.now').removeClass('on');
		} else {
			$("#lnb [class*='depth'] .now").removeClass('on');
			$(this).closest('.now').addClass('on');
		}

	});

	// datepicker
	$( ".date_pick" ).datepicker({
		inline: true,
		showOtherMonths: true,
		//changeMonth: true,
		//changeYear: true
	});
	//alert($("input[id='langCd']").val());
	//datepicker 한국어로 사용하기 위한 언어설정
	if($("input[id='langCd']").val() == "1"){
		$.datepicker.setDefaults($.datepicker.regional['ko']);
	}else{
		$.datepicker.setDefaults($.datepicker.regional['']);
	}
	//첨부파일 레이어 팝업
	$(".btn_filedown").on('click', function(e){
		if ($(this).parent().parent().hasClass('download')) {
			e.preventDefault();
			$(this).closest('.download').toggleClass('on');
		}		
	});
	$(".filelist .close_file").on('click', function(e){
		e.preventDefault();
		$(this).closest('.download').toggleClass('on');
	});

	//검색필드 열고 닫기
	$(".sch_result_ctrl h4.accordion > a").on('click', function(e){
		e.preventDefault();
		if ($(this).closest('.accordion').next('.open_con').hasClass('on')) {
			$(this).closest('.accordion').removeClass('on');
			$(this).closest('.accordion').next('.open_con').slideUp(400).removeClass('on');
			$(this).find('i').text('열기');
		} else {
			$(this).closest('.accordion').addClass('on');
			$(this).closest('.accordion').next('.open_con').slideDown(400).addClass('on');
			$(this).find('i').text('닫기');
		}
	});

	// 탭메뉴
	$('[class*="tab_type"] li a').on('click', function(e){
		e.preventDefault();
		$(this).closest('[class*="tab_type"]').find('li').removeClass('current');
		$(this).closest('li').toggleClass('current');
	});

	//상세보기 페이지 열고닫기
	$('.gallery_intro .btn_intro .btn_open').on('click', function(e){
		e.preventDefault();
		if ($('.gallery_intro').find('.open_con').hasClass('close')) {
			$(this).closest('.gallery_intro').find('.open_con').removeClass('close');
			$(this).addClass('on');
			$(this).find('span').html('접기');
		} else {
			$(this).closest('.gallery_intro').find('.open_con').addClass('close');
			$(this).removeClass('on');
			$(this).find('span').html('더보기');
		}
	});

	var tpl = '<i class="open_arr_red"></i>',
		$sel = $('#before_year_2012'),
		$lbl = $('.lbl_before_year_2012')
	;
	$sel.change(function () {
		$lbl.html(($sel.val().length) ? tpl: '2012년 이전'+tpl);
	});

	$('.tab_type2').owlCarousel({
		loop: false, autoWidth: true,
		responsive: {
			0: {items: 6},
			1024: {items: 6}
		}
	});

	//스크롤 탑바/상단가기 버튼
	$(window).scroll(function () {
		if ($(this).scrollTop() > 500) {
			$('.btntop').fadeIn();
		} else {
			$('.btntop').fadeOut();
		}
	});
	// scroll body to 0px on click
	$('#TopMove').bind("click", function(e) {
		// Prevents the default action to be triggered.
		e.preventDefault();
		$('body,html').animate({
			scrollTop: 0
		}, 500);
	});
	// scroll body to 0px on click
	$('#newsApplyGo').bind("click", function(e) {
		// Prevents the default action to be triggered.
		e.preventDefault();
		var footerPosition = $("#footer").offset().top;
		$('body,html').animate({
			scrollTop: footerPosition
		}, 500);
	});
});


$(window).resize(function(){

	if($(window).width() > 1024){

		if ($('#header .hbtn_gnb > button').hasClass("on") === true){
			$('#header .hbtn_gnb > button').removeClass('on');
			$('#header').removeClass('on');
			$('#wrap').css('height', 'auto');
			$('#wrap').removeClass('over_y_hidden');
		};

	};

	if ($('.header_wrap h1').hasClass('hidden')) {
		$('.header_wrap h1').removeClass('hidden');
		$('#gnb').removeClass('up_index');
		$('.fix_btn_gnb > button').removeClass('on');
	}



});

$(window).on('load resize scroll',function(){
	if(($(window).width() > 1024) && ($(window).scrollTop() > 156)){
		$('body').addClass('header_fix');
	} else {
		$('body').removeClass('header_fix');
		if ($('.header_wrap h1').hasClass('hidden')) {
			$('.header_wrap h1').removeClass('hidden');
			$('#gnb').removeClass('up_index');
			$('.fix_btn_gnb > button').removeClass('on');
		}
	};

});
$(window).on('load resize',function(){
	// lnb scroll UI 처리
	if(($(window).width() < 1024) && ($('#lnb .depth2_wrap').length)){
		var target1 = $(".depth2_wrap .lnb_sub .active").position().left;
		var m = $("#lnb .depth2_wrap").mCustomScrollbar({
			axis:"x",
			autoHideScrollbar:true
		}).mCustomScrollbar('scrollTo',target1);
	} else if(($(window).width() > 1024) && ($('#lnb .depth2_wrap').length)){
		$("#lnb .depth2_wrap").mCustomScrollbar("destroy");
	};

	if(($(window).width() < 1024) && ($('#lnb .depth3_wrap').length)){
		var target2 = $(".depth3_wrap .lnb_sub .active").position().left;
		$("#lnb .depth3_wrap").mCustomScrollbar({
			axis:"x",
			autoHideScrollbar:true
		});
		$("#lnb .depth3_wrap").mCustomScrollbar("scrollTo",target2);
	} else if(($(window).width() > 1024) && ($('#lnb .depth3_wrap').length)) {
		$("#lnb .depth3_wrap").mCustomScrollbar("destroy");
	}

	// (임시) 이미지 사이즈 fix start
	/* var imgHeight = $('[class*="list_type"] .obj_thumb.img_type2 .thumb > p,[class*="list_type"] .obj_thumb.img_type2 .thumb > a').width();
	$('[class*="list_type"] .obj_thumb.img_type2 .thumb > p,[class*="list_type"] .obj_thumb.img_type2 .thumb > a').removeAttr('style').height(imgHeight); */

});


$(document).ready(function() {
	$('.more button').click(function(){
		$(this).parent().siblings().children('.item').css('display','block')
	})
/*
	$(".collection_treeview").delegate("label input:checkbox", "change", function() {
	    var
	        checkbox = $(this),
	        nestedList = checkbox.parent().next().next(),
	        selectNestedListCheckbox = nestedList.find("label:not([for]) input:checkbox");

	    if(checkbox.is(":checked")) {
	        return selectNestedListCheckbox.prop("checked", true);
	    }
	    selectNestedListCheckbox.prop("checked", false);
	});
	*/

	$(window).on('load resize',function(){
		if ($(window).width() < 1024) {
			if ($('.btn_treeview').css('display') == 'none') {
				$('.btn_treeview').css('display','block');
			}
			$('.btn_treeview a').click(function(){
				$(this).parent().siblings().toggleClass('on');
				$('.btn_treeview').css('display','none');				
			});
			$('.treeview_head a').click(function(){
				$(this).parent().parent().removeClass('on');
				$('.btn_treeview').css('display','block');
			});
		} else {
			if ($('.btn_treeview').css('display') == 'block') {
				$('.btn_treeview').css('display','none');
			}
		}		
	});
	
	
	$('.detail_search').click(function(){
		$('.detail_search_area').slideToggle().toggleClass('on')
		if($('.detail_search_area').hasClass('on')){
			$('.detail_search').css('border-bottom','none');
			$('.search_close').css('display','inline-block');
			$('.isi_select').addClass('on')
		}else{
			$('.detail_search').css('border-bottom','1px #e1e1e1 solid');
			$('.search_close').css('display','none');
			$('.isi_select').removeClass('on')
		}
	})

    /*MMCA 채널 자막*/
    $('.btn_fold button').not('.b-close').click(function(){
    	$('.ico_narration').toggleClass('on')
    	$('.narration_area').slideToggle().toggleClass('on')
    	if($(this).parent().siblings('.narration_area').hasClass('on')){
    		if ($(this).hasClass('en')){
    			$('.btn_fold button').not('.b-close').find('span').text('Subtitle')
    		} else {
    			$('.btn_fold button').not('.b-close').find('span').text('자막접기')
    		}
    	}else{
    		if ($(this).hasClass('en')){
    			$('.btn_fold button').not('.b-close').find('span').text('Subtitle')
    		} else {
    			$('.btn_fold button').not('.b-close').find('span').text('자막열기')
    		}
    	}
    })

    /*file upload*/
    var fileTarget = $('.upload_hidden');
    fileTarget.on('change', function(){
     if(window.FileReader){
     	var filename = $(this)[0].files[0].name;
     } else {
     var filename = $(this).val().split('/').pop().split('\\').pop();
     }
     $(this).siblings('.upload_name').val(filename);
 	});


})
