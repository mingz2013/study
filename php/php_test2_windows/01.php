<?
	// 使用多行输出的方法输出javascript代码
	echo <<<JS
	<script language = "javascript">
		function func()
		{
			if(confirm("Are u OK with this?"))
			{
				document.write("I'm OK!");
			}else{
				document.write("I'm not OK!");
			}
		}
	</script>
JS;
?>
<html>
	<head>
	</head>
	<body>
		<a href="#" onClick="javascript:func();">Please Click</a>
	</body>
</html>