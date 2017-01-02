<?
	session_start();
	
	if($_POST['check'])
	{
		if($_SESSION['check_pic'] == $_POST['check'])
		{
			echo "验证码正确".$_SESSION['check_pic'];
		}
		else
		{
			echo "验证码错误".$_SESSION['check_pic'];
		}
	}
?>

<form action="" method="post">
	<img src='GD_SESSION_yanzhengma.php'><br>
	<input type="text" name="check"><br>
	<input type="submit" value="提交"><br>
</form>