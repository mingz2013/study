<?
	//phpinfo();      /*php配置信息*/
					//注释
					#注释
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
		<p>这是一个段落</p>
		<?
			echo "这是一个php脚本<br>";
			$a=1;
			echo "a+1=";
			echo $a+1;
			echo "<br>";
		?>
		<font color=yellow>你好吗</font>
		<br><br>
		<p>---------------------------------------------<br>
			数据类型:<br>
			boolean(布尔型) $bo=true;<br>
			integer(整型)<br>
			float(浮点型)<br>
			string(字符串)<br>
			array(数组)   $ar=array(1,2,3,4);   $ar=array("A"=>1,"B"=>2);<br>
			--------------------------------------------------
		</p>
		<p>-----------------------------------------------------<br>
			运算类型:<br>
					算术运算<br>
					赋值运算<br>
					比较运算<br>
					逻辑运算<br>
					递增递减运算<br>
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
				echo "数组:<br>";
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
				
				echo count($arr); // 数组大小
				echo "<br>";
				echo is_array($arr);  // 是否是数组
				echo "<br>";
				
				//explode("key", value);  // 创建数组	
				$a = "1986-1983-1980";
				$arr3 = explode("-",$a);  // 拆分成数组
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
			
			php函数：<br>
			<?
			$a=date("Y-m-d");
			echo $a; // 取得服务器当前日期
			echo "<br>";
			$b=md5("mingzi");
			echo $b;
			echo "<br>";
			
			$b=90;
			function func_name($val)
			{
				global $b; // 引用全局变量
				echo "<br>hello function<br>";
				echo $val;echo "<br>",$b,"<br>";
			}
			echo function_exists('func_name'); // 判断函数是否存在
			func_name("hello");
			echo "a","<br>","b","<br>";
		?>
		<br>--------------------------------------------------------
		</p>
		<p>-----------------------------------------------------<br>
			
		连接数据库在下一个文件内讲解<br>
		<br>--------------------------------------------------------
		</p>
	</body>
</html>