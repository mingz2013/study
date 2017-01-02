//d1.js
$(document).ready( function() {						// ready 等待加载页面完成
	/*
	$('.error').hide();
	$('.submit').click(function(event){
		var data=$('.infobox').val();				// 取得数据
		var len=data.length;						// 长度
		if(len<1){
			$('.error').show();
			event.preventDefault();					// 保证不发送到服务器
		}else{
			$('.error').hide();
		}
	});
	*/
	/*
	$('.error').hide();
	$('.submit').click(function(event){
		var data=$('.infobox').val();				// 取得数据
		var len=data.length;						// 长度
		var c=0;
		var age=0;
		var flag=0;
		for(var i=0; i<len; i++){
			c=data.charAt(i).charCodeAt(0);			// 获取ASC值
			*//*
			if(c == 45 && i==0){
				continue;							// 允许为负值
			}
			*//*
			if(c < 48 || c > 57){					// 只为数字
				$('.error').show();
				flag=1;
				event.preventDefault();
				break;
			}else{
				$('.error').hide();
			}
		}
		if(flag==0){
			age=parseInt(data);
			if(age < 5 || age > 99){
				$('.error').show();
				$('.error').text('Invalid Age. Please enter the age within the range 5 to 99');
				event.preventDefault();
			}
		}
	});
	*//*
	$('.error').hide();
	$('.submit').click(function(event){
		var data=$('.infobox').val();				// 取得数据
		var len=data.length;						// 长度
		if(validate_phoneno(data)){					// 验证电话号码
			$('.error').hide();
		}else{
			$('.error').show();
			event.preventDefault();
		}
	});
	function validate_phoneno(ph)
	{
		var pattern = new RegExp(/^[0-9-+]+$/);
		return pattern.test(ph);
	}
	*//*
	$('.error').hide();
	$('.submit').click(function(event){
		var data=$('.infobox').val();				// 取得数据
		var len=data.length;						// 长度
		if(validate_userid(data)){					// 验证用户ID
			$('.error').hide();
		}else{
			$('.error').show();
			event.preventDefault();
		}
	});
	function validate_userid(uid)
	{
		var pattern = new RegExp(/^[a-z0-9_]+$/);
		return pattern.test(uid);
	}
	*//*
	$('.error').hide();
	$('.submit').click(function(event){
		var data=$('.infobox').val();				// 取得数据
		var len=data.length;						// 长度
		if(validate_date(data)){					// 验证日期
			$('.error').hide();
		}else{
			$('.error').show();
			event.preventDefault();
		}
	});
	function validate_date(date)
	{
		var pattern = new RegExp(/\b\d{1,2}[\/-]\d{1,2}[\/-]\d{4}\b/);
		return pattern.test(date);
	}
	*/
	$('.error').hide();
	$('.submit').click(function(event){
		var data=$('.infobox').val();				// 取得数据
		var len=data.length;						// 长度
		if(validate_email(data)){					// 验证email
			$('.error').hide();
		}else{
			$('.error').show();
			event.preventDefault();
		}
	});
	function validate_email(email)
	{
		var pattern = new RegExp(/^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]+$/);
		return pattern.test(email);
	}
});