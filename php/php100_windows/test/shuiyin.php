<p>ͼƬ��ˮӡ��</p>
<hr>
phpˮӡԭ�������<br>
<p>
	imagecreatefrom*     * Ϊ gif jpeg png wbmp string ͼƬ���뺯��<br>
	imagecreatefromgif('123.gif');  ----ʹ�ø�ʽ<br>
	<br>
	ͼƬ�ϲ����� imagecopy(Dimg,Simg,int x, int y, int src_x, int src_y, int src_w, int src_h)	<br>
	------------------ԭʼͼƬ-СͼƬ---x-y����------��ͼƬ��x,y---------------���-------------<br>
	<br>
	ͼƬ���к���<br>
	imagecopyresized(resource dst_image,resource src_image, 			<br>
					int dst_x, int dst_y, int src_x, int src_y,			<br>
					int dst_w, int dst_h, int src_w,int src_h);			<br>
</p>
<?
	$image='Desert.jpg';
	$img=getimagesize($image); // ����ͼƬ
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
	$ing=getimagesize($logo); // ����ͼƬ
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
	$str = iconv("gb2312","UTF-8","�������");//ȷ��Ҫ���Ƶ�����
	imagettftext($im,12,0,20,20,$te, 'aimhei.ttf',$str);
	
	
	// ����<br>
	$ni=imagecreatetruecolor(500,500);
	imagecopyresized($nev,$in,0,0,0,0,500,500,$img[0],$img[1]);
	
	
	header("content-type:image/jpeg");
	if(imagejpeg($nev,'��ͼƬ.jpg'))
	{
		echo "ˮӡ�ɹ�<br>";
	}
?>