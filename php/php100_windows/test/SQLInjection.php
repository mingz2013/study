<font color=red size=20>如何防止注入及开发安全</font>
<hr>
<b>1.php注入的基本原理</b><br>
程序员的水平及经验参差不齐，相当大一部分程序员在编写代码的时候，没有对用户输入数据的合法性进行判断，使应用程序存在安全隐患，用户可以提交一段数据库查询代码，根据程序返回的结果，获得某些他想得知的数据，这就是所谓的<font color=red>SQL Injection</font>，即SQL注入，受影响的系统：对输入的参数不进行检查和过滤的系统<br>
<b>SQL注入的过程：</b><br>
正常来讲，我们通过地址接收一些必要的参数，如：<b>PHP.php?id=<font color=red>2</font></b> 页面中我们会使用 2 写入到SQL语句中<br>
正常情况：<font color=red>Select * from Table where id = 2 </font><br>
如果我们队SQL语句熟悉，就知道 2 我们可以替换成我们需要的SQL语句，如：<font color=red>and exist(select id from admin)</font> <br>
<hr>
<b>2.防止注入的几种方法</b><br>
其实原来就是我们需要过滤一些我们常见的关键字和符合如：<br>
Select insert update delete and * 等等<br>
例子：<br><font color=red>
funciton inject_check($sql_str)<br>
{<br>
	return eregi('select|insert|update|delete|\'|\/\*|\*|\.\.\/|\.\/|union|into|load_file|outfile',$sql_str); // 进行过滤<br>
}</font><br>
或者通过系统函数的过滤特殊符号<br>
<font color=red>addslashes(需要被过滤的内容);</font><br>
<hr>
<b>3.php其他地方安全设置</b><br>

1.register_globals=off 设置为关闭状态<br>
2.SQL语句书写时尽量不要省略小引号和单引号,<font color=red size=5>小引号：ESC键下面的键，单引号：双引号下面的</font><br>
<b>
Select * from Table where id = 2 <font color=red>不规范</font><br>
select * from `Table` where `id` = '2' <font color=red>规范</font><br>
</b>
3.正确的使用$_POST $_GET $_SESSION 等接收参数，并加以过滤<br>
4.提高数据库命名技巧，对于一些重要的字段可根据程序特点命名<br>
5.对于常用方法加以封装，避免直接暴露SQL语句<br>
<hr>
