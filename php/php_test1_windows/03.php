<?
	echo "<form method=post>";
	for($i = 1; $i < 6; $i++)
	{
		echo "学生".$i."的成绩：<input type=text name='stu[]'><br>";
	}
	echo "<input type=submit name=bt value='提交'>";
	echo "</form>";

	if(isset($_POST['bt']))
	{
		$sum = 0;
		$k = 0;
		$stu = $_POST['stu'];
		print_r($stu);
		$num = count($stu);
		echo "您输入的成绩有:<br>";
		foreach($stu as $score)
		{
			echo $score."<br>";
			$sum = $sum +$score;
			if($score < 60)
			{
				$sco[$k] = $score;
				$k++;
			}
		}
		echo "<br>低于60分的成绩有：<br>";
		for($k = 0; $k < count($sco); $k++)
		{
			echo $sco[$k]."<br>";
		}
		$average = $sum/$num;
		echo "<br>平均分为：$average";
		
	}
	
?>
