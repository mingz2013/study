<p>图片打水印，</p>
<hr>
php水印原理和流程<br>
<p>
	imagecreatefrom*     * 为 gif jpeg png wbmp string 图片载入函数<br>
	imagecreatefromgif('123.gif');  ----使用格式<br>
	<br>
	图片合并函数 imagecopy(Dimg,Simg,int x, int y, int src_x, int src_y, int src_w, int src_h)	<br>
	------------------原始图片-小图片---x-y坐标------新图片的x,y---------------宽高-------------<br>
	<br>
	图片剪切函数<br>
	imagecopyresized(resource dst_image,resource src_image, 			<br>
					int dst_x, int dst_y, int src_x, int src_y,			<br>
					int dst_w, int dst_h, int src_w,int src_h);			<br>
</p>
<?
	$image='Desert.jpg';
	$img=getimagesize($image); // 载入图片
	print_r($img);echo "<br>";
	
	switch($img[2])
	{
	case 1:
		$im=@imagecreatefromgif($imge);break;
	case 2:
		$im=@imagecreatefromjpeg($image);break;
	case 3:
		$im=@imagecreatefrompng($image);break;
	}
	
	
	$image='001.jpg';
	$ing=getimagesize($logo); // 载入图片
	print_r($ing);echo "<br>";
	
	switch($ing[2])
	{
	case 1:
		$in=@imagecreatefromgif($logo);break;
	case 2:
		$in=@imagecreatefromjpeg($logo);break;
	case 3:
		$in=@imagecreatefrompng($logo);break;
	}
	
	imagecopy($im,$in,400,3,0,0,168,111);
	$te2 = imagecolorallocate($im, rand(0,255), rand(0,255), rand(0,255));
	$str = iconv("gb2312","UTF-8","新年快乐");//确定要绘制的中文
	imagettftext($im,12,0,20,20,$te, 'aimhei.ttf',$str);
	
	
	// 剪切<br>
	$ni=imagecreatetruecolor(500,500);
	imagecopyresized($nev,$in,0,0,0,0,500,500,$img[0],$img[1]);
	
	
	header("content-type:image/jpeg");
	if(imagejpeg($nev,'新图片.jpg'))
	{
		echo "水印成功<br>";
	}
?>