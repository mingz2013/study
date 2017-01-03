<%@ page language="java" %>
<html>
	<head>声明变量和方法</head>
	<body>
		<%--声明一个变量--%>
		<%! String string = "在这里声明变量";%>
		
		<%--声明一个方法--%>
		<%! 
			String sv(){
				return string;
			}
		%>
		
		<%--调用方法--%>
		<%= sv()%>
	</body>
</html>