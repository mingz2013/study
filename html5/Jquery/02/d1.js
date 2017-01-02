//d1.js
$(document).ready( function() {						// ready 等待加载页面完成
	var members = [ "John", "Steve", "Ben", "Damon", "Ian" ];
	$('p:eq(0)').text(members.join(", "));				// 为段落中添加数组中包含的名字
	$('p:eq(1)').html(members.join('<br/>'));			// 纵向显示名字,注意这里要使用html()
	
	var memlist = $("#list");
	$.each( members, function(index, value) {
		memlist.append( $( "<li>" + value + "</li>" ));	// 有序列表中显示名字
	});
	
	var names = $('li').get();
	$('p:eq(2)').text("Following are the " + names.length + " members of my Group");
	
	var m = $.map(members, function(n, i) {
		return (i + 1 + "." + n);						// 将序列号和名字一起显示
	});
	$('p:eq(3)').html(m.join('<br/>'));
	
	var m = $.map(members, function(n, i) {
		return (i + 1 + "." + n.toUpperCase());			// 名字转换为大写
	});
	$('p:eq(4)').html(m.join('<br/>'));
});