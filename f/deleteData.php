<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header('Access-Control-Allow-Headers: Origin, Content-Type');
header('Content-Type: application/json');
	include 'conn.php';
	$id=$_POST['id'];
	$connect->query("DELETE FROM knit1 WHERE id=".$id);

?>