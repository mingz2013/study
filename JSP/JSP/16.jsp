<%@ page language="java"%>
<html>
	<head>
		<title>request 内置对向</title>
		<body>
			<%
				String radio = request.getParameter("radio1");
				out.println("选择的内容:" + radio);
			%>
		</body>
	</head>

</html>