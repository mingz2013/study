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
			echo "<font color=yellow>���ݿ�:</font>";
		?>
		<p>
			������  tinyint smallint int bigint<br>
			С����  float double decimal(M,D)<br>
			�ַ���  char varchar<br>
			������  datetime date timestamp<br>
			��ע��  tinytext text bigtext<br>
		</p>
		<p>
			create datebase 'datebase name'<br>
			create table 'name'<br>
			<br>
			select ��ѯ�ֶ� from ���� where ���� <br>
			insert<br>
			delete<br>
			update<br>
		</p>
		<p style="color:red">
			<?
					// �������ݿ������  @���� �������δ���   ,   or die  ������ʾ����
				$conn = @mysql_connect("localhost", "root", "") or die("���������Ӵ���<br>");
					// �������ݿ�
				mysql_select_db("db_test", $conn) or die("�������ݿ�ʧ��<br>");
				
				mysql_query("set names 'GBK'");// ���������������
					
				//$sql = "INSERT INTO `tb_test` (`id` ,`name` ,`age` ,`call` )VALUES (NULL , '����', '23', '23423542453');";
				//mysql_query($sql, $conn) or die("���ݿ����ʧ��<br>");
				
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
				echo mysql_num_rows($query),"��";
				
				mysql_close($conn);
				
			?>
		
		</p>
	</body>
</html>
