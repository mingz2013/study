//d1.js
$(document).ready( function() {						// ready 等待加载页面完成
	$('#zhengwen').offset({'top':$('#cebian').offset().top, 'left':$('#cebian').offset().left + $('#cebian').width()});
	$('#zhengwen').width($('#daohang').width() - $('#cebian').width());
	//alert('载入');
	$('.class1').click(function(e) {
		
		var href = $(this).attr('href');
		var data ='href=' + href;
		//alert(href);
		$.ajax({
			type:"POST",
			url:"/phptest/index.php/Index/show/",
			data:data,
			success:function(text) {
				//alert(text);
				var json = eval('(' + text + ')');
				//alert(json); 
				//alert(json.haha[3].abc);
				$('#cebian ul li').each(function(index, element) {
                    
					//alert(index);
					//$(this).append($("<ul><li>aa</li><li>aa</li></ul>"));
					//$(this).children('ul').append($("<li>aa</li><li>aa</li>"));
					$(this).children('ul').empty();
                });
				//$(this).parent().children('ul').append($("<li>aa</li><li>aa</li>"));
				//$(this).append($("<li>aa</li><li>aa</li>"));
				//{"retcode":"0", "list":["网络工程", "信息安全辅修专业", "培养计划"]}
				if(json.retcode == '1'){alert("Error");return;}
				var list = json.list;
				//$('#cebian ul li a[href$="'+href+'"]').parent().children('ul').append($("<li>aa</li><li>aa</li>"));
				var memlist = $('#cebian ul li a[href$="'+href+'"]').parent().children('ul');
				$.each( list, function(index, value) {
					memlist.append( $( '<li><a class="class2" href="'+value.link+'">' + value.name + '</a></li>' ));
				});
			}		
		});
	});
	
	$('.class2').live("click",function(e) {// 动态生成的元素 绑定事件 要用 live
		//alert('aaaaa');
		var href = $(this).attr('href');
		var data ='href=' + href;
		//alert(href+'aaaa');
		$.ajax({
			type:"POST",
			url:"/phptest/index.php/Index/show1/",
			data:data,
			success:function(text) {
				//alert(text);
				var json = eval('(' + text + ')');
				//alert(json); 
				//alert(json.haha[3].abc);
				if(json.retcode == '1'){alert("Error");return;}
				var class2 = json.class2;
				$('#zhengwen').empty();
				$('#zhengwen').append($('<span>'+class2.class+'</span><br/>'));
				var titlelist = class2.titlelist;
				$('#zhengwen').append($('<table></table>'));
				$('table').append($('<tr><td>序号</td><td>标题</td><td>修改时间</td><td>访问次数</td></tr>'));
				$.each( titlelist, function(index, value) {
					$('table').append( $( '<tr><td>'+index+'</td><td><a class="class3" href="#'+value.id+'">'+value.title+'</a></td><td>'+value.lasttime+'</td><td>'+value.welcomenumber+'</td></tr>' ));
				});
				//$('#zhengwen').append($('</table>'));
			}		
		});
	});
	$('.class3').live("click",function(e) {// 动态生成的元素 绑定事件 要用 live
		//alert('aaaaa');
		var href = $(this).attr('href');
		var data ='href=' + href.substr(1);
		//alert(href+'aaaa');
		$.ajax({
			type:"POST",
			url:"/phptest/index.php/Index/show2/",
			data:data,
			success:function(text) {
				//alert(text);
				var json = eval('(' + text + ')');
				//alert(json); 
				//alert(json.haha[3].abc);
				if(json.retcode == '1'){alert("Error");return;}
				
				//alert(json.class2.title);
				
				$('#zhengwen').empty();
				$('#zhengwen').append($('<span>'+json.class2.title+'</span><br/><p>'+json.class2.content+'</p>'));
				
				
			}		
		});
	});
});