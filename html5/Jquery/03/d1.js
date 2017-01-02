//d1.js
$(document).ready( function() {						// ready 等待加载页面完成
/*
	$('.bold').bind('click', function(){			// bind方法附加单击事件
		alert('You have clicked the Bold button');
	});
	$('.italic').bind('click', function(){			// bind方法 为单个按钮附加单击事件
		alert('You have clicked the italic button');
	});
	$('.buttons').bind('click', function(){			// 为button类附加单击事件
		alert('You have clicked the ' + $(this).text() + ' button ' );
	});
	
	$('.buttons').click(function() {				// 直接用click()单击事件  不用bind
		alert('You have clicked the ' + $(this).text() + ' button ' );
	});
	
	$('.buttons').click(function(event) {				// 直接用click()单击事件  不用bind
		var $target = $(event.target);// 用target属性查看是哪个对象发生的事件
		if($target.is('.bold')) {
			alert('You have clicked the bold button ' );
		}
		if($target.is('.italic')) {
			alert('You have clicked the italic button ' );
		}
	});
	
	$('.buttons').dblclick(function() {				// 双击事件
		alert('You have double-clicked the ' + $(this).text() + ' button ' );
	});
	

	$('.italic').trigger('click');					// 自动触发shuangji事件
	
	$('.buttons').click(function() {				// 直接用click()单击事件  不用bind
		alert('You have clicked the ' + $(this).text() + ' button ' );
		$('.buttons').unbind('click');				// 单击后禁用按钮
	});
	
	
	
	$('.buttons').bind('mousedown', function() {	// 任意按钮上按下鼠标键 的 事件
		alert('The mouse button is pressed over ' + $(this).text() + ' button');
	});
	
	$('.buttons').mouseup(function() {				// 鼠标弹起
		alert('The mouse button is released over ' + $(this).text() + ' button');
	});
	
	$('.buttons').mouseover(function() {				// 鼠标进入
		alert('The mouse button is over ' + $(this).text() + ' button');
	});
	$('.buttons').mouseout(function() {				// 鼠标滑出
		alert('The mouse button is out ' + $(this).text() + ' button');
	});
	
	
	$('.buttons').bind('mousedown', function(event) {	// 任意按钮上按下鼠标键 的 事件
		if(event.button == 0){
			$('p').text('Left mouse button is pressed'+ event.button);	// 左右键
		}else if(event.button == 2){
			$('p').text('Right mouse button is pressed' + event.button);
		}
	});
	*/
	$('img').mousedown(function(event) {				// 图片被单击
		$('p').text('Mouse is clicked at horizontal coordinate:' + event.screenX + ' and at vertical coordinate: ' + event.screenY);
	});
	$('.buttons').mouseover(function(){
		$('p').css({
			'background-color':'cyan',
			'font-weight':'bold',
			'color':'blue'
		});
	});
	
	$('.name').focus(function(){
		alert('name获取焦点');
	});
	$('.name').blur(function(){
		alert('name失去焦点');
	});
	
	$('.buttons').hover(// 悬停事件
		function(){
			$(this).addClass('hover');
		},
		function(){
			$(this).removeClass('hover');
		}
	);
});