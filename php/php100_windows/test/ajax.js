var xmlHttp;

function S_xmlhttprequest()
{
	if(window.ActiveXObject) // IE���ĵ������
	{
		xmlHttp = new ActiveXObject('Microsoft.XMLHTTP');
	}
	else if(window.XMLHttpRequest) // ����ķ���
	{
		xmlHttp = new XmlHTTPRequest(); 
	}
} 

function funphp100(url)
{
	S_xmlhttprequest();
	xmlHttp.open("GET","ajax1.php?id="+url,true); // ��
	xmlHttp.onreadystatechange = byphp;
	xmlHttp.send(null);

}
function funphp101()
{
	var f = document.myform.user.value;
	//alert(f);
	S_xmlhttprequest();
	xmlHttp.open("GET","ajax2.php?id="+f,true); // ��
	xmlHttp.onreadystatechange = byphp;
	xmlHttp.send(null);

}

function byphp()
{
	if(xmlHttp.readyState==1)
	{
		document.getElementById('php100').innerHTML = "<img src='1.png' >"; 
	}
	if(xmlHttp.readyState==4)
	{
		if(xmlHttp.status==200)
		{
			var byphp100 = xmlHttp.responseText;
			document.getElementById('php100').innerHTML = byphp100; // 
		}
	}
}