
<font color=red size=20>ajax</font><br>
<hr>
Ajax ��HTML��javascript TM������DHTML��DOM��ɣ�<br>
��һ�ܳ��ķ������Խ���׾��web����ת���ɽ����Ե�AjaxӦ�ó���<br>
HTMLҳ�� <-------�����ű�--------> JS�ű� <-----��Ӧ---------ִ��-----> PHP�ļ�	<br>
<hr>
2.����XMLHttpRequest����<br>
���ĵ�һ������<br>
<br>
js���룺<br>
xmlHttp = new XMLHttpRequest(); //	����ڹ淶��js֧�ֵ������������û��ģ�ǡǡ�෴IEȴ�Ͳ�֧�֣�<br>									
xmlHttp = new ActiveXObject('Microsoft.XMLHTTP');	//	����û�취������ֻ�������ж��ٴ���һ��IE֧�ֵ�<br>
<hr>
3.XMLHttpRequest������ط���<br>
������XMLHttpRequest.open(���ݷ�ʽ,��ַ,�Ƿ��첽����);	<br>
׼������ִ�У�XMLHttpRequest.onreadystatechange				<br>
��ȡִ�н����XMLHttpRequest.responseText					<br>
<hr>
ʵ����<br>
<hr>
<script type="text/javascript" src="ajax.js"></script>


<a href="#" onclick="funphp100('o')">o</a>
<a href="#" onclick="funphp100('t')">t</a>
<a href="#" onclick="funphp100('x')">x</a>

<div id="php100"></div>
<hr><hr>
<font color=red size=20>Ajax+PHP����ȴ�������Ч��������</font><br>
<hr>
1.���泣������<br>
(1)js��������<br>
<hr>
2.����XHP.readyState����״̬ == ״̬��0,1,2,3,4��<br>
	0������δ��ʼ������û�е���open������<br>
	1:�����Ѿ����������ǻ�û�з��ͣ���û�е���send����<br>
	2:�����ѷ��ͣ����ڴ����У�ͨ�����ڿ��Դ���Ӧ�л�ȡ����ͷ��<br>
	3:�����ڴ����У�ͨ����Ӧ�����в������ݿ����ˣ�û��ȫ����ɣ�<br>
	4����Ӧ����ɣ������Ի�ȡ��ʹ�÷���������Ӧ��<br>
<hr>
3����XHR.status�����ļ���״̬<br>
	XHR.status == 200,300,404��<br>
	200���ɹ�<br>
	404:û�з����ļ�����ѯ��URI<br>
	500:�����������ڲ�����<br>
<hr>
4�ȴ����� Sleep(��)
<hr><hr>
<font color=red size=20>Ajax����û������ʼ�������</font><br>
<hr>
1.Ajax����ʵ���û������ԭ��<br>
2.ѧϰHTML�ļ��ִ���<br>
3.��λ�ȡ���е���������<br>
<hr>
�����û��� -> �����ؼ� -> �����д���� -> ajax���� -> ��ѯ���ݿ� -> ���ؽ�� -> DOM��Ӧ��ҳ�� 	<br>

document.myform.myinput.value  // ��ȡ������<br>
<hr>
<form action="" name="myform" method="post">
	�û�����<input type="text" name="user" onblur="funphp101()"/>
</form>
<div id="php101"></div>