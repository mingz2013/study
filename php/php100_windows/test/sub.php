<?
	session_start();
	
	if($_POST['check'])
	{
		if($_SESSION['check_pic'] == $_POST['check'])
		{
			echo "��֤����ȷ".$_SESSION['check_pic'];
		}
		else
		{
			echo "��֤�����".$_SESSION['check_pic'];
		}
	}
?>

<form action="" method="post">
	<img src='GD_SESSION_yanzhengma.php'><br>
	<input type="text" name="check"><br>
	<input type="submit" value="�ύ"><br>
</form>