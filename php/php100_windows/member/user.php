<?
	include("config.php");
	
	// ���� + ���� -������md5���� = ��������
	echo md5("admin".ALL_PS)," admin<br>";
	echo md5("admin2".ALL_PS)," admin2<br>";
	if($_POST['submit'])
	{
		$username=str_replace(" ","",$_POST['username']);
		$sql="SELECT * FROM `user_list` WHERE `username` = '$username'";
		$query=mysql_query($sql); echo $query;
		$us=is_array($row=mysql_fetch_array($query));
		$ps = $us ? md5($_POST['password'].ALL_PS) == $row['password'] : FALSE ;
		if($ps)
		{
			$_SESSION['uid'] = $row['uid'];
			$_SESSION['user_shell'] = md5($row['username'].$row['password'].ALL_PS);
			$_SESSION['times']=mktime();
			echo "��½�ɹ�<br>";
		}
		else
		{
			echo "�û����������<br>";
			session_destroy();// ��������session
		}
	}


?>
<form action="" method="post">
	�û�����<input type="text" name="username" style="height:23px"/><br>
	��  �룺<input type="password" name="password" style="height:23px"/><br>
	��֤�룺<input type="code" name="code" size="10" style="height:23px"/>
	<img src="imgcode.php">
	<br><br>
	<input type="submit" name="submit" value="��½"/>
</form>
<hr><hr>
<font color=red size=20>��Աϵͳ�Ŀ������ϣ�</font><br>
<hr>
��½->�ж�->����״̬->�ж�Ȩ��<br>
��Աϵͳ�İ�ȫ<br>
1.ѧ��ʹ�ó������md5�İ�ȫ��<br>
2.cookie seaaion ����������Ϣ<br>
3.session ��ȫ��Ҫ����cookie<br>
4.ʹ��cookie session ��ȡ��Ϣ���������ж���Ϣ<br>
5.cookie session ����Ҫ����<br>
6.���ڴ�����Ϣ��ʱ����cookie session <br>
<hr>
<font color=red size=20>��Աϵͳ�Ŀ������£�</font><br>
<hr>
��ͬ�û����ʲ�ͬҳ��Ȩ�޵Ĵ���<br>
˳�Ƽ����㴦��:
���Ȩ�� -> ��һ�� -�� �ζ��� -�� ������-��������<br>
�޽��棬ʵ��˳��Ȩ�޿��ƣ���ʵ�ֶ�㣬Ҳ������һ����Զ������һ���Ȩ�ޣ����������԰壬CMS����̨��̳�ȳ����У����ʺ���ERP��OA������ϵͳ��ʹ��<br>
���ü��ɣ�Ϊ��ʵ��Ȩ�� �����޲㼶���ã���߲�Ӧʹ����Сֵ����Ȩ�ޱ�־λ���������п��������ۼƵĿռ�<br>
��Ա��¼��ʱ<br>
mktime(int hour,int minute, int second, int month, int day, int year, int[is_dst]);			<br>
ͨ������ʱ�䣬�������ʱ�䳬ʱ���߳���ʹ��mktime�Ǹ��ܺõ�ʱ����㺯�������Է���ļ���ʱ����С��λ����<br>
