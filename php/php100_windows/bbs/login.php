<?php
include("conn.php");

  if($_GET['out']){
  	setcookie("cookie", "out");
    echo "<script language=\"javascript\">location.href='login.php';</script>"; // ˢ��
  }


  if($_POST['id']=='admin'){
    $pw=md5($_POST['pw']);
    if($pw=='e1bfd762321e409cee4ac0b6e841963c'){ // php ����md5ֵ   ���� php
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
		alert("����д��¼��");
		myform.id.focus();
		return false;
	}
		if (myform.pw.value=="")
	{
		alert("���벻��Ϊ��");
		myform.pw.focus();
		return false;
	}
}
</SCRIPT>

<form action="" method="post" name="myform" onsubmit="return Checklogin();">
  ID��<input type="text" name="id" /><br>
  PW��<input type="password" name="pw" /> <input type="submit" name="submit" value="��½"/>
  </form>
<?
}else{
?>
	<a href='?out=login'>�˳�</a>
<?
}
?>