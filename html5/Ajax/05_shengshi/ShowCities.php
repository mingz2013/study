<html>
<head>
<title>省市联动案例(如何动态的从服务器取得数据)</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8"/>
<script type="text/javascript">


	//创建ajax引擎
	function getXmlHttpObject(){
		
		var xmlHttpRequest;
		//不同的浏览器获取对象xmlhttprequest 对象方法不一样
		if(window.ActiveXObject){
			
			xmlHttpRequest=new ActiveXObject("Microsoft.XMLHTTP");
			
		}else{

			xmlHttpRequest=new XMLHttpRequest();
		}

		return xmlHttpRequest;

	}

	var myXmlHttpRequest="";

	function getCities(){

		myXmlHttpRequest=getXmlHttpObject();

		if(myXmlHttpRequest){
		
			var url="/test/Ajax/05_shengshi/ShowCitiesPro.php";//post
			var data="province="+$('sheng').value;

			myXmlHttpRequest.open("post",url,true);//异步方式

			myXmlHttpRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded");

			//指定回调函数
			myXmlHttpRequest.onreadystatechange=chuli;

			//发送
			myXmlHttpRequest.send(data);
		}
	}

	function chuli(){
		if(myXmlHttpRequest.readyState==4){
			
			if(myXmlHttpRequest.status==200){
				
				//取出值,根据返回信息的格式定.text
				window.alert("服务器返回"+myXmlHttpRequest.responseText);
				//取出服务器回送的数据

				var cities=myXmlHttpRequest.responseXML.getElementsByTagName("city");
				window.alert(cities.length);
				$('city').length=0;
				var myOption=document.createElement("option");
				myOption.value="";
				myOption.innerText="--城市--";
				//添加到
				$('city').appendChild(myOption);

				//遍历并取出城市
				for(var i=0;i<cities.length;i++){
					
					var city_name=cities[i].childNodes[0].nodeValue;
					window.alert(city_name);
					//创建新的元素option
					var myOption=document.createElement("option");
					myOption.value=city_name;
					myOption.innerText=city_name;
					//添加到
					$('city').appendChild(myOption);
				}
				
			}
		}
	}


	//这里我们写一个函数
	function $(id){
		return document.getElementById(id);
	}

</script>
</head>
<body>
	<select id="sheng" onchange="getCities();">
		<option value="">---省---</option>
		<option value="zhejiang">浙江</option>
		<option value="jiangsu" >江苏</option>
		<option value="sichuan" >四川</option>
    </select>
    <select id="city">
		<option value="">--城市--</option>
    </select>
    
    <select id="county">
		<option value="">--县城--</option>
    </select>

</body>
</html>
