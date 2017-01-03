<html>
	<head><title>forward动作</title></head>
	<body>
		<%
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			if(name.equals("mingzz") && password.equals("123")){
		%>
		<%--如果相同，则执行如下跳转--%>
		<jsp:forward page="06.html"/>
		<%
			}else{
		%>
		<%--如果不相同，则执行如下跳转--%>
		<jsp:forward page="07.html"/>
		<%
			}
		%>
	</body>
</html>