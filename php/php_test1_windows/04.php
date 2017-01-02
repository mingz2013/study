<form name=fr1 method=post>
	<table align=center border=1>
		<tr><td><div align=center>学号</div></td><td><div align=center>姓名</div></td><td><div align=center>成绩</div></td></tr>
		<?
			for($i = 0; $i < 5; $i++)
			{
		?>
		<tr><td><input type=text name="XH[]"></td><td><input type=text name="XM[]"></td><td><input type=text name="CJ[]"></td></tr>
		<?
			}
		?>
		<tr><td align="center" colspan="3"><input type=submit name=bt_stu value="提交"></td></tr>
	</table>
</form>
<center><font size=3 color="red">注意，学号值不能重复</font></center><br>
<!-- 以上是输入表单 -->

<?
	if(isset($_POST['bt_stu']))
	{
		$XH=$_POST['XH'];
		$XM=$_POST['XM'];
		$CJ=$_POST['CJ'];
		array_multisort($CJ, $XH, $XM);									// 对以上三个数组进行排序，$CJ是首要数组
		for($i = 0; $i < count($XH); $i++)
		{
			$sum[$i] = array($XH[$i], $XM[$i], $CJ[$i]);				// 将三个数组组成一个二位数组$sum
		}
		
		echo "<div align=center>排序后成绩表如下：</div>";

		// 表格的首部
		echo "<table align=center border=2><tr><td>学号</td><td>姓名</td><td>成绩</td></tr>";
		foreach($sum as $value)
		{
			list($stu_number, $stu_name, $stu_score) = $value;			// 使用list()函数将数组中的值付给变量
			echo "<tr><td>$stu_number</td><td>$stu_name</td><td>$stu_score</td></tr>";
		}
		echo "</table><br>";
		
		reset($sum);													// 重置$sum数组的指针
		while(list($key, $value) = each($sum))
		{
			list($stu_number, $stu_name, $stu_score) = $value;
			if($stu_number == "081101")									// 查找是否有学号为081101的值
			{
				echo "<center><font size=4 color=red>";
				echo $stu_number."的姓名为：".$stu_name.",";
				echo "成绩为：".$stu_score;
				echo "</font></center>";
				break;
			}
		}
	}
?>
