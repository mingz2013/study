//d1.js
$(document).ready( function() {						// ready 等待加载页面完成
	$('a').hover(
		function(event){
			$(this).addClass('hover');
		},
		function(){
			$(this).removeClass('hover');
		}
	
	);
});