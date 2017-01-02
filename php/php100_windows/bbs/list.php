<?
include("conn.php");
include("head.php");
?>

<table width=500 border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#add3ef">
  <?
	$PageSize  = 5;
	$pageval = 1;
	//$Page = 1;
	//$x = ($Page - 1)*$PageSize;
	$url = $_SERVER["REQUEST_URI"]; // 取当期url
	$url = parse_url($url);
	$url = $url['path'];
	
	$numq = mysql_query("select * from message");
	$num = mysql_num_rows($numq);  // 取得信息条数
	
	if($_GET['page'])
	{
		$pageval = $_GET['page'];
		$page = ($pageval - 1) * $PageSize;
		$page.=", ";
	}
	
	if($num > $PageSize)
	{
		if($pageval <= 1) 
		{
			$pageval = 1;  //<a href=$url?page=".($pageval-1).">上一页</a>
			echo "共 $num 条".
					" <a href=$url?page=".($pageval+1).">下一页</a>";
			echo " 第 $pageval 页";
		}
		else
		{
			if($num <= $PageSize*$pageval)
			{
				echo "共 $num 条".
					"<a href=$url?page=".($pageval-1).">上一页</a> "; //<a href=$url?page=".($pageval+1).">下一页</a>
				echo " 第 $pageval 页";
				
			}
			else
			{
				echo "共 $num 条".
					"<a href=$url?page=".($pageval-1).">上一页</a> <a href=$url?page=".($pageval+1).">下一页</a>"; //
				echo " 第 $pageval 页";
			}
			
		
		}
		
	}
	
	
	//$sql = "select * from message order by id desc"; // 倒叙
	//$sql = "select * from message limit $Page,$PageSize"; 
	$sql = "select * from message limit $page $PageSize";
	$query = mysql_query($sql);
	while($array=mysql_fetch_array($query))
	{
  ?>
  <tr bgcolor="#eff3ff">
  <td>标题：<?=htmtocode($array['title'])?> 用户：<?=htmtocode($array['user'])?></td>
  </tr>
  <tr bgColor="#ffffff">
  <td>内容：<?=htmtocode($array['content'])?></td>
  </tr>
  <?
	}
  ?>
</table>

<hr>
<p>
知识点：<br>
1,		select * from table limit ($Page - 1)*$PageSize, $PageSize    // 从第($Page - 1)*$PageSize 条 取到 第 $PageSize 条<br>
2,		parse_url() 是将 URL 解析成有固定键值名称的数组的函数	<br>	
		<?
			$ua = parse_url("http://username:password@php100.com/path?arg=valu#anchor");
			print_r($ua);
		?>
		<br>
		Array <br>
		(<br>
		[scheme] => http 
		[host] => php100.com 
		[user] => username 
		[pass] => password 
		[path] => /path 
		[query] => arg=valu 
		[fragment] => anchor 
		) <br>

3,		$_SERVER["REQUEST_URI"]函数<br>
		预订义服务器变量的一种，所有$_server开头的都叫做预订义服务器变量<br>
		RESQUEST_URI 的作用是取得当前URI，也就是除域名外后面的完整的地址路径<br>
		<?
			echo $_SERVER["REQUEST_URI"];  // 输出为  /test/bbs/list.php
		?>
</p>