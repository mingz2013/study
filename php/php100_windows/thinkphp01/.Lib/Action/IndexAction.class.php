<?php
// 本类由系统自动生成，仅供测试用途
class IndexAction extends Action {
    public function index(){
        header("Content-Type:text/html; charset=utf-8");
        echo '<div style="font-weight:normal;color:blue;float:left;width:345px;text-align:center;border:1px solid silver;background:#E8EFFF;padding:8px;font-size:14px;font-family:Tahoma">^_^ Hello,欢迎使用<span style="font-weight:bold;color:red">ThinkPHP</span></div>';
        echo '修改控制器';
       
       // 数据库
       $thinkphp01 = new Thinkphp01Model();
       //$list = $thinkphp01->find(1); // 这里有个错误？？？？
       //print_r($list);
       
       $this->assign("title","MingZz");
       $this->display();
       
    }
   /* 
    public function show() {
		echo "我新建的方法";
	}
	*/
}