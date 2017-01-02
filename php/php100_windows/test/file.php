<p style="color:blue">php生成HTML文件的原理</p>
<hr>
<p>
	fopen(文件名，打开方式) // R-只读 W-写入 A—读写<br>
	fread(文件，结束位置) // 结束位置 以 字节为单位<br>
	filesize(文件名)<br>
	fwrite(文件名，写入de内容)<br>
	fclose(文件名)<br>
	<br>
	unlink(文件名)// 删除文件<br>
	mkdir(目录)// 删除目录<br>
	<hr>
</p>
<?
	$newtitle = "新标题";
	$newcon = "新内容";
	$newfile = "new.htm";
	
	
	$fp = fopen("tmp.htm","r"); // 打开模板
	$str = fread($fp, filesize("tmp.htm")); // 读取文件
	
	$str = str_replace("{title}",$newtitle,$str);
	$str = str_replace("{content}",$newcon,$str); // 替换
	
	fclose($fp);
	
	$handle = fopen($newfile,"w");
	fwrite($handle,$str);
	fclose($handle);
	echo "生成成功<br>";
?>