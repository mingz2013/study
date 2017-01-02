<?
	if($id = $_GET['id'])
	{
		sleep(1);
	}
	$conn = @ mysql_connect("localhost", "root", "") or die("数据库链接错误");
	mysql_select_db("bbs", $conn);
	mysql_query("set names 'GBK'"); //使用GBK中文编码;
		
	$sql = "select * from message where 'user'=$id";
	$query = mysql_query($sql);
		
		
		if(is_array(mysql_fetch_row($query)))
		{
			echo "用户名已存在";
		}
		else
		{
			echo "可以使用";
		}

?>