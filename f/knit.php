<?php 
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header('Access-Control-Allow-Headers: Origin, Content-Type');
header('Content-Type: application/json');
//   $db = "test_db"; //database name
//   $dbuser = "root"; //database username
//   $dbpassword = "root"; //database password
//   $dbhost = "localhost"; //database host
$db = mysqli_connect('localhost', 'root', '', 'login');

  $return["error"] = false;
  $return["message"] = "";

//   $link = mysqli_connect($dbhost, $dbuser, $dbpassword, $db);
  //connecting to database server

  $val = isset($_POST["roleid"]) && isset($_POST["hole"])
         && isset($_POST["niddle"]) && isset($_POST["countmix"]);

  if($val){
       //checking if there is POST data

       $roleid= $_POST["roleid"]; //grabing the data from headers
       $hole = $_POST["hole"];
       $niddle = $_POST["niddle"];
       $countmix = $_POST["countmix"];

       //validation name if there is no error before
       if($return["error"] == false && strlen($roleid) < 3){
           $return["error"] = true;
           $return["message"] = "Enter name up to 3 characters.";
       }

       //add more validations here

       //if there is no any error then ready for database write
       if($return["error"] == false){
            $roleid = mysqli_real_escape_string($db, $roleid);
            $hole = mysqli_real_escape_string($db, $hole);
            $niddle = mysqli_real_escape_string($db, $niddle);
            $countmix = mysqli_real_escape_string($db, $countmix);
            //escape inverted comma query conflict from string

            $sql = "INSERT INTO knit SET
                                roleid = '$roleid',
                                hole = '$hole',
                                niddle  = '$niddle',
                                countmix = '$countmix'";
            //student_id is with AUTO_INCREMENT, so its value will increase automatically

            $res = mysqli_query($db, $sql);
            if($res){
                //write success
            }else{
                $return["error"] = true;
                $return["message"] = "Database error";
            }
       }
  }else{
      $return["error"] = true;
      $return["message"] = 'Send all parameters.';
  }

  mysqli_close($link); //close mysqli

  header('Content-Type: application/json');
  // tell browser that its a json data
  echo json_encode($return);
  //converting array to JSON string
?>