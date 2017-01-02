<?
	$conn = @ mysql_connect("localhost", "root", "") or die("数据库链接错误");
	mysql_select_db("bbs", $conn);
	mysql_query("set names 'GBK'"); //使用GBK中文编码;
	
	
	function htmtocode($content) {
	$content = str_replace("\n", "<br>", str_replace(" ", "&nbsp;", $content)); // 文本替换函数str_replace(被替换的值，用作替换的值，被替换的内容);
	return $content;
}

?>