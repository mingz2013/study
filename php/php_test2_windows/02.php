 <?
 $confirm = "Are u OK with this?";
 $ok_msg = "I'm OK!";
 $not_ok_msg = "I'm not OK!";
 
 echo "<script language = \"javascript\">";
 echo "function func()";
 echo "{";
 echo "if(confirm(\"$confirm\"))";
 echo "{";
 echo "document.write(\"$ok_msg\");";
 echo "}";
 echo "else";
 echo "{";
 echo "document.write(\"$not_ok_msg\");";
 echo "}";
 echo "}";
 echo "</script>";
 ?>
 <html>
	<head>
	</head>
	<body>
		<a href="#" onClick="javascript:func();">Please Click</a>
	</body>
</html>