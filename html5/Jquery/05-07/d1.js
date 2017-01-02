//d1.js
$(document).ready( function() {						// ready 等待加载页面完成
	$('p.menus').mouseout(function(){
		$('div.menuitems').slideUp('slow');
		$('p').css({
			backgroundImage:""
		});
	});
	$('p.menus').mouseover(function(){
		$(this).css({
			'background-image':"url(1.gif)",
			'backfround-repeat':"no-repeat",
			'background-position':"right"
		}).next("div.menuitems").slideDown(500).siblings("div.menuitems").slideUp("slow");
		$(this).siblings().css({
			backgroundImage:""
		});
	});
	
});