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
	$url = $_SERVER["REQUEST_URI"]; // ȡ����url
	$url = parse_url($url);
	$url = $url['path'];
	
	$numq = mysql_query("select * from message");
	$num = mysql_num_rows($numq);  // ȡ����Ϣ����
	
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
			$pageval = 1;  //<a href=$url?page=".($pageval-1).">��һҳ</a>
			echo "�� $num ��".
					" <a href=$url?page=".($pageval+1).">��һҳ</a>";
			echo " �� $pageval ҳ";
		}
		else
		{
			if($num <= $PageSize*$pageval)
			{
				echo "�� $num ��".
					"<a href=$url?page=".($pageval-1).">��һҳ</a> "; //<a href=$url?page=".($pageval+1).">��һҳ</a>
				echo " �� $pageval ҳ";
				
			}
			else
			{
				echo "�� $num ��".
					"<a href=$url?page=".($pageval-1).">��һҳ</a> <a href=$url?page=".($pageval+1).">��һҳ</a>"; //
				echo " �� $pageval ҳ";
			}
			
		
		}
		
	}
	
	
	//$sql = "select * from message order by id desc"; // ����
	//$sql = "select * from message limit $Page,$PageSize"; 
	$sql = "select * from message limit $page $PageSize";
	$query = mysql_query($sql);
	while($array=mysql_fetch_array($query))
	{
  ?>
  <tr bgcolor="#eff3ff">
  <td>���⣺<?=htmtocode($array['title'])?> �û���<?=htmtocode($array['user'])?></td>
  </tr>
  <tr bgColor="#ffffff">
  <td>���ݣ�<?=htmtocode($array['content'])?></td>
  </tr>
  <?
	}
  ?>
</table>

<hr>
<p>
֪ʶ�㣺<br>
1,		select * from table limit ($Page - 1)*$PageSize, $PageSize    // �ӵ�($Page - 1)*$PageSize �� ȡ�� �� $PageSize ��<br>
2,		parse_url() �ǽ� URL �������й̶���ֵ���Ƶ�����ĺ���	<br>	
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

3,		$_SERVER["REQUEST_URI"]����<br>
		Ԥ���������������һ�֣�����$_server��ͷ�Ķ�����Ԥ�������������<br>
		RESQUEST_URI ��������ȡ�õ�ǰURI��Ҳ���ǳ����������������ĵ�ַ·��<br>
		<?
			echo $_SERVER["REQUEST_URI"];  // ���Ϊ  /test/bbs/list.php
		?>
</p>