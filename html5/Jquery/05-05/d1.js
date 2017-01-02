//d1.js
$(document).ready( function() {						// ready 等待加载页面完成
	$('li.mainmenu').hover(
		function(){
			$('ul', this).show();
		},
		function(){
			$('ul', this).hide();
		}
	);
	
});