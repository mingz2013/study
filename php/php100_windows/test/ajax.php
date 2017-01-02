
<font color=red size=20>ajax</font><br>
<hr>
Ajax 由HTML，javascript TM技术，DHTML和DOM组成，<br>
这一杰出的方法可以将笨拙的web界面转化成交互性的Ajax应用程序<br>
HTML页面 <-------触发脚本--------> JS脚本 <-----反应---------执行-----> PHP文件	<br>
<hr>
2.创建XMLHttpRequest对象<br>
核心的一个对象<br>
<br>
js代码：<br>
xmlHttp = new XMLHttpRequest(); //	这对于规范的js支持的浏览器来讲是没错的，恰恰相反IE却就不支持，<br>									
xmlHttp = new ActiveXObject('Microsoft.XMLHTTP');	//	所以没办法，我们只能做个判断再创建一个IE支持的<br>
<hr>
3.XMLHttpRequest对象相关方法<br>
打开请求：XMLHttpRequest.open(传递方式,地址,是否异步请求);	<br>
准备就绪执行：XMLHttpRequest.onreadystatechange				<br>
获取执行结果：XMLHttpRequest.responseText					<br>
<hr>
实例：<br>
<hr>
<script type="text/javascript" src="ajax.js"></script>


<a href="#" onclick="funphp100('o')">o</a>
<a href="#" onclick="funphp100('t')">t</a>
<a href="#" onclick="funphp100('x')">x</a>

<div id="php100"></div>
<hr><hr>
<font color=red size=20>Ajax+PHP打造等待进度条效果（二）</font><br>
<hr>
1.上面常见问题<br>
(1)js缓存问题<br>
<hr>
2.方法XHP.readyState五种状态 == 状态（0,1,2,3,4）<br>
	0：请求未初始化，还没有调用open（）；<br>
	1:请求已经建立，但是还没有发送，还没有调用send（）<br>
	2:请求已发送，正在处理中（通常现在可以从响应中获取内容头）<br>
	3:请求在处理中，通常相应中已有部分数据可用了，没有全部完成）<br>
	4：响应已完成，您可以获取并使用服务器的响应了<br>
<hr>
3方法XHR.status常见的几种状态<br>
	XHR.status == 200,300,404等<br>
	200：成功<br>
	404:没有发现文件，查询或URI<br>
	500:服务器产生内部错误<br>
<hr>
4等待函数 Sleep(秒)
<hr><hr>
<font color=red size=20>Ajax检查用户名或邮件（三）</font><br>
<hr>
1.Ajax技术实现用户名检查原理<br>
2.学习HTML的几种触发<br>
3.如何获取表单中的数据内容<br>
<hr>
填入用户名 -> 触发控件 -> 获得填写内容 -> ajax传递 -> 查询数据库 -> 返回结果 -> DOM反应到页面 	<br>

document.myform.myinput.value  // 获取表单内容<br>
<hr>
<form action="" name="myform" method="post">
	用户名：<input type="text" name="user" onblur="funphp101()"/>
</form>
<div id="php101"></div>