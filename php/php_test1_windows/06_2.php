<?
	include "06.php";
	$id = $_POST['ID'];
	$pwd = $_POST['PWD'];
	$phone = $_POST['PHONE'];
	$Email = $_POST['EMAIL'];
	$checkid = preg_match('/^\w{1,10}$/', $id);							// 检查字符串是否在10个字符以内
	$checkpwd = preg_match('/^\d{4,14}$/', $pwd);						// 检查是否在4-14个数字之间
	$checkphone = preg_match('/^1\d{10}$/', $phone);					// 检查是否是以1开头的11位数字
	// 检查Email地址的合法性
	$checkEmail = preg_match('/^[a-zA-Z0-9_\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+$/',$Email);
	if($checkid && $checkpwd && $checkphone && $checkEmail)				// 如果都为1则注册成功
	{
		echo "注册成功";
	}
	else
	{
		echo "注册失败,格式不对";
	}
?>
