<p style="color:blue">上传</p><hr>
<form action="" enctype="multipart/form-data" method="post" name="upform">
  上传文件:
  <input name="upfile" type="file">
  <input type="submit" value="上传"><br>
 </form>
<?
if (is_uploaded_file($_FILES['upfile']['tmp_name'])){

$upfile=$_FILES["upfile"];

$name = $upfile["name"];
$type = $upfile["type"];
$size = $upfile["size"];
$tmp_name = $upfile["tmp_name"];
$error = $upfile["error"];


switch ($type) {          // 限制文件类型
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
 move_uploaded_file($tmp_name,'up/'.$name); // 移动文件
 echo "上传成功";
}
}


?>
<p>
	1.<br>
	form 属性 enctype 默认为 application/x-www-form-urlencoded 不能用于上传，<br>
	enctype="multipart/form-data"   设置表单的MIME编码
	<hr>
	<!--form enctype="multipart/form-data" method="post" name="upform" action="">
		
		<input name="upfile" type="file">
		<input type="submit" value="上传" name="submit>"
	</form-->
	<hr>
	2.<br>
	$_FILES 系统函数
	<?
		print_r($_FILES["upfile"]);
	?>
	 Array <br>
	 ( <br>
		[name] => 客户端原文件名称<br>
		[type] => 文件的MIME类型  例如”image/gif“<br>
		[tmp_name] => 存储的临时文件名  一般是系统默认<br>
		[error] => 4  <br>
		[size] => 0 已上传的文件大小<br>
	) <br>
	error:<br>
		0;文件上传成功<br>
		1；超过了文件大小 php.ini中设置的<br>
		2；超过了文件大小 MAX_FILE_SIZE 选项指定的值<br>
		3: 文件只有部分被上传<br>
		4：没有文件被上传<br>
		5: 上传的文件大小为0<br>
	<hr>
	3.<br>
		move_uploaded_file(临时文件，目标文件位置);// 上传后移动文件到目标位置<br>
	4.<br>
		is_uploaded_file(MIME) // 判断上传MIME类型的文件<br>
		
</p>