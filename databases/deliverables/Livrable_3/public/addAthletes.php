<?php require_once "registerPartener.php"; ?>

<?php



$athlete_id= "";
$athlete_name = "";
$athlete_gender = "";
$athlete_dob ="";
$athlete_email="";
$event_name ="";



    if (isset($_POST['INSCRIPTION'])){


      $dbname = $_POST['dbname'];
      $dbusername = $_POST['dbusername'];
      $dbpassword = $_POST['dbpassword'];
         

      $athlete_id= $_POST['athlete_id'];
      $athlete_name =$_POST['athlete_name'];
      $athlete_gender =$_POST['athlete_gender'];
      $athlete_dob =$_POST['athlete_dob'];
      $athlete_email=$_POST['athlete_email'];
      $competition_id = $_POST['competition_id'];

      
      $dbconn = pg_connect("host=localhost port=5432 dbname=$dbname  user=$dbusername password=$dbpassword") or die('failed');



      $query1 = "INSERT INTO athletes (id,name, gender, dob,email) VALUES ($athlete_id,'$athlete_name','$athlete_gender','$athlete_dob','$athlete_email')";

      $query2 = "INSERT INTO registrations (competition_id,athlete_id,  gender) VALUES ($competition_id,$athlete_id,'$athlete_gender')";

      $run1 = pg_query($dbconn,$query1);
      $run2 = pg_query($dbconn,$query2);
      
      if ($run1 == TRUE){
      	echo "YES";
      }
      else {
      	echo "Merde";
      }

    }












?>