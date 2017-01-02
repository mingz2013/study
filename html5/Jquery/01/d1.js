//d1.js
$(document).ready( function() {						// ready 等待加载页面完成
	//$('p').addClass('highlight'); 				// 所有的段落添加样式highlight
	//$('div').addClass('highlight'); 				// 所有的层
	//$('body').addClass('highlight'); 				// body
	
	//$('span:contains(Life)').addClass('highlight'); // 包含文本Life的所有span元素
	
	//$('div:odd').addClass('highlight');				// 奇数个 从0开始编号
	//$('div:even').addClass('boundary');				// 偶数个
	//$('p:eq(1)').addClass('linkstyle');				// 指定序号的段，第二个段落 0为第一个段落
	/*
	var $nodes=$('#root').children();				// id为root的元素  root 的第一层子对象
	alert('Number of nodes is' + $nodes.length);
	var txt="";
	$('#root').children().each( function() {		// 遍历第一层子对象
		txt+=$(this).text();						// 取文本
	});
	alert(txt);
	*/
	
	//alert($('span').parent().text());				// 取直接亲文本
	//alert($('#root').html());						// 取html代码
	
	$('h2').text('用JQuary重新设置的文本');			// 改变元素中的文本
	$('#root').html('<b>设置的加粗的html文本</b>');	// 设置html
	
	$('h2').prepend('<h3>新添加的标题h3prepend</h3>');		// 在h2之前添加
	$('<h3>新添加的标题h3prependto</h3>').prependTo('h2');	// 在h2之前添加
	$('#root').clone().prependTo('h2');				// 复制root元素 显示在h2之前
	
	$('.f').addClass('highlight');					// 为f类添加样式


	
});