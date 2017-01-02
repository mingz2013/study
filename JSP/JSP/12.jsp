<html>
	<head><title>out 内置对象</title></head>
	<body>
		<table>
			<%! int i; %>
			<%
				i  = 0;
				while(i < 6){
					i++;
					if(i % 2 == 0){
						out.println("<tr bgcolor=red>");
					}else{
						out.println("<tr bgcolor=green>");
					}
			%>
			<td>当前行数为：<%= i %></td>
			<td>这是第<%= i %>条信息</td>
			</tr>
			<%
				}
			%>
		
		</table>
	
	</body>
</html>