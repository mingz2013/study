<%@ page language="java" contentType="text/html;charset=GB2312" %>
<%@ page import="pa.TestBean"%>   
<html>
	<head><title>在JSP程序中使用</title></head>
	<body>
		<jsp:useBean id="test" class="pa.TestBean" scope="page"/>
		<%
			test.setText1("这是第一个字符串");
			test.setText2("这是第二个字符串");
		%>
		JavaBean中的第一个属性值为：<%=test.getText1() %><br>
		JavaBean中的第二个属性值为：<%=test.getText2() %><br>
	</body>
</html>                                              