<font color=red size=20>��η�ֹע�뼰������ȫ</font>
<hr>
<b>1.phpע��Ļ���ԭ��</b><br>
����Ա��ˮƽ������β�룬�൱��һ���ֳ���Ա�ڱ�д�����ʱ��û�ж��û��������ݵĺϷ��Խ����жϣ�ʹӦ�ó�����ڰ�ȫ�������û������ύһ�����ݿ��ѯ���룬���ݳ��򷵻صĽ�������ĳЩ�����֪�����ݣ��������ν��<font color=red>SQL Injection</font>����SQLע�룬��Ӱ���ϵͳ��������Ĳ��������м��͹��˵�ϵͳ<br>
<b>SQLע��Ĺ��̣�</b><br>
��������������ͨ����ַ����һЩ��Ҫ�Ĳ������磺<b>PHP.php?id=<font color=red>2</font></b> ҳ�������ǻ�ʹ�� 2 д�뵽SQL�����<br>
���������<font color=red>Select * from Table where id = 2 </font><br>
������Ƕ�SQL�����Ϥ����֪�� 2 ���ǿ����滻��������Ҫ��SQL��䣬�磺<font color=red>and exist(select id from admin)</font> <br>
<hr>
<b>2.��ֹע��ļ��ַ���</b><br>
��ʵԭ������������Ҫ����һЩ���ǳ����Ĺؼ��ֺͷ����磺<br>
Select insert update delete and * �ȵ�<br>
���ӣ�<br><font color=red>
funciton inject_check($sql_str)<br>
{<br>
	return eregi('select|insert|update|delete|\'|\/\*|\*|\.\.\/|\.\/|union|into|load_file|outfile',$sql_str); // ���й���<br>
}</font><br>
����ͨ��ϵͳ�����Ĺ����������<br>
<font color=red>addslashes(��Ҫ�����˵�����);</font><br>
<hr>
<b>3.php�����ط���ȫ����</b><br>

1.register_globals=off ����Ϊ�ر�״̬<br>
2.SQL�����дʱ������Ҫʡ��С���ź͵�����,<font color=red size=5>С���ţ�ESC������ļ��������ţ�˫���������</font><br>
<b>
Select * from Table where id = 2 <font color=red>���淶</font><br>
select * from `Table` where `id` = '2' <font color=red>�淶</font><br>
</b>
3.��ȷ��ʹ��$_POST $_GET $_SESSION �Ƚ��ղ����������Թ���<br>
4.������ݿ��������ɣ�����һЩ��Ҫ���ֶοɸ��ݳ����ص�����<br>
5.���ڳ��÷������Է�װ������ֱ�ӱ�¶SQL���<br>
<hr>
