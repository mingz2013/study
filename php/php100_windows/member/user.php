<?
	include("config.php");
	
	// 密码 + 常量 -》进行md5加密 = 最终密码
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
			echo "登陆成功<br>";
		}
		else
		{
			echo "用户或密码错误<br>";
			session_destroy();// 销毁所有session
		}
	}


?>
<form action="" method="post">
	用户名：<input type="text" name="username" style="height:23px"/><br>
	密  码：<input type="password" name="password" style="height:23px"/><br>
	验证码：<input type="code" name="code" size="10" style="height:23px"/>
	<img src="imgcode.php">
	<br><br>
	<input type="submit" name="submit" value="登陆"/>
</form>
<hr><hr>
<font color=red size=20>会员系统的开发（上）</font><br>
<hr>
登陆->判断->保持状态->判断权限<br>
会员系统的安全<br>
1.学会使用常量提高md5的安全性<br>
2.cookie seaaion 少用明文信息<br>
3.session 安全性要大于cookie<br>
4.使用cookie session 读取信息尽量增加判断信息<br>
5.cookie session 内容要精简<br>
6.对于错误信息及时销毁cookie session <br>
<hr>
<font color=red size=20>会员系统的开发（下）</font><br>
<hr>
不同用户访问不同页面权限的处理<br>
顺势级别多层处理:
最高权限 -> 次一级 -》 次二级 -》 次三级-》。。。<br>
无交叉，实现顺序权限控制，可实现多层，也就是上一层永远大于下一层的权限，常用在留言板，CMS，后台论坛等程序当中，不适合在ERP，OA等类型系统中使用<br>
设置技巧：为了实现权限 的无限层级配置，最高层应使用最小值来做权限标志位，方便下行可用无线累计的空间<br>
会员登录超时<br>
mktime(int hour,int minute, int second, int month, int day, int year, int[is_dst]);			<br>
通过动作时间，如果动作时间超时便踢出！使用mktime是个很好的时间计算函数，可以方便的计算时间差，最小单位是秒<br>
