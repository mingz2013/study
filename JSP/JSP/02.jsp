<%@ page language="java" %>
<html>
	<head>声明变量和方法</head>
	<body>
		<%--声明一个变量--%>
		<%! String str = "欢迎进入JSP的世界  ";%>
		
		<%--声明一个变量和一个方法--%>
		<%! 
			String str2 = "Tom";
			String sv(){
				return str + str2;
			}
		%>
		
		<%--调用方法--%>
		<%= sv() %>
	</body>
</html>