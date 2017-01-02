<?php
include("conn.php");

  if($_GET['out']){
  	setcookie("cookie", "out");
    echo "<script language=\"javascript\">location.href='login.php';</script>"; // 刷新
  }


  if($_POST['id']=='admin'){
    $pw=md5($_POST['pw']);
    if($pw=='e1bfd762321e409cee4ac0b6e841963c'){ // php 密码md5值   密码 php
     setcookie("cookie", "ok");
       echo "<script language=\"javascript\">location.href='login.php';</script>";
    }
  }
include("head.php");
  if($_COOKIE['cookie']!='ok'){
?>

<SCRIPT language=javascript>
function Checklogin()
{
	if (myform.id.value=="")
	{
		alert("请填写登录名");
		myform.id.focus();
		return false;
	}
		if (myform.pw.value=="")
	{
		alert("密码不能为空");
		myform.pw.focus();
		return false;
	}
}
</SCRIPT>

<form action="" method="post" name="myform" onsubmit="return Checklogin();">
  ID：<input type="text" name="id" /><br>
  PW：<input type="password" name="pw" /> <input type="submit" name="submit" value="登陆"/>
  </form>
<?
}else{
?>
	<a href='?out=login'>退出</a>
<?
}
?>