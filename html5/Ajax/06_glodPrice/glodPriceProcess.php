<?php

	
	//这里两句话很重要,第一讲话告诉浏览器返回的数据是xml格式
	header("Content-Type: text/html;charset=utf-8");
	//告诉浏览器不要缓存数据
	header("Cache-Control: no-cache");

	//接收

	$cities=$_POST['city'];

	file_put_contents("d:/mylog.log",$cities."\r\n",FILE_APPEND);
	
	//随机的生成 三个 500-2000间数
	//$res='[{"price":"400"},{"price":"1000"},{"price":"1200"}]';
	
	$res='[';


	for($i=0;$i<count($cities);$i++){
		
		if($i==count($cities)-1){
			$res.='{"cityname":"'.$cities[$i].'" ,"price":"'.rand(500,1500).'"}]';
		}else{
			
			$res.='{"cityname":"'.$cities[$i].'" ,"price":"'.rand(500,1500).'"},';
		}

	}

	file_put_contents("d:/mylog.log",$res."\r\n",FILE_APPEND);

	echo $res;


?>
