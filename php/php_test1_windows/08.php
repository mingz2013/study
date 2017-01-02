<form enctype="multipart/form-data" action="" method=post>
	<table border=0>
		<tr><td bgcolor="#CCCCCC"><font size=4 color=blue>当前最流行的web开发语言：</font></td></tr>
		<tr><td><input type=radio name=vote value=PHP>PHP</td></tr>
		<tr><td><input type=radio name=vote value=ASP>ASP</td></tr>
		<tr><td><input type=radio name=vote value=JSP>JSP</td></tr>
		<tr><td><input type=submit name=sub value="请投票"></td></tr>
	</table>
</form>
<?
	$votefile = "./08.txt";												// 用于计数的文本文件
	if(!file_exists($votefile))											// 判断文件是否存在
	{
		echo "votefile=".$votefile;
		$handle = fopen($votefile, "w+");								// 不存在则创建文件
		echo "handle=".$handle;
		fwrite($handle, "0|0|0");										// 初始化文件
		fclose($handle);
	}
	if(isset($_POST['sub']))											// 判断用户是否投票
	{
		if(isset($_POST['vote']))										// 接收投票值
		{
			$vote = $_POST['vote'];
			$handle = fopen($votefile, "r+");
			echo "handle=".$handle;
			$votestr = fread($handle, filesize($votefile));				// 读取文件内容到字符串
			echo "votestr=".$votestr;
			fclose($handle);
			$votearray = explode("|", $votestr);						// 将$votestr根据“|”分割
			print_r($votearray);
			echo "<h3>投票完毕</h3>";
			if($vote == 'PHP')
			{
				$votearray[0]++;
			}
			echo "目前PHP的票数为：<font size=5 color=red>".$votearray[0]."</font><br>";
			if($vote == 'ASP')
			{
				$votearray[1]++;
			}
			echo "目前ASP的票数为：<font size=5 color=red>".$votearray[1]."</font><br>";
			if($vote == 'JSP')
			{
				$votearray[2]++;
			}
			echo "目前JSP的票数为：<font size=5 color=red>".$votearray[2]."</font><br>";
			// 计算总票数
			$sum = $votearray[0] + $votearray[1] + $votearray[2];
			echo "总票数为：<font size=5 color=red>".$sum."</font><br>";
			$votestr2 = implode("|", $votearray);						// 将投票后的新数组用"|"连接成字符串$votestr2
			$handle = fopen($votefile, "w+");
			fwrite($handle, $votestr2);
			fclose($handle);
		}
		else
		{
			echo "<script>alert('未选则投票选项')</script>";
		}
	}
?>
