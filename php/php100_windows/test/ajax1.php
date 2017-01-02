<?
	if($id = $_GET['id'])
	{
		for($i = 1; $i < 10; $i++)
		{
			echo $id;
			sleep(1);
		}
		exit();
	}

?>
