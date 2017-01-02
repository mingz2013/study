<html>
	<head>
		<meta http-equiv="content-type" content="text/html;charset=utf-8"/>
		<link href="Untitled-1.css" rel="stylesheet" type="text/css" />
		<script src="my.js" type="text/javascript"></script>
		<script type="text/javascript">
		
	
			var myXmlHttpRequest;

			function updateGoldPrice(){
				
				
				myXmlHttpRequest=getXmlHttpObject();

				if(myXmlHttpRequest){
				
					
					//创建ajax引擎成功
					var url="glodPriceProcess.php";
					var data="city[]=dj&city[]=tw&city[]=ld";

					myXmlHttpRequest.open("post",url,true);

					myXmlHttpRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded");

					myXmlHttpRequest.onreadystatechange=function chuli(){
						
						//接收数据json 
						if(myXmlHttpRequest.readyState==4){
							if(myXmlHttpRequest.status==200){
							
								//取出并转成对象数组
								var res_objects=eval("("+myXmlHttpRequest.responseText+")");

								$('dj').innerText=res_objects[0].price;
								$('tw').innerText=res_objects[1].price;
								$('ld').innerText=res_objects[2].price;

							}
						}	

					}
					myXmlHttpRequest.send(data);


					

				}

			}

			//使用定时器 每隔5 秒
			window.setInterval("updateGoldPrice()",5000);
		
			
		</script>
	</head>
	<center>
		<h1>每隔5秒中更新数据(以1000为基数计算涨跌)</h1>
	<table border=0 class="abc">
		<tr><td colspan="3"><img src="gjhj_bj_tit.gif" /></td></tr>
		<tr ><td>市场</td><td>最新价格$</td><td>涨跌</td></tr>
		<tr><td>伦敦</td><td id="ld">788.7</td><td><img src="down.gif" />211.3</td></tr>
		<tr><td>台湾</td><td id="tw">854.0</td><td><img src="down.gif" />146.0</td></tr>
		<tr><td>东京</td><td id="dj">1791.3</td><td><img src="up.gif" />791.3</td></tr>
	</table>
</center>
</html>
