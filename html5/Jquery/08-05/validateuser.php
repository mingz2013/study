<?
	$name = $_POST['uname'];
	if(!preg_match("^[a-z0-9_]+$", $name)){
		echo "Invalid User name";
	}

?>