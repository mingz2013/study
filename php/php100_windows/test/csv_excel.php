<?
	
	header("Content-type:application/vnd.ms-excel");// 定义输出的文件类型<br>
	header("Content-Disposition:filename=csv_excel.xls");//定义输出的文件名<br>
	/*
		<font color=red size=20>php输出csv和excel</font>
		<hr>
		1.定义header头部输出格式<br>
		header("Content-type:application/vnd.ms-excel");// 定义输出的文件类型<br>
		header("Content-Disposition:filename=csv_excel.xls");//定义输出的文件名<br>
		<br>
		2.输出编码和支持的格式<br>
		(1)支持普通格式的csv文本规范，以空格和换行来识别<br>
		常用：\t \n 填充空白和换行<br>
		(2)支持简单的HTML代码和表哥规范<br>
		常用：table规范，表格合并规范，font标签规范<br>
		<br>
		实例：<br>
	*/
	//echo "A1\t B1\t C1\n";
	//echo "A2\t B2\t C2\n";
	//echo "A3\t B3\t C3\n";
	
?>
<table width="200" border="1">
  <tr>
    <td colspan="3"><font color=red>统计表单</font></td>
  </tr>
  <tr>
    <td>编号</td>
    <td>姓名</td>
    <td>年龄</td>
  </tr>
  <tr>
    <td>1</td>
    <td>张三</td>
    <td>12</td>
  </tr>
  <tr>
    <td>2</td>
    <td>李四</td>
    <td>12</td>
  </tr>
  <tr>
    <td>=A3+A4</td>
    <td></td>
    <td>=sum(c3:c4)</td>
  </tr>
</table>


