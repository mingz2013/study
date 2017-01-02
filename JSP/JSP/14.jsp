<%@ page language="java"%>
<html>
	<head><title>reauest内置对象</title></head>
	<body>
		返回请求中使用的模式（协议）名字：<%=request.getScheme()%><br>
		返回接收请求的服务器主机：<%=request.getServerName()%><br>
		返回服务器的端口号：<%=request.getServerPort()%><br>
		返回请求信息中调用Servlet的URL部分：<%=request.getServletPath()%><br>
		返回URL之后的查询字符串：<%=request.getQueryString()%><br>
	</body>
</html>