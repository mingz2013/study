<form action="" method="post">
	以下属于Web开发语言的有哪几种？<br>
	<input type="checkbox" name="answer[]" value="C语言">C语言<br>
	<input type="checkbox" name="answer[]" value="PHP">PHP<br>
	<input type="checkbox" name="answer[]" value="FLASH">FLASH<br>
	<input type="checkbox" name="answer[]" value="ASP">ASP<br>
	<input type="checkbox" name="answer[]" value="JSP">JSP<br>
	<input type="submit" name=bt_answer value="提交"/>
</form>
<?php
	if(isset($_POST['bt_answer']))
	{
		echo '这个有错误，还没由解决,传递数组有错<br>';
		$answer = $_POST['answer'];									// $answer是数组
		print_r($answer);
		echo '<br>';
		if(!$answer)
		{
			echo "<script>alert('请选择答案')</script>";
			return;
		}
		$num = count($answer);											// 使用count函数取得$answer数组中值的个数
		echo '$num='.$num.'<br>';
		$anw = "";														// 初始化$anw为空
		echo '$anw:='.$anw.'<br>';
		for($i = 0; $i < $num; $i++)										// 使用for循环
		{
			echo $i.':'.$answer[$i].'<br>'; 
			$anw = $anw.$answer[$i];									// 将$answer中的值连接起来
		}
		echo '$anw='.$anw.'<br>';
		if($anw == "PHPASPJSP")											// 判断是否是正确答案
		{
			echo "<script>alert('回答正确！')</script>";
		}
		else
		{
			echo "<script>alert('回答错误！')</script>";
		}
	}
?>
