//d1.js
$(document).ready( function() {						// ready 等待加载页面完成
	$('#submit').click(function() {
		var name = $('.uname').val();
		var pwd = $('.passwd').val();
		var data ='uname=' + name + '&password=' + pwd;
		$.ajax({
			type:"GET",
			url:"logincheck.php",
			data:data,
			success:function(html) {
				$('#message').html(html);
			}
		});
		return false;
	});
	
});