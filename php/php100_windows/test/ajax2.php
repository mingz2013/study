<?
	if($id = $_GET['id'])
	{
		sleep(1);
	}
	$conn = @ mysql_connect("localhost", "root", "") or die("���ݿ����Ӵ���");
	mysql_select_db("bbs", $conn);
	mysql_query("set names 'GBK'"); //ʹ��GBK���ı���;
		
	$sql = "select * from message where 'user'=$id";
	$query = mysql_query($sql);
		
		
		if(is_array(mysql_fetch_row($query)))
		{
			echo "�û����Ѵ���";
		}
		else
		{
			echo "����ʹ��";
		}

?>