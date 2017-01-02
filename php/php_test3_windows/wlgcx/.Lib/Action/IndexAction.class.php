<?php
// 本类由系统自动生成，仅供测试用途
class IndexAction extends Action {
    public function index(){
		$links = array(
	   		array('id'=>1, 'text'=>'首页', 'link'=>'#'),
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
	
	public function show(){
		
		//$article = new Model('article');
		
		$href = $_POST['href'];
		
		if(!isset($href)){
			$res ='{"retcode":"1", "list":[]}';
			echo $res;
			return;
		};
		
		if($href == '#'){
			$res ='{"retcode":"0", "list":[]}';
		}else if($href == '#1'){
			$res ='{"retcode":"0","list":[{"name":"网络工程", "link":"#11"},{"name":"信息安全辅修专业",  "link":"#12"},{"name":"培养计划", "link":"#13"}]}';
			
		}else if($href == '#2'){
			$res ='{"retcode":"0", "list":[]}';
			
		}else if($href == '#3'){
			$res ='{"retcode":"0", "list":[{"name":"精品课程", "link":"#31"},{"name": "实习实践", "link":"#32"},{"name":"毕业设计", "link":"#33"}]}';
			
		}else if($href == '#4'){
			$res ='{"retcode":"0", "list":[{"name":"师生共建", "link":"#41"},{"name": "就业考研", "link":"#42"}]}';
			
		}else if($href == '#5'){
			$res ='{"retcode":"0", "list":[]}';
		}else if($href == '#6'){
			$res ='{"retcode":"0", "list":[]}';
		}else if($href == '#7'){
			$res ='{"retcode":"0", "list":[]}';
		}else{
			$res ='{"retcode":"1", "list":[]}';
		}
		echo $res;
	}
	public function show1(){
		
		$article = new Model('article');
		
		$href = $_POST['href'];
		
		if(!isset($href)){
			$res ='{"retcode":"1", "list":[]}';
			
		}else{
		
		$show = $article->query("SELECT `id`, `classname` , `title` , `lastchangetime` , `welcomenumber` FROM article WHERE ( `class` = '".$href."' )");
		//print_r($show);echo '<br/>';
		$num = count($show);
		file_put_contents("d:/mylog.log",$num."\r\n",FILE_APPEND);
		if($num == 0){$res ='{"retcode":"1", "list":[]}';echo $res; return;};
		$res ='{"retcode":"0", "class2":{"class":"'.$show[0][classname].'","titlelist":[';
		
		//echo $res.'<br/>';
		//echo $show[0][classname].'<br/>';
		for($i = 0; $i < $num-1; $i++){
			$res.='{"id":"'.$show[$i][id].'","title":"'.$show[$i][title].'", "lasttime":"'.$show[$i][lastchangetime].'", "welcomenumber":"'.$show[$i][welcomenumber].'"},';
		}
		$res.='{"id":"'.$show[$num-1][id].'","title":"'.$show[$num-1][title].'", "lasttime":"'.$show[$num-1][lastchangetime].'", "welcomenumber":"'.$show[$num-1][welcomenumber].'"}]}}';
		
		
		}
		echo $res;
	
	
	}
	public function show2(){
		
		$article = new Model('article');
		
		$href = $_POST['href'];
		file_put_contents("d:/mylog.log",$href."href\r\n",FILE_APPEND);
		if(!isset($href)){
			$res ='{"retcode":"1", "list":[]}';
			
		}else{
		
		$show = $article->query("SELECT `title`, `content` FROM article WHERE ( `id` = '".$href."' )");
		//print_r($show);echo '<br/>';
		$num = count($show);
		file_put_contents("d:/mylog.log",$num."\r\n",FILE_APPEND);
		if($num == 0){$res ='{"retcode":"1", "list":[]}';echo $res; return;};
		$res ='{"retcode":"0", "class2":{"title":"'.$show[0][title].'","content":"'.$show[0][content].'"}}';
		
		
		
		
		}
		echo $res;
	
	
	}
}
?>