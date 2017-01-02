<?
// 记录访问次数 流量
$file_name="03.txt";
$fp = fopen($file_name, "r");
$count = fread($fp, filesize($file_name));
fclose($fp);

$count++;

$fp = fopen($file_name, "w");
fwrite($fp, $count);
fclose($fp);
echo "document.write('".$count."')";
?>