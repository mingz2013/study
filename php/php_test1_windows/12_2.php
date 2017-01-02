<?
	$XH = $_GET['XH'];
	$XM = $_REQUEST['XM'];
	$XB = $_GET['SEX'];
	$CSSJ = $_GET['Birthday'];
	$ZY = $_GET['ZY'];
	$BZ = $_GET['BZ'];
	$XQ = @$_GET['XQ'];
	$checkbirthday = preg_match('/^\d{4}-(0?\d|1?[012])-(0?\d|[12]\d|3[01])$/', $CSSJ);
	if($XH == NULL) echo "学号不能为空";
	elseif(preg_match('/\d{6}/', $XH) == 0) echo "学号格式错误";
	elseif($XM == NULL) echo "姓名不能为空";
	elseif($CSSJ && $checkbirthday == 0) echo "日期格式错误";
	else
	{
		echo "学号：".$XH."<br>";
		echo "姓名：".$XM."<br>";
		echo "性别：".$XB."<br>";
		echo "出生日期：".$CSSJ."<br>";
		echo "专业：".$ZY."<br>";
		echo "备注：".$BZ."<br>";
		if($XQ)
		{
			echo "兴趣爱好：";
			foreach($XQ as $value) echo $value." ";
			echo "<br>";
		}
	}
?>
