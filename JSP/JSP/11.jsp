<%@ page language="java" %>
<html>
	<head>
		<title>JSP动作</title>
	</head>
	<body>
		<jsp:useBean id="zc" scope="page" class="textBean"/>
		<jsp:setProperty name="zc" property="*"/>
		<h3>注册成功</h3>
		<hr>
		您的用户名为：<%= zc.getText1() %><br>
		密码为：<%= zc.getText2() %>
	</body>
</html>