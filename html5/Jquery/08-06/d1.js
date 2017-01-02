//d1.js
$(document).ready( function() {						// ready 等待加载页面完成
	$('.listbox').hide();
	$('.userid').keyup(function() {
		var uid = $('.userid').val();
		var data ='userid=' + uid;
		$.ajax({
			type:"POST",
			url:"autocomplete.php",
			data:data,
			success:function(html) {
				$('.listbox').show();
				$('.namelist').html(html);
				$('li').hover(function(){
					$(this).addClass('hover');
				},function(){
					$(this).removeClass('hover');
				});
				$('li').click(function(){
					$('.userid').val($(this).text());
					$('.listbox').hide();
				});
			}
		});
		return false;
	});
	
});