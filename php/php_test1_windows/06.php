<html>
	<head>
		<title>注册页面</title>
		<style type="text/css">
		<!--
			.STYLE1
			{
				font-size:14px;
				color:red;
			}
		-->
		</style>
	</head>
	<body>
		<form name=fr1 method=post action="06_2.php">
			<div align=center><font size=5 color=blue>新用户注册</font></div>
			<table border=1 align=center>
				<tr><td>用户名：</td><td><input type=text name=ID></td><td class="STYLE1">* 不超过10个字符（数字， 字母， 和下划线）</td></tr>
				<tr><td>密码：</td><td><input type=password name=PWD size=21></td><td class=STYLE1>* 4~14个数字</td></tr>
				<tr><td>手机号码：</td><td><input type=text name=PHONE></td><td class=STYLE1>* 11位数字，第一位为1</td></tr>
				<tr><td>邮箱：</td><td><input type=text name=EMAIL></td><td class=STYLE1>* 有效的邮件地址</td></tr>
				<tr><td colspan=3 align=center>
						<input type=submit name=GO value="注册">&nbsp;&nbsp;&nbsp;<input type=reset name=NO value="取消">
				</td></tr>
			</table>
		</form>

	</body>
</html>
