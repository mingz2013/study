<?php
 include("conn.php");

 if($_POST['submit'])
 {
  $sql="insert into message (id,user,title,content,lastdate) " .
  		"values ('','$_POST[user]','$_POST[title]','$_POST[content]',now())";
  mysql_query($sql);
  echo "<script language=\"javascript\">alert('��ӳɹ�');history.go(-1)</script>";

 }
 include("head.php");
?>
<SCRIPT language=javascript>
function CheckPost()
{
	if (myform.user.value=="")
	{
		alert("����д�û���");
		myform.user.focus();
		return false;
	}
	if (myform.title.value.length<5)
	{
		alert("���ⲻ������5���ַ�");
		myform.title.focus();
		return false;
	}
	if (myform.content.value=="")
	{
		alert("����Ҫ��д��������");
		myform.content.focus();
		return false;
	}
}
</SCRIPT>

  <form action="add.php" method="post" name="myform" onsubmit="return CheckPost();">
  �û���<input type="text" size="10" name="user" /><br>
  ���⣺<input type="text" name="title" /><br/>
  ���ݣ�<textarea name="content"  cols="60" rows="9"></textarea><br/>

  <input type="submit" name="submit" value="��������"/>


  </form>