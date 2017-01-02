<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title>test</title>
		<style type="text/css">
		
			body{
				color:#ccc;
				background:blue;
			}
		
		</style>
	</head>
	<body>
		<?
			echo "<font color=yellow>数据库:</font>";
		?>
		<p>
			整数型  tinyint smallint int bigint<br>
			小数型  float double decimal(M,D)<br>
			字符型  char varchar<br>
			日期型  datetime date timestamp<br>
			备注型  tinytext text bigtext<br>
		</p>
		<p>
			create datebase 'datebase name'<br>
			create table 'name'<br>
			<br>
			select 查询字段 from 表名 where 条件 <br>
			insert<br>
			delete<br>
			update<br>
		</p>
		<p style="color:red">
			<?
					// 连接数据库服务器  @符号 用来屏蔽错误   ,   or die  用来提示错误
				$conn = @mysql_connect("localhost", "root", "") or die("服务器连接错误<br>");
					// 连接数据库
				mysql_select_db("db_test", $conn) or die("连接数据库失败<br>");
				
				mysql_query("set names 'GBK'");// 解决中文乱码问题
					
				//$sql = "INSERT INTO `tb_test` (`id` ,`name` ,`age` ,`call` )VALUES (NULL , '王五', '23', '23423542453');";
				//mysql_query($sql, $conn) or die("数据库操作失败<br>");
				
				$sql = "SELECT * FROM `tb_test`";
				
				$query = mysql_query($sql, $conn) or die(mysql_error());
				$row = mysql_fetch_row($query);
				print_r($row);
				echo "<br>",$row[1];
				echo "<br>";
				echo "<hr>";
				while($array = mysql_fetch_array($query))
				{
					echo $array['id'],"-";
					echo $array['name'],"-";
					echo $array['age'],"-";
					echo $array['call'],"<br><hr>";
				}
				echo mysql_num_rows($query),"条";
				
				mysql_close($conn);
				
			?>
		
		</p>
	</body>
</html>
