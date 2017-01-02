<html>
	<head>
		<title>计算器程序</title>
	</head>
	<body>
		<form method=post>
			<table>
				<tr>
					<td>
						<input type=text size=4 name=number1>
						<select name=caculate>
							<option value="+">+</option>
							<option value="-">-</option>
							<option value="*">*</option>
							<option value="/">/</option>
						</select>
						<input type=text size=4 name=number2>
						<input type=submit name=ok value="计算">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
<?
	function cac($a, $b, $caculate)
	{
		if($caculate == "+")	return $a + $b;
		if($caculate == "-")	return $a - $b;
		if($caculate == "*")	return $a * $b;
		if($caculate == "/")
		{
			if($b == "0")	echo "除数不能为零";
			else return $a / $b;
		}
	}
	if(isset($_POST['ok']))
	{
		$number1 = $_POST['number1'];
		$number2 = $_POST['number2'];
		$caculate = $_POST['caculate'];

		if(is_numeric($number1) && is_numeric($number2))
		{
			$answer = cac($number1, $number2, $caculate);
			echo "<script>alert('".$number1.$caculate.$number2."=".$answer."')</script>";
		}
		else
		{
			echo "<script>alert('输入的不是数字')</script>";
		}
		
	}
?>
