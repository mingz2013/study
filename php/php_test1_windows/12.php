<html>
	<head><title>学生个人信息</title></head>
	<body>
		<form method=get action="12_2.php">
			<table width=400 border=0 align=center bgcolor='#CCFFCC'>
				<tr><td colspan=2><div align=center>学生个人信息</div></td></tr>
				<tr>
					<td width=120>学号：</td>
					<td><input name="XH" type=text value=""></td>
				</tr>
				<tr>
					<td>姓名：</td>
					<td><input name="XM" type=text value=""></td>
				</tr>
				<tr>
					<td>性别：</td>
					<td>
						<input name="SEX" type=radio value="男" checked=checked>男
						<input name=SEX type=radio value="女">女
					</td>
				</tr>
				<tr>
					<td>出生日期：</td>
					<td><input name=Birthday type=text value=""></td>
				</tr>
				<tr>
					<td>所学专业：</td>
					<td>
						<select name=ZY>
							<option>计算机</option>
							<option>软件工程</option>
							<option>信息管理</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>备注：</td>
					<td><textarea name=BZ></textarea></td>
				</tr>
				<tr>
					<td>兴趣：</td>
					<td>
						<input name=XQ[] type=checkbox value=听音乐>听音乐
						<input name=XQ[] type=checkbox value=看小说>看小说
						<input name=XQ[] type=checkbox value=上网>上网
					</td>
				</tr>
				<tr>
					<td colspan=2 align=center>
						<input type=submit name=BUTTON1 value=提交>
						<input type=reset name=BUTTON2 value=重置>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
