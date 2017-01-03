<?
	//phpinfo();      /*php������Ϣ*/
					//ע��
					#ע��
	echo "hello word";
	echo "<br>aaa<br>";
	
?>

<?php echo "php";  ?>

<script language="php">  echo "script"; </script>
<style type="text/css">
	body{
	color:white;
	}
</style>
<html>
	<body bgcolor=#ccc >
		<p>����һ������</p>
		<?
			echo "����һ��php�ű�<br>";
			$a=1;
			echo "a+1=";
			echo $a+1;
			echo "<br>";
		?>
		<font color=yellow>�����</font>
		<br><br>
		<p>---------------------------------------------<br>
			��������:<br>
			boolean(������) $bo=true;<br>
			integer(����)<br>
			float(������)<br>
			string(�ַ���)<br>
			array(����)   $ar=array(1,2,3,4);   $ar=array("A"=>1,"B"=>2);<br>
			--------------------------------------------------
		</p>
		<p>-----------------------------------------------------<br>
			��������:<br>
					��������<br>
					��ֵ����<br>
					�Ƚ�����<br>
					�߼�����<br>
					�����ݼ�����<br>
			<?
				echo 6*(5-12);
				echo "<br>";
				
				$a=1;
				$a+=2;
				$a*=3;
				echo $a;
				echo "<br>";
				
				echo "a:";
				echo 1==2; echo "  b:";
				echo 3!=2; echo "  c:";
				echo 5<3;  echo "  d:";
				echo "ok"=="ok";echo "  e:";
				echo 1==='1'; //
				echo "<br>";
				
				echo "a:";
				echo 1&&1;echo "  b:";
				echo 0&&1;echo "  c:";
				echo 1||1;echo "  d:";
				echo 1||0;
				echo "<br>";
			?>
		<br>--------------------------------------------------------
		</p>
		<p>-----------------------------------------------------<br>
			<?
				echo "����:<br>";
				$arr1 = array("id"=>2, "title"=>3);
				echo $arr1["title"];echo "<br>";
				echo $arr1['id'];echo "<br>";
				
				$arr = array(3, 5, 7, 9, 6, "abc");
				print_r($arr);echo "<br>";
				echo $arr[0];echo "<br>";
				echo $arr[5];echo "<br>";
				
				$arr2 = array(array(1, 2), array(3, 4));
				print_r($arr2);echo "<br>";
				echo $arr2[1][0];echo "<br>";
				
				echo count($arr); // �����С
				echo "<br>";
				echo is_array($arr);  // �Ƿ�������
				echo "<br>";
				
				//explode("key", value);  // ��������	
				$a = "1986-1983-1980";
				$arr3 = explode("-",$a);  // ��ֳ�����
				print_r($arr3);echo "<br>";
				
				/*
				foreach($arr3 as $key => $value)
				{
				}
				*/
				foreach($arr3 as $key => $value)
				{
					echo $value;
					echo "-";
					echo $key;
					echo "<br>";
				}
			?>
		<br>--------------------------------------------------------
		</p>
		<p>-----------------------------------------------------<br>
			
			php������<br>
			<?
			$a=date("Y-m-d");
			echo $a; // ȡ�÷�������ǰ����
			echo "<br>";
			$b=md5("let");
			echo $b;
			echo "<br>";
			
			$b=90;
			function func_name($val)
			{
				global $b; // ����ȫ�ֱ���
				echo "<br>hello function<br>";
				echo $val;echo "<br>",$b,"<br>";
			}
			echo function_exists('func_name'); // �жϺ����Ƿ����
			func_name("hello");
			echo "a","<br>","b","<br>";
		?>
		<br>--------------------------------------------------------
		</p>
		<p>-----------------------------------------------------<br>
			
		�������ݿ�����һ���ļ��ڽ���<br>
		<br>--------------------------------------------------------
		</p>
	</body>
</html>