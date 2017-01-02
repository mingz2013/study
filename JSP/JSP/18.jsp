<%@ page language="java"%>
<html>
	<head>
		<title>request 内置对向</title>
		<body>
			<h3>你选择的爱好如下：</h3>
			<%
				String ah[] = request.getParameterValues("checkbox1");
				for(int i = 0; i < ah.length; i++){
					out.println(i + ". " + ah[i] + "<br>");
				}
			%>
		</body>
	</head>

</html>