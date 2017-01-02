<%@ page language="java"%>
<html>
	<head>
		<title>request ÄÚÖÃ¶ÔÏò</title>
		<body>
			<%
				String cdx = request.getParameter("cdx");
				if(cdx.equals("j")){
					response.sendRedirect("21.jsp");
				}else if(cdx.equals("t")){
					response.sendRedirect("22.jsp");
				}
			%>
		</body>
	</head>

</html>