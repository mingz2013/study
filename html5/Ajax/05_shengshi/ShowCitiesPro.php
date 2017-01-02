  <?php

	//服务器端

	//这里两句话很重要,第一讲话告诉浏览器返回的数据是xml格式
	header("Content-Type: text/xml;charset=utf-8");
	//告诉浏览器不要缓存数据
	header("Cache-Control: no-cache");


	//接收用户的选择的省的名字

	$province=$_POST['province'];
	//如何在调试过程中，看到接收到的数据 。输出到一个文件中 查看
	file_put_contents("d:/mylog.log",$province."\r\n",FILE_APPEND);
	
	//到数据库去查询省有那些城市(现在先不到数据库)
	$info="";
	if($province=="zhejiang"){
		
		$info="<province><city>杭州</city><city>温州</city><city>宁波</city></province>";
	}else if($province=="jiangsu"){
		$info="<province><city>南京</city><city>徐州</city><city>苏州</city></province>";
	}
		

	echo $info;

?>
