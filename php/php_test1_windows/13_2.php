<?
	session_start();
	$username = @$_SESSION['username'];
	$password = @$_SESSION['password'];
	if($username) echo "欢迎使用管理员登录，您的密码为$password";
	else echo "对不起，您没有权限登录本页";
?>
