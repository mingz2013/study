<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>网络工程系</title><link href="/phptest/Public/css/common.css" rel="stylesheet" type="text/css" /><script src="/phptest/Public/js/jquery-1.8.3.min.js" type="text/javascript"></script><script src="/phptest/Public/js/d1.js" type="text/javascript"></script></head><body><div class="centerstyle" id="head"><span id="title">网络工程系</span></div><div class="centerstyle" id="daohang"><ul  ><!-- 循环标签--><?php if(is_array($links)): $i = 0; $__LIST__ = $links;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li><a class="class1" href="<?php echo ($vo["link"]); ?>"><?php echo ($vo["text"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?></ul></div><hr/><div><div id="cebian"><span id="lmdh">栏目导航</span><ul ><!-- 循环标签--><?php if(is_array($links)): $i = 0; $__LIST__ = $links;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li><a class="class1" href="<?php echo ($vo["link"]); ?>"><?php echo ($vo["text"]); ?></a><ul ></ul></li><?php endforeach; endif; else: echo "" ;endif; ?></ul></div><div class="centerstyle" id="zhengwen"></div></div></body></html>