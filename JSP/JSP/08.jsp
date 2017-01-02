<%@ page language="java" %>
<html>
	<head>
		<title>JSP¶¯×÷</title>
	</head>
	<body>
		<%= "*************************" %>
		<hr/>
		<jsp:forward page="09.jsp">
			<jsp:param name="c1" value="aabbcc"/>
			<jsp:param name="c2" value="ddeeff"/>
		</jsp:forward>
		<hr/>
		<%= "#############################"%>
	</body>
</html>