<?
	
	header("Content-type:application/vnd.ms-excel");// ����������ļ�����<br>
	header("Content-Disposition:filename=csv_excel.xls");//����������ļ���<br>
	/*
		<font color=red size=20>php���csv��excel</font>
		<hr>
		1.����headerͷ�������ʽ<br>
		header("Content-type:application/vnd.ms-excel");// ����������ļ�����<br>
		header("Content-Disposition:filename=csv_excel.xls");//����������ļ���<br>
		<br>
		2.��������֧�ֵĸ�ʽ<br>
		(1)֧����ͨ��ʽ��csv�ı��淶���Կո�ͻ�����ʶ��<br>
		���ã�\t \n ���հ׺ͻ���<br>
		(2)֧�ּ򵥵�HTML����ͱ��淶<br>
		���ã�table�淶�����ϲ��淶��font��ǩ�淶<br>
		<br>
		ʵ����<br>
	*/
	//echo "A1\t B1\t C1\n";
	//echo "A2\t B2\t C2\n";
	//echo "A3\t B3\t C3\n";
	
?>
<table width="200" border="1">
  <tr>
    <td colspan="3"><font color=red>ͳ�Ʊ�</font></td>
  </tr>
  <tr>
    <td>���</td>
    <td>����</td>
    <td>����</td>
  </tr>
  <tr>
    <td>1</td>
    <td>����</td>
    <td>12</td>
  </tr>
  <tr>
    <td>2</td>
    <td>����</td>
    <td>12</td>
  </tr>
  <tr>
    <td>=A3+A4</td>
    <td></td>
    <td>=sum(c3:c4)</td>
  </tr>
</table>


