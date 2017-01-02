//d1.js
$(document).ready( function() {						// ready 等待加载页面完成
	$('#submit').click(function() {
		var name = $('.uname').val();
		var data ='uname=' + name;
		$.ajax({
			type:"POST",
			url:"welcome.php",
			data:data,
			success:function(html) {
				$('#message').html(html);
			}
		});
		return false;
	});
	
});