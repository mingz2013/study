<?php
include("smarty_inc.php");// 引入配置文件

$name="MingZz";
$smarty->assign("title", $name);


$names[]=array("name"=>"新闻第一条", "date"=>"2013-05-06");
$names[]=array("name"=>"新闻第二条", "date"=>"2013-05-06");
$names[]=array("name"=>"新闻第三条", "date"=>"2013-05-06");
$names[]=array("name"=>"新闻第四条", "date"=>"2013-05-06");
$names[]=array("name"=>"新闻第五条", "date"=>"2013-05-06");
$smarty->assign("titles", $names);

/**
 * 介绍常用的20个常用变量符 
capitalize[首字母大写]
count_characters[计算字符数]
cat[连接字符串]
count_paragraphs[计算段落数]
count_sentences[计算局数]
count_words[计算词数]
date_format[时间格式]
default[默认]
escape[转码]
indent[缩进]
lower[小写]
nl2br[换行符替换成<br/>]
regex_replace[正则替换]
replace[替换]
spacify[插空]
string_format[字符串格式化]
strip[去除（多余空格）]
strip_tags[去除html标签]
truncate[截取]
upper[大写]
wordwrap[行宽约束]
*/

$value = "it is work, and ,it Is MingZz work";
$smarty->assign("name", $value);



$values=array(4,8,5,2,6,5,4,8,6);
$smarty->assign("values", $values);





$smarty->display("index.htm");	


?>