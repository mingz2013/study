<?	session_start();		$conn = mysql_connect('localhost', 'root', '') or die("���������Ӵ���");	mysql_select_db('member', $conn) or die("���ݿ����Ӵ���");		// ���峣��	define(ALL_PS, "let");		function user_shell($uid,$shell,$m_id)	{		$sql="SELECT * FROM `user_list` WHERE `uid` = '$uid'";		$query=mysql_query($sql); echo $query;		$us=is_array($row=mysql_fetch_array($query));		$shell = $us ? $shell == md5($row['username'].$row['password'].ALL_PS):FALSE;		if($shell)		{			if($row['m_id']<=$m_id)			{				return $row;			}			else			{				echo "���Ȩ�޲���<br>";				exit();			}		}		else		{			echo "����Ȩ�޷��ʸ�ҳ<br>";			exit();		}	}		function user_mktime($onlinetime)	{		$new_time=mktime();		if($new_time-$onlinetime > '3600')		{			echo "��½��ʱ<br>";			exit();			session_destroy();		}		else		{			$_SESSION['times']=mktime();		}	}?>