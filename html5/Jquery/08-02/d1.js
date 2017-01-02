//d1.js
$(document).ready( function() {						// ready 等待加载页面完成
	$('#submit').click(function() {
		var name = $('.uname').val();
		var data ='uname=' + name;
		$.get(
			"welcome.php",
			data,
			function(html) {
				$('#message').html(html);
			
		});
		return false;
	});
	
});