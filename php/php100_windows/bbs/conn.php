<?
	$conn = @ mysql_connect("localhost", "root", "") or die("���ݿ����Ӵ���");
	mysql_select_db("bbs", $conn);
	mysql_query("set names 'GBK'"); //ʹ��GBK���ı���;
	
	
	function htmtocode($content) {
	$content = str_replace("\n", "<br>", str_replace(" ", "&nbsp;", $content)); // �ı��滻����str_replace(���滻��ֵ�������滻��ֵ�����滻������);
	return $content;
}

?>