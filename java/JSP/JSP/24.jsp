<%@ page contentType="text/html;charset=gb2312" %>
<html>
	<head><title>response 内置对象</title></head>
	<body>
		<h3>你好，欢迎你对本网站的关注</h3>
		<h3>本网站已经进行改建，10秒钟以后自动进入新网站界面</h3>
		<h3>请耐心等待</h3>
		<%
			response.setHeader("refresh", "10;URL=25.jsp");
		%>
	</body>
</html>