<p style="color:blue">�ϴ�</p><hr>
<form action="" enctype="multipart/form-data" method="post" name="upform">
  �ϴ��ļ�:
  <input name="upfile" type="file">
  <input type="submit" value="�ϴ�"><br>
 </form>
<?
if (is_uploaded_file($_FILES['upfile']['tmp_name'])){

$upfile=$_FILES["upfile"];

$name = $upfile["name"];
$type = $upfile["type"];
$size = $upfile["size"];
$tmp_name = $upfile["tmp_name"];
$error = $upfile["error"];


switch ($type) {          // �����ļ�����
	case 'image/pjpeg' : $ok=1;
		break;
	case 'image/jpeg' : $ok=1;
		break;
	case 'image/gif' : $ok=1;
		break;
	case 'image/png' : $ok=1;
		break;
}

if($ok && $error=='0'){
 move_uploaded_file($tmp_name,'up/'.$name); // �ƶ��ļ�
 echo "�ϴ��ɹ�";
}
}


?>
<p>
	1.<br>
	form ���� enctype Ĭ��Ϊ application/x-www-form-urlencoded ���������ϴ���<br>
	enctype="multipart/form-data"   ���ñ���MIME����
	<hr>
	<!--form enctype="multipart/form-data" method="post" name="upform" action="">
		
		<input name="upfile" type="file">
		<input type="submit" value="�ϴ�" name="submit>"
	</form-->
	<hr>
	2.<br>
	$_FILES ϵͳ����
	<?
		print_r($_FILES["upfile"]);
	?>
	 Array <br>
	 ( <br>
		[name] => �ͻ���ԭ�ļ�����<br>
		[type] => �ļ���MIME����  ���硱image/gif��<br>
		[tmp_name] => �洢����ʱ�ļ���  һ����ϵͳĬ��<br>
		[error] => 4  <br>
		[size] => 0 ���ϴ����ļ���С<br>
	) <br>
	error:<br>
		0;�ļ��ϴ��ɹ�<br>
		1���������ļ���С php.ini�����õ�<br>
		2���������ļ���С MAX_FILE_SIZE ѡ��ָ����ֵ<br>
		3: �ļ�ֻ�в��ֱ��ϴ�<br>
		4��û���ļ����ϴ�<br>
		5: �ϴ����ļ���СΪ0<br>
	<hr>
	3.<br>
		move_uploaded_file(��ʱ�ļ���Ŀ���ļ�λ��);// �ϴ����ƶ��ļ���Ŀ��λ��<br>
	4.<br>
		is_uploaded_file(MIME) // �ж��ϴ�MIME���͵��ļ�<br>
		
</p>