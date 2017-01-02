<html>
	<head>
		<title>PHP交互界面演示</title>
	</head>
	<body>
		<form method="post">
			请输入边长：
			<input type="text" name="Rad">
			<input type="submit" name="button" value="提交">
		</form>
	</body>
</html>
<?php
	if(isset($_POST["button"]))
	{
		$Rad = $_POST["Rad"];
		$Area = $Rad * $Rad;
		echo "正方形的面积为：".$Area;
	}
?>
