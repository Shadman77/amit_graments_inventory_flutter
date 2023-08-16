<?php

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header('Access-Control-Allow-Headers: Origin, Content-Type');
header('Content-Type: application/json');


$db = mysqli_connect('localhost','root','','login');
if(!$db)
{
	echo "Database connection failed";
}
$username = $_POST['username'];
$password = $_POST['password'];

$sql = "SELECT username FROM users WHERE username = '".$username."'";
$result = mysqli_query($db,$sql);
$count = mysqli_num_rows($result);
if($count == 1){
	echo json_encode("Error");
}else{
	$insert = "INSERT INTO users(username,password) VALUES ('".$username."','".$password."')";
		$query = mysqli_query($db,$insert);
		if($query){
			echo json_encode("Success");
		}
}
?>
