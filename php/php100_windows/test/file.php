<p style="color:blue">php����HTML�ļ���ԭ��</p>
<hr>
<p>
	fopen(�ļ������򿪷�ʽ) // R-ֻ�� W-д�� A����д<br>
	fread(�ļ�������λ��) // ����λ�� �� �ֽ�Ϊ��λ<br>
	filesize(�ļ���)<br>
	fwrite(�ļ�����д��de����)<br>
	fclose(�ļ���)<br>
	<br>
	unlink(�ļ���)// ɾ���ļ�<br>
	mkdir(Ŀ¼)// ɾ��Ŀ¼<br>
	<hr>
</p>
<?
	$newtitle = "�±���";
	$newcon = "������";
	$newfile = "new.htm";
	
	
	$fp = fopen("tmp.htm","r"); // ��ģ��
	$str = fread($fp, filesize("tmp.htm")); // ��ȡ�ļ�
	
	$str = str_replace("{title}",$newtitle,$str);
	$str = str_replace("{content}",$newcon,$str); // �滻
	
	fclose($fp);
	
	$handle = fopen($newfile,"w");
	fwrite($handle,$str);
	fclose($handle);
	echo "���ɳɹ�<br>";
?>