<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header('Access-Control-Allow-Headers: Origin, Content-Type');
header('Content-Type: application/json');

$db = mysqli_connect('localhost', 'root', '', 'login');
$username = $_POST['username'];
$password = $_POST['password'];
$sql = "SELECT * FROM users WHERE username = '".$username."' AND password = '".$password."'";
$result = mysqli_query($db, $sql);
$count = mysqli_num_rows($result);
if ($count == 1) {
  echo json_encode("Success");
} else {
  echo json_encode("Error");
}
?>
