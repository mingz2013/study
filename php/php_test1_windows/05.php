<form name=f1 method=post action="">
	<font face="方正舒体" size=4>您的Email地址:</font><br>
	<input type="text" name="Email" size=31><br>
	<font face="方正舒体" size=4>您的留言：</font><br>
	<textarea name=note rows=10 cols=30></textarea><br>
	<input type=submit name=bt1 value="提交">
	<input type="reset" name=bt2 value="清空">
</form>
<?
	if(isset($_POST['bt1']))
	{
		$Email = $_POST['Email'];
		$note = $_POST['note'];
		if(!$Email || !$note)
		{
			echo "<script>alert('Email地址和留言请填写完整')</script>";
		}
		else
		{
			$array = explode("@", $Email);								// 分割Email地址
			if(count($array) != 2)
			{
				echo "<script>alert('Email地址格式错误')</script>";
			}
			else
			{
				$username = $array[0];
				$netname = $array[1];
				if(strstr($username, ".") or strstr($username, ","))
				{
					echo "<script>alert('Email地址格式错误')</script>";
				}
				else
				{
					$str1 = htmlspecialchars("<");
					$str2 = htmlspecialchars(">");

					$newnote = str_replace("我", "本人", $note);
					echo "<font face='黑体' size=4>";
					echo "用户".$str1.$username.$str2."您好！&nbsp;";
					echo "您是".$netname."网友<br>";
					echo "<br>您的留言是：<br>&nbsp;&nbsp;&nbsp;".$newnote."<br>";
					echo "</font>";
					
				}
			}
		}
	}


?>
