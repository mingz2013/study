<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.util.*" %>
<html>
	<head><title>response 内置对象</title></head>
	<body>
		<%
			response.setHeader("refresh", "1");
			Date myDate = new Date();
		%>
		<h3>当前时间为：</h3>
		<%
			out.println(myDate.toLocaleString());
		%>
	</body>
</html>