$(document).ready(function () {
   /* 소장품 리스트 주간조회순 */
   $('#owlCollection').owlCarousel({
      loop:false,
      margin: 0,
      nav:false,
      responsive:{
          0:{
              items:2,
              stagePadding: 70,
              margin: 15,
          },
          768:{
              items:3,
              stagePadding: 0,
              margin: 40
          }
      }
   });

   /* 전시 상세 관련 슬라이드 */
   $('#printSlide').owlCarousel({
      loop:false,
      margin: 0,
      responsive:{
          0:{
              items:2,
              stagePadding: 30,
              margin: 15,
              nav:false
          },
          480:{
              items:2,
              stagePadding: 70,
              margin: 15,
              nav:false
          },
          768:{
              items:3,
              stagePadding: 70,
              margin: 15,
              nav:false
          },
          1024:{
             items:3,
             stagePadding:0,
             margin: 15,
             nav:true
          },
          1400:{
              items:5,
              stagePadding: 0,
              margin: 15,
              nav:true
          }
      }
   });
   $('#exhibitSlide').owlCarousel({
      loop:false,
      margin: 0,
      responsive:{
          0:{
              items:2,
              stagePadding: 30,
              margin: 15,
              nav:false
          },
          480:{
              items:2,
              stagePadding: 70,
              margin: 15,
              nav:false
          },
          768:{
              items:3,
              stagePadding: 70,
              margin: 15,
              nav:false
          },
          1024:{
             items:3,
             stagePadding:0,
             margin: 15,
             nav:true
          },
          1400:{
              items:5,
              stagePadding: 0,
              margin: 15,
              nav:true
          }
      }
   });
});

/*$(document).ready(function () {
   // reference for main items
   var galleryView = $('#owlGalleryView');
   // reference for thumbnail items
   var galleryThumbnail = $('#gallery_thumb');
   //transition time in ms
   var duration = 300;

   // carousel function for main slider
   galleryView.owlCarousel({
      loop:false,
      nav:false,
      items:1
   }).on('changed.owl.carousel', function (e) {
      //On change of main item to trigger thumbnail item
      galleryThumbnail.trigger('to.owl.carousel', [e.item.index, duration, true]);
   });

   // carousel function for thumbnail slider
   galleryThumbnail.owlCarousel({
      loop: false,
      nav: false,
      center: true,
      responsive:{
         0:{
            items:3,
            stagePadding: 15
         },
         1024:{
            items:8,
            stagePadding: 0
         }
      }
   }).on('click', '.owl-item', function () {
      // On click of thumbnail items to trigger same main item
      galleryView.trigger('to.owl.carousel', [$(this).index(), duration, true]);

   }).on('changed.owl.carousel', function (e) {
      // On change of thumbnail item to trigger main item
      galleryView.trigger('to.owl.carousel', [e.item.index, duration, true]);
   });

   //These two are navigation for main items
   $('.slider-right').click(function(e) {
      e.preventDefault();
      galleryView.trigger('next.owl.carousel');
   });    
   $('.slider-left').click(function(e) {
      e.preventDefault();
      galleryView.trigger('prev.owl.carousel');
   });
});
*/
$(document).ready(function () {
   /* 아카이브와 도서 메인 이벤트 영역 */
    owl = $('#relatedEvent');
    owlOptions = {
           loop: false,
           margin: 10,
           responsive: {
               0: {
                   items: 2
               },
               1024: {
                   items: 4,
                   nav:true,
                   loop: false
               }
           }
       };
   function parseData(str) {
      try{return JSON.parse(str.replace(/\'/g, '"'))}
      catch(e){
         console.warn('파싱 에러, 보통은 오타 혹은 syntax ----');
         console.log(e.message);
         return false;
      }
   }
   var param = (owl.attr('data-options'))? parseData(owl.attr('data-options')): {};
   owlOptions = $.extend(true, owlOptions, param);

   /* 상세페이지 관련 소장품 */
   var owl2 = $('#collectSlide'),
      owlOptions2 = {
      loop: false,
      margin: 20,
      responsive: {
          0: {
              items: 2
          },
          1024: {
              items: 4,
              nav:true,
              loop: false
          }
      }
   };
   /* 상세페이지 교육 */
   var owl3 = $('#relatedEdu'),
      owlOptions3 = {
      loop: false,
      margin: 20,
      responsive: {
          0: {
              items: 2
          },
          1024: {
              items: 4,
              nav:true,
              loop: false
          }
      }
   };


   /* 슬라이드 off 기능 공통 사용 */
   if ( $(window).width() > 1023 ) {
       var owlActive = owl.owlCarousel(owlOptions); //아카이브와 도서 메인 이벤트 영역
       var owlActive2 = owl2.owlCarousel(owlOptions2); //상세페이지 관련 소장품
       var owlActive3 = owl3.owlCarousel(owlOptions3); //상세페이지 교육
   } else {
       owl.addClass('off'); //아카이브와 도서 메인 이벤트 영역
       owl2.addClass('off'); //상세페이지 관련 소장품
       owl3.addClass('off'); //상세페이지 교육
   }

   $(window).resize(function() {
       if ( $(window).width() > 1023 ) {
           if ( $('#relatedEvent').hasClass('off') ) {
               var owlActive = owl.owlCarousel(owlOptions); //아카이브와 도서 메인 이벤트 영역
               owl.removeClass('off'); //아카이브와 도서 메인 이벤트 영역
           }
       } else {
           if ( !$('#relatedEvent').hasClass('off') ) {
               owl.addClass('off').trigger('destroy.owl.carousel'); //아카이브와 도서 메인 이벤트 영역
               owl.find('.owl-stage-outer').children(':eq(0)').unwrap(); //아카이브와 도서 메인 이벤트 영역
           }
       };
       
       if ( $(window).width() > 1023 ) {
          if ( $('#relatedEvent2').hasClass('off') ) {
             var owlActive = owl.owlCarousel(owlOptions); //아카이브와 도서 메인 이벤트 영역
             owl.removeClass('off'); //아카이브와 도서 메인 이벤트 영역
          }
       } else {
          if ( !$('#relatedEvent2').hasClass('off') ) {
             owl.addClass('off').trigger('destroy.owl.carousel'); //아카이브와 도서 메인 이벤트 영역
             owl.find('.owl-stage-outer').children(':eq(0)').unwrap(); //아카이브와 도서 메인 이벤트 영역
          }
       };

       if ( $(window).width() > 1023) {
           if ( $('#collectSlide').hasClass('off') ) {
               var owlActive2 = owl2.owlCarousel(owlOptions2); //상세페이지 관련 소장품
               owl2.removeClass('off'); //상세페이지 관련 소장품
           }
       } else {
           if ( !$('#collectSlide').hasClass('off') ) {
               owl2.addClass('off').trigger('destroy.owl.carousel'); //상세페이지 관련 소장품
               owl2.find('.owl-stage-outer').children(':eq(0)').unwrap(); //상세페이지 관련 소장품
           }
       };

       if ( $(window).width() > 1023) {
           if ( $('#relatedEdu').hasClass('off') ) {
               var owlActive3 = owl3.owlCarousel(owlOptions3); //상세페이지 교육
               owl3.removeClass('off'); //상세페이지 교육
           }
       } else {
           if ( !$('#relatedEdu').hasClass('off') ) {
               owl3.addClass('off').trigger('destroy.owl.carousel'); //상세페이지 교육
               owl3.find('.owl-stage-outer').children(':eq(0)').unwrap(); //상세페이지 교육
           }
       };
   });
   $('#researchSlide').owlCarousel({
       items:2,
       loop:false,
       margin: 0,
       responsive:{
           0:{
               items:2,
               stagePadding:50,
               margin: 15,
               nav:false
           },
           768:{
               items:4,
               stagePadding: 50,
               margin: 30,
               nav:false
           },
           1024:{
               items:4,
               stagePadding: 50,
               margin: 30,
               nav:true
           }
       }
   });
   /*채널 슬라이드*/
   $('#owlChannel').owlCarousel({
      loop:false,
      margin: 0,
      nav:false,
      responsive:{
          0:{
              items:1,
              stagePadding: 50,
              margin: 15,
          },
          768:{
              items:3,
              stagePadding: 0,
              margin: 40
          }
      }
   });
});


/* 상세페이지 비주얼 */
$(document).ready(function () {
   $('.slider-for').slick({
      slidesToShow: 1,
      slidesToScroll: 1,
      infinite: true,
      autoplay: false,
      asNavFor: '.slider-nav',
      nextArrow: '.slider-right',
      prevArrow: '.slider-left',
      adaptiveHeight: true
   });
   $('.slider-image').slick({
      slidesToShow: 1,
      slidesToScroll: 1,
      infinite: true,
      autoplay: false,
      nextArrow: '.slider-right',
      prevArrow: '.slider-left',
      adaptiveHeight: true
   });
   var $nav = $('.slider-nav').slick({
      slidesToScroll: 1,
      infinite: true,
      autoplay: false,
      asNavFor: '.slider-for',
      focusOnSelect: true,
      nextArrow: '.slider-thumb-right',
      prevArrow: '.slider-thumb-left',
      responsive: [{

         breakpoint: 2200,
         settings: {
            slidesToShow: 8,
            arrows: true
         }

      }, {

         breakpoint: 1680,
         settings: {
            slidesToShow: 5,
            arrows: true
         }

      }, {

         breakpoint: 1024,
         settings: {
            slidesToShow: 3,
            arrows: false
         }

      }]
   });
    if($nav.length) {
        var $win = $(window),
            $slick_nav = $nav.slick('getSlick'),
            $nav_len = $slick_nav.$slides.length,
            breakSettings = $slick_nav.breakpointSettings
        ;
        function updateSlick(e) {
            e.type==='click' && $.preventActions(e);

            var show_num = breakSettings[$slick_nav.activeBreakpoint].slidesToShow;
            if($nav_len <= show_num) {
                $slick_nav.slickSetOption({infinite: false, slidesToScroll: $nav_len});
            }
            else {
                $slick_nav.slickSetOption({infinite: true, slidesToScroll: $nav_len})
            }
        }
        $win.on('resize', updateSlick).trigger('resize');

        $('.slick-arrow').on('click', updateSlick);
    }
});