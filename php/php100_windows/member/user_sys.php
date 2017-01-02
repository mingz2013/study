<?
	include("config.php");
	
	//echo $_SESSION['uid'],"<br>";
	//echo $_SESSION['user_shell']."<br>";
	//echo $_SESSION['times'],"<br>";
	//echo mktime();
	$arr = user_shell($_SESSION['uid'],$_SESSION['user_shell'],1);
	
	
	user_mktime($_SESSION['times']);
	echo $arr['username']."<br>";
	echo $arr['username']."<br>";
?>
1级权限内容：