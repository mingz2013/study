<?php
// 本类由系统自动生成，仅供测试用途
class AdminAction extends Action {
    public function index(){
		$links = array(
	   		array('id'=>1, 'text'=>'管理首页', 'link'=>'#'),
			array('id'=>2, 'text'=>'专业建设', 'link'=>'#1'),
			array('id'=>2, 'text'=>'师资队伍', 'link'=>'#2'),
			array('id'=>2, 'text'=>'教学工作', 'link'=>'#3'),
			array('id'=>2, 'text'=>'学生培养', 'link'=>'#4'),
			array('id'=>2, 'text'=>'科研教研', 'link'=>'#5'),
			array('id'=>2, 'text'=>'实验环境', 'link'=>'#6'),
			array('id'=>2, 'text'=>'河北省网络技能大赛', 'link'=>'#7')
		);
		$this->assign('links', $links);									// 模板变量赋值	   
		$this->display();												// 输出模板
	}
	

	
	

}
?>