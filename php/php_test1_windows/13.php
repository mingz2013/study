<html>
	<body>
		<form action="13.php" method=post>
			<table border=0 align=center>
				<tr><td colspan=2 align=center>用户登录</td></tr>
				<tr><td align=center>用户名</td><td><input name="username" type=text></td></tr>
				<tr><td align=center>密码</td><td><input name=password type=password></td></tr>
				<tr>
					<td colspan=2 align=center>
						<input type=submit name=Submit value=登录>
						<input type=reset name=Submit2 value=重置>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
<?
	session_start();
	if(isset($_POST['Submit']))
	{
		$username = $_POST['username'];
		$password = $_POST['password'];
		if($username == "administrator" && $password == "123456")
		{
			$_SESSION['username'] = $username;
			$_SESSION['password'] = $password;
			header("location:13_2.php");
		}
		else
		{
			echo "<script>alert('登录失败');location.href='13.php';</script>";
		}
	}
?>
