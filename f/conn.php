<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header('Access-Control-Allow-Headers: Origin, Content-Type');
header('Content-Type: application/json');

$connect = new mysqli('localhost', 'root', '', 'login');
// $db = mysqli_connect('localhost', 'root', '', 'login');

if($connect){
	 
}else{
	echo "Connection Failed";
	exit();
}